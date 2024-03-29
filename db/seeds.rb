# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Starting seed for DEV ENV"

Movement.destroy_all
Harbour.destroy_all # commented until google api access denied solved
Type.destroy_all
# User.destroy_all
puts "DB cleaned"

example = User.find_or_create_by(
    email: "user@example.com"
    )
example.password = "password"
puts "Added user@example.com"

# Harbour

puts "Creating harbours seeds"
ajaccio = Harbour.create!(
  country: "France",
  name: "ajaccio",
  address: "ajaccio"
  )
sleep(0.5)
bastia = Harbour.create!(
  country: "France",
  name: "bastia",
  address: "bastia"
  )
sleep(0.5)
bayonne = Harbour.create!(
  country: "France",
  name: "bayonne",
  address: "bayonne"
  )
puts "done harbours seeds"

# Type

puts "Creating types seeds"

a111exp = Type.create!( code: "a111", flow: "exp", label: "petrole brut" )
a111imp = Type.create!( code: "a111", flow: "imp", label: "petrole brut" )
a112exp = Type.create!( code: "a112", flow: "exp", label: "produits raffines" )
a112imp = Type.create!( code: "a112", flow: "imp", label: "produits raffines" )
a113exp = Type.create!( code: "a113", flow: "exp", label: "gaz naturel" )
a113imp = Type.create!( code: "a113", flow: "imp", label: "gaz naturel" )
a11exp = Type.create!( code: "a11", flow: "exp", label: "hydrocarbures" )
a11imp = Type.create!( code: "a11", flow: "imp", label: "hydrocarbures" )
a12exp = Type.create!( code: "a12", flow: "exp", label: "VL hors hydrocarbures" )
a12imp = Type.create!( code: "a12", flow: "imp", label: "VL hors hydrocarbures" )
a1exp = Type.create!( code: "a1", flow: "exp", label: "vrac liquide" )
a1imp = Type.create!( code: "a1", flow: "imp", label: "vrac liquide" )
a21exp = Type.create!( code: "a21", flow: "exp", label: "cereales" )
a21imp = Type.create!( code: "a21", flow: "imp", label: "cereales" )
a22exp = Type.create!( code: "a22", flow: "exp", label: "nourriture animale" )
a22imp = Type.create!( code: "a22", flow: "imp", label: "nourriture animale" )
a23exp = Type.create!( code: "a23", flow: "exp", label: "charbon" )
a23imp = Type.create!( code: "a23", flow: "imp", label: "charbon" )
a24exp = Type.create!( code: "a24", flow: "exp", label: "minerais" )
a24imp = Type.create!( code: "a24", flow: "imp", label: "minerais" )
a25exp = Type.create!( code: "a25", flow: "exp", label: "engrais" )
a25imp = Type.create!( code: "a25", flow: "imp", label: "engrais" )
a26exp = Type.create!( code: "a26", flow: "exp", label: "autres vracs solides" )
a26imp = Type.create!( code: "a26", flow: "imp", label: "autres vracs solides" )
a2exp = Type.create!( code: "a2", flow: "exp", label: "vrac solide" )
a2imp = Type.create!( code: "a2", flow: "imp", label: "vrac solide" )
a311exp = Type.create!( code: "a311", flow: "exp", label: "conteneur lolo (T)" )
a311imp = Type.create!( code: "a311", flow: "imp", label: "conteneur lolo (T)" )
a312exp = Type.create!( code: "a312", flow: "exp", label: "conteneur roro (T)" )
a312imp = Type.create!( code: "a312", flow: "imp", label: "conteneur roro (T)" )
a31exp = Type.create!( code: "a31", flow: "exp", label: "conteneur (T)" )
a31imp = Type.create!( code: "a31", flow: "imp", label: "conteneur (T)" )
a321exp = Type.create!( code: "a321", flow: "exp", label: "roro fret (T)" )
a321imp = Type.create!( code: "a321", flow: "imp", label: "roro fret (T)" )
a322exp = Type.create!( code: "a322", flow: "exp", label: "roro tare (T)" )
a322imp = Type.create!( code: "a322", flow: "imp", label: "roro tare (T)" )
a323exp = Type.create!( code: "a323", flow: "exp", label: "vehicule roulant (T)" )
a323imp = Type.create!( code: "a323", flow: "imp", label: "vehicule roulant (T)" )
a32exp = Type.create!( code: "a32", flow: "exp", label: "roro hors cntr (T)" )
a32imp = Type.create!( code: "a32", flow: "imp", label: "roro hors cntr (T)" )
a33exp = Type.create!( code: "a33", flow: "exp", label: "conventionel et colis lourd" )
a33imp = Type.create!( code: "a33", flow: "imp", label: "conventionel et colis lourd" )
a3exp = Type.create!( code: "a3", flow: "exp", label: "non vrac" )
a3imp = Type.create!( code: "a3", flow: "imp", label: "non vrac" )
aexp = Type.create!( code: "a", flow: "exp", label: "tonnage brut total" )
aimp = Type.create!( code: "a", flow: "imp", label: "tonnage brut total" )
b11exp = Type.create!( code: "b11", flow: "exp", label: "cntr vide 20' (nb)" )
b11imp = Type.create!( code: "b11", flow: "imp", label: "cntr vide 20' (nb)" )
b12exp = Type.create!( code: "b12", flow: "exp", label: "cntr vide 40' (nb)" )
b12imp = Type.create!( code: "b12", flow: "imp", label: "cntr vide 40' (nb)" )
b13exp = Type.create!( code: "b13", flow: "exp", label: "cntr vide entre 20' et 40' (nb)" )
b13imp = Type.create!( code: "b13", flow: "imp", label: "cntr vide entre 20' et 40' (nb)" )
b14exp = Type.create!( code: "b14", flow: "exp", label: "cntr vide > 40' (nb)" )
b14imp = Type.create!( code: "b14", flow: "imp", label: "cntr vide > 40' (nb)" )
b1exp = Type.create!( code: "b1", flow: "exp", label: "cntr vide (nb)" )
b1imp = Type.create!( code: "b1", flow: "imp", label: "cntr vide (nb)" )
b21exp = Type.create!( code: "b21", flow: "exp", label: "cntr plein 20' (nb)" )
b21imp = Type.create!( code: "b21", flow: "imp", label: "cntr plein 20' (nb)" )
b22exp = Type.create!( code: "b22", flow: "exp", label: "cntr plein 40' (nb)" )
b22imp = Type.create!( code: "b22", flow: "imp", label: "cntr plein 40' (nb)" )
b23exp = Type.create!( code: "b23", flow: "exp", label: "cntr plein entre 20' et 40' (nb)" )
b23imp = Type.create!( code: "b23", flow: "imp", label: "cntr plein entre 20' et 40' (nb)" )
b24exp = Type.create!( code: "b24", flow: "exp", label: "cntr plein > 40' (nb)" )
b24imp = Type.create!( code: "b24", flow: "imp", label: "cntr plein > 40' (nb)" )
b2exp = Type.create!( code: "b2", flow: "exp", label: "cntr plein (nb)" )
b2imp = Type.create!( code: "b2", flow: "imp", label: "cntr plein (nb)" )
bexp = Type.create!( code: "b", flow: "exp", label: "conteneur (nb)" )
bimp = Type.create!( code: "b", flow: "imp", label: "conteneur (nb)" )
c1exp = Type.create!( code: "c1", flow: "exp", label: "vide (EVP)" )
c1imp = Type.create!( code: "c1", flow: "imp", label: "vide (EVP)" )
c2exp = Type.create!( code: "c2", flow: "exp", label: "plein (EVP)" )
c2imp = Type.create!( code: "c2", flow: "imp", label: "plein (EVP)" )
cexp = Type.create!( code: "c", flow: "exp", label: "Conteneur (EVP)" )
cimp = Type.create!( code: "c", flow: "imp", label: "Conteneur (EVP)" )
d1exp = Type.create!( code: "d1", flow: "exp", label: "pax hors croisieres" )
d1imp = Type.create!( code: "d1", flow: "imp", label: "pax hors croisieres" )
d2exp = Type.create!( code: "d2", flow: "exp", label: "pax croisieres tete de ligne" )
d2imp = Type.create!( code: "d2", flow: "imp", label: "pax croisieres tete de ligne" )
d3exp = Type.create!( code: "d3", flow: "exp", label: "pax croisieres escale" )
d3imp = Type.create!( code: "d3", flow: "imp", label: "pax croisieres escale" )
dexp = Type.create!( code: "d", flow: "exp", label: "passagers" )
dimp = Type.create!( code: "d", flow: "imp", label: "passagers" )
eexp = Type.create!( code: "e", flow: "exp", label: "navires (nb)" )
eimp = Type.create!( code: "e", flow: "imp", label: "navires (nb)" )

puts "done types seeds"

# Movement

# # puts "Creating movements seeds"

# Movement.create!( harbour: ajaccio, type: aexp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 76037)
# Movement.create!( harbour: ajaccio, type: aimp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 24688)
# Movement.create!( harbour: ajaccio, type: a1exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 20786)
# Movement.create!( harbour: ajaccio, type: a1imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a11exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 20786)
# Movement.create!( harbour: ajaccio, type: a11imp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a111exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a111imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a112exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 19312)
# Movement.create!( harbour: ajaccio, type: a112imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a113exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 1474)
# Movement.create!( harbour: ajaccio, type: a113imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a12exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a12imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a2exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 2459)
# Movement.create!( harbour: ajaccio, type: a2imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a21exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a21imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a22exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a22imp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a23exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a23imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a24exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a24imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a25exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a25imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a26exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 2459)
# Movement.create!( harbour: ajaccio, type: a26imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a3exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 52792)
# Movement.create!( harbour: ajaccio, type: a3imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 24688)
# Movement.create!( harbour: ajaccio, type: a31exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a31imp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a311exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a311imp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a312exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a312imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a32exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 52792)
# Movement.create!( harbour: ajaccio, type: a32imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 24688)
# Movement.create!( harbour: ajaccio, type: a321exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 28982)
# Movement.create!( harbour: ajaccio, type: a321imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 2980)
# Movement.create!( harbour: ajaccio, type: a322exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 17658)
# Movement.create!( harbour: ajaccio, type: a322imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 16415)
# Movement.create!( harbour: ajaccio, type: a323exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 6152)
# Movement.create!( harbour: ajaccio, type: a323imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 5293)
# Movement.create!( harbour: ajaccio, type: a33exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: a33imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: bexp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: bimp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: b1exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: b1imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: b11exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: b11imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: b12exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: )
# Movement.create!( harbour: ajaccio, type: b12imp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: )
# Movement.create!( harbour: ajaccio, type: b13exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: )
# Movement.create!( harbour: ajaccio, type: b13imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: )
# Movement.create!( harbour: ajaccio, type: b14exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: )
# Movement.create!( harbour: ajaccio, type: b14imp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: )
# Movement.create!( harbour: ajaccio, type: b2exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: b2imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: b21exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: b21imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: b22exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: )
# Movement.create!( harbour: ajaccio, type: b22imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: )
# Movement.create!( harbour: ajaccio, type: b23exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: )
# Movement.create!( harbour: ajaccio, type: b23imp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: )
# Movement.create!( harbour: ajaccio, type: b24exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: )
# Movement.create!( harbour: ajaccio, type: b24imp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: )
# Movement.create!( harbour: ajaccio, type: cexp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: cimp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: c1exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: c1imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: c2exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: c2imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: dexp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 14822)
# Movement.create!( harbour: ajaccio, type: dimp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 14778)
# Movement.create!( harbour: ajaccio, type: d1exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 12002)
# Movement.create!( harbour: ajaccio, type: d1imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 11960)
# Movement.create!( harbour: ajaccio, type: d2exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 2)
# Movement.create!( harbour: ajaccio, type: d2imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: ajaccio, type: d3exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 2818)
# Movement.create!( harbour: ajaccio, type: d3imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 2818)
# Movement.create!( harbour: ajaccio, type: eexp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 71)
# Movement.create!( harbour: ajaccio, type: eimp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 71)
# Movement.create!( harbour: bastia, type: aexp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 139856)
# Movement.create!( harbour: bastia, type: aimp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 58677)
# Movement.create!( harbour: bastia, type: a1exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 17859)
# Movement.create!( harbour: bastia, type: a1imp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a11exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 17859)
# Movement.create!( harbour: bastia, type: a11imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a111exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a111imp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a112exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 15529)
# Movement.create!( harbour: bastia, type: a112imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a113exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 2330)
# Movement.create!( harbour: bastia, type: a113imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a12exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a12imp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a2exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 1064)
# Movement.create!( harbour: bastia, type: a2imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a21exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a21imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a22exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a22imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a23exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a23imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a24exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a24imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a25exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a25imp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a26exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 1064)
# Movement.create!( harbour: bastia, type: a26imp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a3exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 120933)
# Movement.create!( harbour: bastia, type: a3imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 58677)
# Movement.create!( harbour: bastia, type: a31exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a31imp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a311exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a311imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a312exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a312imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a32exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 120933)
# Movement.create!( harbour: bastia, type: a32imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 58677)
# Movement.create!( harbour: bastia, type: a321exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 74750)
# Movement.create!( harbour: bastia, type: a321imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 12270)
# Movement.create!( harbour: bastia, type: a322exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 36757)
# Movement.create!( harbour: bastia, type: a322imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 37682)
# Movement.create!( harbour: bastia, type: a323exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 9426)
# Movement.create!( harbour: bastia, type: a323imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 8725)
# Movement.create!( harbour: bastia, type: a33exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: a33imp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: bexp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 3595)
# Movement.create!( harbour: bastia, type: bimp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 3630)
# Movement.create!( harbour: bastia, type: b1exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 186)
# Movement.create!( harbour: bastia, type: b1imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 2680)
# Movement.create!( harbour: bastia, type: b11exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 186)
# Movement.create!( harbour: bastia, type: b11imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 2680)
# Movement.create!( harbour: bastia, type: b12exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bastia, type: b12imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bastia, type: b13exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bastia, type: b13imp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bastia, type: b14exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bastia, type: b14imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bastia, type: b2exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 3409)
# Movement.create!( harbour: bastia, type: b2imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 950)
# Movement.create!( harbour: bastia, type: b21exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 3409)
# Movement.create!( harbour: bastia, type: b21imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 950)
# Movement.create!( harbour: bastia, type: b22exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bastia, type: b22imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bastia, type: b23exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bastia, type: b23imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bastia, type: b24exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bastia, type: b24imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bastia, type: cexp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: cimp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: c1exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: c1imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: c2exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: c2imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: dexp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 24028)
# Movement.create!( harbour: bastia, type: dimp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 22888)
# Movement.create!( harbour: bastia, type: d1exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: d1imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: d2exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: d2imp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bastia, type: d3exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 24028)
# Movement.create!( harbour: bastia, type: d3imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 22888)
# Movement.create!( harbour: bastia, type: eexp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 133)
# Movement.create!( harbour: bastia, type: eimp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 133)
# Movement.create!( harbour: bayonne, type: aexp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 116673)
# Movement.create!( harbour: bayonne, type: aimp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 90117)
# Movement.create!( harbour: bayonne, type: a1exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 24535)
# Movement.create!( harbour: bayonne, type: a1imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 9503)
# Movement.create!( harbour: bayonne, type: a11exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 16963)
# Movement.create!( harbour: bayonne, type: a11imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 9503)
# Movement.create!( harbour: bayonne, type: a111exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a111imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 9503)
# Movement.create!( harbour: bayonne, type: a112exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 16963)
# Movement.create!( harbour: bayonne, type: a112imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a113exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a113imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a12exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 7572)
# Movement.create!( harbour: bayonne, type: a12imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a2exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 53801)
# Movement.create!( harbour: bayonne, type: a2imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 20109)
# Movement.create!( harbour: bayonne, type: a21exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a21imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 20109)
# Movement.create!( harbour: bayonne, type: a22exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a22imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a23exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a23imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a24exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a24imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a25exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 36241)
# Movement.create!( harbour: bayonne, type: a25imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a26exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 17560)
# Movement.create!( harbour: bayonne, type: a26imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a3exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 38337)
# Movement.create!( harbour: bayonne, type: a3imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 60505)
# Movement.create!( harbour: bayonne, type: a31exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a31imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a311exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a311imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a312exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a312imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a32exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a32imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a321exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a321imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a322exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a322imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a323exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a323imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a33exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 38337)
# Movement.create!( harbour: bayonne, type: a33imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 60505)
# Movement.create!( harbour: bayonne, type: bexp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: bimp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: b1exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: b1imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: b11exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: b11imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: b12exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bayonne, type: b12imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bayonne, type: b13exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bayonne, type: b13imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bayonne, type: b14exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bayonne, type: b14imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bayonne, type: b2exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: b2imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: b21exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: b21imp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: b22exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bayonne, type: b22imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bayonne, type: b23exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bayonne, type: b23imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bayonne, type: b24exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bayonne, type: b24imp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: )
# Movement.create!( harbour: bayonne, type: cexp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: cimp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: c1exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: c1imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: c2exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: c2imp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: dexp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: dimp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: d1exp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: d1imp, year: 2014, terminal: "terminal 1", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: d2exp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: d2imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: d3exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: d3imp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: eexp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 40)
# Movement.create!( harbour: bayonne, type: eimp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 40)

# # puts "done movements seeds"


puts "Creating MINI movements seeds"

Movement.create!( harbour: ajaccio, type: aexp, year: 2014, terminal: "", pol_pod: "", volume: 76037)
Movement.create!( harbour: ajaccio, type: aimp, year: 2014, terminal: "", pol_pod: "", volume: 24688)
Movement.create!( harbour: bastia, type: aexp, year: 2014, terminal: "", pol_pod: "", volume: 139856)
Movement.create!( harbour: bastia, type: aimp, year: 2014, terminal: "", pol_pod: "", volume: 58677)
Movement.create!( harbour: bayonne, type: aexp, year: 2014, terminal: "", pol_pod: "", volume: 116673)
Movement.create!( harbour: bayonne, type: aimp, year: 2014, terminal: "", pol_pod: "", volume: 90117)

# Movement.create!( harbour: bayonne, type: a1exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 24535)
# Movement.create!( harbour: bayonne, type: a11exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 16963)
# Movement.create!( harbour: bayonne, type: a111exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 0)
# Movement.create!( harbour: bayonne, type: a2exp, year: 2014, terminal: "terminal 2", pol_pod: "marseille", volume: 53801)
# Movement.create!( harbour: bayonne, type: a3exp, year: 2014, terminal: "terminal 4", pol_pod: "marseille", volume: 38337)

Movement.create!( harbour: bayonne, type: eexp, year: 2014, terminal: "terminal 3", pol_pod: "marseille", volume: 40)
Movement.create!( harbour: bayonne, type: eexp, year: 2013, terminal: "terminal 3", pol_pod: "marseille", volume: 13)

puts "done MINI movements seeds"
