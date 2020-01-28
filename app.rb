# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
require "pry"

# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/game'
require_relative 'lib/player'


# Maintenant c'est open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc.

player1= Player.new("Josiane")
player2= Player.new("José")

puts "A ma droite #{player1.name}"
puts "A ma gauche #{player2.name}"
puts player1.show_state
puts player2.show_state

puts "Passons à la phase d'attaque :"

#lancement de la 1ière attaque
player1.attacks(player2)
player2.attacks(player1)

# fait tourner une attaque tant que personne n'est mort
while player1.life_points>0 && player2.life_points>0 do    
    player1.show_state
    player2.show_state
    puts "     "
    puts "___*******NEW ROUND*******___ "
    player1.attacks(player2)
        #arrête la boucle si le player 2 est déjà mort
        if player2.life_points<=0 
            break
        end
    player2.attacks(player1)    
end

