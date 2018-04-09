
// steps: if no filter -> (1) selected harbours, (2) harbours max year,
// (3) A (and/or 4) all sub fam, (5) tot flux (or exp + imp) [, (6) term, (7) pol_pod]


import $ from 'jquery';
import 'select2';

// import '../packs/map'


// HARBOURS

// select2 field only
// $ = document.querySelectorAll(...) for jquery plugin, and call select2 on it
$('#select2_harbours').select2({
    placeholder: "Ecrivez ou sélectionnez pour filtrer",
    allowClear: true
});
// Requiring CSS == importing CSS! Path is relative to ./node_modules
// CSS included in JS (not in asset pipeline) and available in / compiled by Webpack
import 'select2/dist/css/select2.css';

// event listener for each new selected harbour
$('#select2_harbours').on("select2:select", (event) => {
// take ALL the (un)selected harbour // submit form
// build data in hash
  let values = [];
  $(event.currentTarget).find("option:selected").each(function(i, selected){
    values[i] = $(selected).text();
  });
  console.log("harbours after selected = " + values);
  // call ajax get
  $.get({
    url: '/harbours',
    dataType: "script",
    data: buildData() //harbourSelected}
  });
});

// event listener for each new UNselected harbour
$('#select2_harbours').on("select2:unselect", (event) => {
// take ALL the (un)selected harbour
  let values = [];
  $("#select2_harbours").find("option:selected").each(function(i, selected){
    values[i] = $(selected).text();
  });
  console.log("harbours after unselected = " + values);
  // call ajax get
  $.get({
    url: '/harbours',
    dataType: "script",
    data: {name: values}
  });
});


// YEARS

$('#select2_years').select2({ // TBU for each filter
    placeholder: "Ecrivez ou sélectionnez pour filtrer",
    allowClear: true
});
import 'select2/dist/css/select2.css';

// event listener for each new selected year
$('#select2_years').on("select2:select", (event) => { // TBU for each filter
// take ALL the (un)selected year
  let values = [];
  $(event.currentTarget).find("option:selected").each(function(i, selected){
    values[i] = $(selected).text();
  });
  console.log("years after selected = " + values);
  // call ajax get
  $.get({
    url: '/harbours',
    dataType: "script",
    data: {year: values} // TBU for each filter
  });
});

// event listener for each new UNselected year
$('#select2_years').on("select2:unselect", (event) => { // TBU for each filter
// take ALL the (un)selected year
  let values = [];
  $(event.currentTarget).find("option:selected").each(function(i, selected){
    values[i] = $(selected).text();
  });
  console.log("years after unselected = " + values);
  // call ajax get
  $.get({
    url: '/harbours',
    dataType: "script",
    data: {year: values} // TBU for each filter
  });
});



  // console.log(event);
  // console.log(event.params);
  // console.log(event.params.data);
  // var harbourSelected = event.params.data.text;
  // console.log(harbourSelected); // -> bayonne  -> OK


###########################


class Harbour < ApplicationRecord
  has_many :movements, dependent: :nullify # custom TBD for archive

  has_many :types, through: :movements

  validates :country, presence: true
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true

  geocoded_by :full_address
  after_validation :geocode #:address_changed?

  YEAR_MAX = Movement.maximum("year") # to be updated with selharbours?

  def full_address
    "#{address}, #{country}"
  end

  def self.filter_by_harbour(params, harbours)
    # binding.pry
    @selected_harbours = []
    if (params[:name])
      params[:name].each do |h|
        @selected_harbours << harbours.where(name: h).first
      end
    else
      @selected_harbours = harbours
    end
    return @selected_harbours
  end

  # above == functional

  def totvol_filter(params)
    # no sum, just filter selected lines
    # steps: if no filter -> (1) selected harbours, (2) harbours max year,
    # (3) A (and/or 4) all sub fam, (5) tot flux (or exp + imp) [, (6) term, (7) pol_pod]

    # -> (1) from feature
    self.vol_filter_by_year(params) # -> (2)
    self.vol_filter_by_family(params) # -> (3) without (4)
    self.vol_filter_by_flow(params) # -> (5)
    @totvol = @mvt_flow.pluck(:volume).sum
  end

  def vol_filter_by_year(params)
    # binding.pry
    @mvts_year = []
    if (params[:year])
      params[:year].each do |y|
        @mvts_year << self.movements.where(year: y)
      end
    else
      # (2a) find max -> Model.maximum(column_name, options = {}) -> YEAR_MAX
      # (2b) # for console self == Harbour.last + need initialize @ + << .first and .last
      @mvts_year = self.movements.where(year: YEAR_MAX)
      # @mvts_year = Harbour.last.movements.where(year: year_max) # for console only (small seeds)
    end
    return @mvts_year
  end

  def vol_filter_by_family(params)
    # (3) without (4)
    if (params[:code]) # can only have 1 familly code, no .each needed
      @mvts_fam = @mvts_year.select do |m|
        m.where(code: params[:code]) # can include tot, imp, exp mvts
      end
      # end
    else
      @mvts_fam = [] # ok with no filter
      # binding.pry
      @mvts_year.to_a.flatten.each do |m|
        if m.type.code == "a"  # or b, c, d, e => code.length == 1
          @mvts_fam << m
        end
      end
    end
    return @mvts_fam
  end

  def vol_filter_by_flow(params)
    # (5)
    if (params[:flow] == ( "imp" || "exp" )) # can be either tot, imp or exp mvt
      @mvt_flow = @mvts_fam.select do |m|
         m.where(flow: params[:flow]) # can include only 1 flow
      end
    else
      @mvt_flow = @mvts_fam.select do |m|
        if m.type.flow.include?("tot")
          m.where(type: {flow: "tot"})
        else
          @mvts_fam
        end
      end
    end
    return @mvt_flow
  end

    # # (4)
    # params[:code].each do |code|
    #   unless code.length == 1 #except a, b, c, d, e
    #     @mvts_subfam = @fams_mvt
    #   end

  # def self.tot_vol_max
  #   tot_vol_all = []
  #   @selected_harbours.each do |h|
  #     tot_vol_all << h.total_filter(params)
  #   end
  #   @tot_vol_max = tot_vol_all.max
  # end

end

# NOTES:
# .pluck = .map in pur SQL

###########################



class Harbour < ApplicationRecord
  has_many :movements, dependent: :nullify # custom TBD for archive

  has_many :types, through: :movements

  validates :country, presence: true
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true

  geocoded_by :full_address
  after_validation :geocode #:address_changed?

  YEAR_MAX = Movement.maximum("year") # to be updated with selharbours?

  def full_address
    "#{address}, #{country}"
  end

  def self.filter_by_harbour(params, harbours)
    @selected_harbours = []
    if (params[:name])
      params[:name].each do |h|
        @selected_harbours << harbours.where(name: h).first
      end
    else
      @selected_harbours = harbours
    end
    return @selected_harbours
  end

  # above == functional

  def totvol_filter(params)
    # no sum, just filter selected lines
    # steps: if no filter -> (1) selected harbours, (2) harbours max year,
    # (3) A (and/or 4) all sub fam, (5) tot flux (or exp + imp) [, (6) term, (7) pol_pod]

    # -> (1) from feature
    self.vol_filter_by_year(params) # -> (2)
    self.vol_filter_by_family(params) # -> (3) without (4)
    self.vol_filter_by_flow(params) # -> (5)
    @totvol = @mvt_flow.pluck(:volume).sum
  end

  def vol_filter_by_year(params)
    @mvts_year = []
    if (params[:year])
      params[:year].each do |y|
        @mvts_year << self.movements.where(year: y)
      end
    else
      # (2a) find max -> Model.maximum(column_name, options = {}) -> YEAR_MAX
      # (2b) # for console self == Harbour.last + need initialize @ + << .first and .last
      @mvts_year = self.movements.where(year: YEAR_MAX)
      # @mvts_year = Harbour.last.movements.where(year: year_max) # for console only (small seeds)
    end
    return @mvts_year
  end

  def vol_filter_by_family(params)
    # (3) without (4)
    @mvts_fam = []
    if (params[:code]) # can only have 1 familly code, no .each needed
      @mvts_year.each do |m|
        @mvts_fam << m.where(code: params[:code]) # can include tot, imp, exp mvts
      end
      # end
    else
      @mvts_year.each do |m|
        if m.type.code == "a"  # or b, c, d, e => code.length == 1
          @mvts_fam << m
        end
      end
    end
    return @mvts_fam
  end

  def vol_filter_by_flow(params)
    # (5)
    @mvt_flow = []
    if (params[:flow] == ( "imp" || "exp" )) # can be either tot, imp or exp mvt
      @mvts_fam.each do |m|
        @mvt_flow = m.where(flow: params[:flow]) # can include only 1 flow
      end
    else
      @mvts_fam.each do |m|
        if m.type.flow.include?("tot")
          @mvt_flow << m.where(type: {flow: "tot"})
        else
          @mvt_flow = @mvts_fam
        end
      end
    end
    return @mvt_flow
  end

    # # (4)
    # params[:code].each do |code|
    #   unless code.length == 1 #except a, b, c, d, e
    #     @mvts_subfam = @fams_mvt
    #   end

  # def self.tot_vol_max
  #   tot_vol_all = []
  #   @selected_harbours.each do |h|
  #     tot_vol_all << h.total_filter(params)
  #   end
  #   @tot_vol_max = tot_vol_all.max
  # end

end

# NOTES:
# .pluck = .map in pur SQL


##########################

# Order.where(subscription_ends_at: param_date).
#   joins(:member).
#   where.not('subscription_starts_at >= ?', param_date.to_date + 1.day))
#   where(members: {mandate_status: ['SUBMITTED', 'ACTIVE'], automatic_renewal: true})




  # def confirm_tot_flow(mvt)
  #   [mvt.type.imp.volume + mvt.type.exp.volume, mvt.type.tot.volume].max
  # end

      # NA # select each harbour from selected_harbours
      # NA # selharbours.each do |h|

  # harbour.movements.types.where(flow: flow, code: code) # total sum to calculate

  # def sum_tot_vol_by_type(code, flow)
  #   self.movements.group(:code (&?) :flow).where(code: code, flow: flow).pluck(:volume).sum
  # end



  # def self.vol_filter_by_family(params, harbours)
  #   @filtered_by_code = []
  #   if (params[:code])
  #     params[:code].each do |c|
  #       @filtered_by_code << @selected_harbours.map do |h|
  #         h.movements.select do |movement|
  #           movement.types.where(code: c)
  #       end
  #     end
  #   else
  #     @filtered_by_code = where.[code: "a"]
  #   end
  #   return filtered_by_code
  # end

  # def self.filter_by_year(params, harbours)
  #   @filtered_by_year = []
  #   if (params[:year])
  #     params[:year].each do |y|
  #       @filtered_by_year << @harbours.map do |harbour|
  #         harbour.movement.where(year: y)
  #       end
  #     end
  #   else
  #     filtered_by_year = [Movement.maximum("year")]
  #   end
  #   return filtered_by_year
  # end

  # def filter_by_flow
  #   filtered_by_flow = []
  #   if (params[:flow])
  #     filtered_by_flow = @harbours.map do |harbour|
  #       harbour.movements.select do |movement|
  #         movement.types.where(flow: params[:flow])
  #       end
  #     end
  #   else
  #     filtered_by_flow = ["tot"]
  #   end
  #   return filtered_by_flow
  # end
