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
    @criterias = {}
    self.vol_filter_by_year(params) # -> (2)
    self.vol_filter_by_family(params) # -> (3) without (4)
    self.vol_filter_by_flow(params) # -> (5)
    @totvol = movements.where(@criterias).pluck(:volume).sum
  end

  def vol_filter_by_year(params)
    # binding.pry
    @criterias[:year] = if (params[:year])
      params[:year]
    else
      YEAR_MAX
    end
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
