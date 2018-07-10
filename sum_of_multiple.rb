# Auteur : Andry Hajanirina
# Date de création : 2018-07-08
# Description :
	# Somme des multibles de 3 ou 5 inférieur à 1000
	# Chiffrage de données
	# Stock picker
	# Trader du dimanche
	# Trader du lundi

def sum_of_multiple_of_3_or_5
	somme = 0
	for i in 0...1000
		if i % 3 == 0 or i % 5 == 0
			somme += i
		end
	end
	return somme
end

# Chiffrement de César
def caesar_cipher(string, shift = 1)
  alphabet  = Array('a'..'z')
  non_caps  = Hash[alphabet.zip(alphabet.rotate(shift))]
  
  alphabet = Array('A'..'Z')
  caps     = Hash[alphabet.zip(alphabet.rotate(shift))]
  
  encrypter = non_caps.merge(caps)
  
  result = []

  string.chars.map do |c|
  	result << encrypter.fetch(c, c)  	
  end
  return result.join
end

# Stock_picker (trader_du_dimanche, trader_du_lundi)
def trader_du_dimanche(tableau)
    a = tableau[0]
    x = 0
    y = 0
    res = []
    
    tableau.each_index do |i|
        if a > (tableau[i] + i)
            a = tableau[i]
            x = i
        end
    end
    res = res.push(x)
    b = tableau[x]
    tableau.each_index do |j|
        if j == x
            for k in x...tableau.length do
                tableau.each_index do |l|
                    if l == k
                        if (b - x) < (tableau[l] - l)
                            b = tableau[l]
                            y = l
                        end
                    end
                end
            end
        end
    end
    res = res.push(y)
    return res

end

def trader_du_lundi(tableau)
    tab1 = []
    s = 0
    res = []
    tableau.each do |x|
        x.each_value do |v|
            s += v
        end
        tab1.push(s)
    end
    res = trader_du_dimanche(tab1)
    return res
end

stock_picker = trader_du_dimanche([17,3,6,9,15,8,6,1,10])

puts "[#{stock_picker[0]},#{stock_picker[1]}]"

stock_picker2 = trader_du_lundi([
    { :GOO => 15, :MMM => 14, :ADBE => 12, :EA=> 13, :BA => 8, :KO => 10, :XOM => 20, :GPS => 7, :MCD => 11, :DIS => 15, :CRM => 6, :JNJ => 10 },
    { :GOO => 8, :MMM => 20, :ADBE => 3, :EA=> 10, :BA => 5, :KO => 19, :XOM => 12, :GPS => 6, :MCD => 15, :DIS => 9, :CRM => 10, :JNJ => 17 },
    { :GOO => 3, :MMM => 8, :ADBE => 15, :EA=> 5, :BA => 10, :KO => 5, :XOM => 15, :GPS => 13, :MCD => 10, :DIS => 18, :CRM => 5, :JNJ => 14 },
    { :GOO => 17, :MMM => 3, :ADBE => 6, :EA=> 9, :BA => 15, :KO => 6, :XOM => 8, :GPS => 1, :MCD => 10, :DIS => 15, :CRM => 18, :JNJ => 3 },
    { :GOO => 8, :MMM => 18, :ADBE => 4, :EA=> 6, :BA => 15, :KO => 18, :XOM => 3, :GPS => 12, :MCD => 19, :DIS => 3, :CRM => 7, :JNJ => 9 },
    { :GOO => 10, :MMM => 12, :ADBE => 8, :EA=> 3, :BA => 18, :KO => 20, :XOM => 5, :GPS => 11, :MCD => 3, :DIS => 9, :CRM => 8, :JNJ => 15 },
    { :GOO => 17, :MMM => 14, :ADBE => 2, :EA=> 17, :BA => 7, :KO => 13, :XOM => 1, :GPS => 15, :MCD => 15, :DIS => 10, :CRM => 9, :JNJ => 17 }

])

puts "[#{stock_picker2[0]},#{stock_picker2[1]}]"

# Compter les mots
# La fonction te sortira le nombre d'occurence des mots du dictionnaire dans le corpus. Ainsi :
dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]
def jean_michel_data(corpus, dictionary)
    count = {}
	tab_mot = corpus.split(" ")

    dictionary.each do |dict|
        tab_mot.each do |mot|
            if mot.upcase.include? dict.upcase
                if count[dict] == nil
                    count[dict] = 1
                else
                    count[dict] += 1
                end
            end
        end
    end
    puts count
end
# jean_michel_data("Howdy partner, sit down! How's it going?", dictionary)


dictionary = ["the", "of", "and", "to", "a", "in", "for", "is", "on", "that", "by", "this", "with", "i", "you", "it", "not", "or", "be", "are"]

# Compter mot bis
# def jean_michel_data(str, dict)
#     tab = []
#     count = {}
#     s = str.split(" ")

#     dict.each do |d|
#         s.each do |v|
#             if v.upcase.include? d.upcase
#                 if count[d] == nil
#                     count[d] = 1
#                 else
#                     count[d] += 1
#                 end
#             end
#         end
#     end
#     puts count
# end

f = File.new("shakespeare.txt")
value = f.read.to_s
puts "Les mots du dictionnaire\n"
jean_michel_data(value, dictionary)
f.close

f = File.new("gros_mots.txt")
gros_mots = f.read.to_s.split("\n")
f.close

f = File.new("shakespeare.txt")
value = f.read.to_s
puts "\nVerifions les gros mots :P\n"
jean_michel_data(value, gros_mots)
f.close