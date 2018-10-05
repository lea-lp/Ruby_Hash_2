

#KEYS utilisées pour (presque) tous les HASHS...................................................................................................................
cat_aliment = ["Lipides", "Glucides", "Protéines"]

#VALUES...............................................................................................................................................
num_calories = [9, 4, 4]

num_welsh = [38.4, 18.3, 36.3]
num_frites = [15, 41, 3.4]
num_biere = [0, 25, 4]

#HASHS................................................................................................................................................
CALORIES = Hash[cat_aliment.zip(num_calories)]

WELSH = Hash[cat_aliment.zip(num_welsh)]
FRITES = Hash[cat_aliment.zip(num_frites)]
BIERE = Hash[cat_aliment.zip(num_biere)]

MENU = Hash.new
MENU["WELSH"] = WELSH
MENU["FRITES"] = FRITES
MENU["BIERE"]= BIERE

PRIX = Hash.new
#WELSH.........................
WELSH_PRIX = Hash.new
WELSH_PRIX[:prix] = 15
PRIX["WELSH"] = WELSH_PRIX
#FRITES.........................
FRITES_PRIX = Hash.new
FRITES_PRIX[:prix] = 4
PRIX["FRITES"] = FRITES_PRIX
#BIERE.........................
BIERE_PRIX = Hash.new
BIERE_PRIX[:prix] = 5
PRIX["BIERE"] = BIERE_PRIX


#METHODE 1 : calcul du nombre de calories pour 1 WELSH................................................................................................
def weight_watchers(hash)
  calories_count = 0
  hash.each do |k, v|
    calories_count = v * CALORIES[k] + calories_count
    end
  return calories_count
end

#METHODE 2 : calcul du nombre de calories pour un MENU (WELSH + FRITES + BIERES).......................................................................
def meal_weight_watchers(hash)
  calories_count = 0
  hash.each do |k, v|
    v.each do |key, value|
      calories_count = value * CALORIES[key] + calories_count
    end
  end
  return calories_count
end

#METHODE 3 : calcul du prix pour un MENU (WELSH + FRITES + BIERES).....................................................................................
def meal_price
  price = 0
  PRIX.each do |k, v|
    v.each do |key, value|
      price = value + price
    end
  end
  return price
end

#METHODE PERFORM.......................................................................................................................................
def perform

  puts "1. Après avoir mangé un WELSH, tu as ingurgité #{weight_watchers(WELSH)} calories !"
  puts ""

  puts "2. Pour un menu comprenant un WELSH, des FRITES et une BIERE, tu as ingurgité #{meal_weight_watchers(MENU)} calories !"
  puts ""

  puts "3. Un menu complet coûte #{meal_price} €."
  puts ""

end


perform
