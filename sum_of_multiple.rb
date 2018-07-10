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

# puts sum_of_multiple_of_3_or_5

def chiffre_de_cesar(texte, nb_decalage)
	limite = texte.length
	for i in 0..limite
		puts texte[i].inspect
	end
end
 chiffre_de_cesar("bonjour", 3)


	