require "pry"

class Player
  attr_accessor :name, :life_points

  # déclaration de notre initialize, c'est ce qui va nous servir pour créer le player.new
  def initialize(name)
    @name = name
    @life_points = life_points = 10
  end

  #affiche le nombre de points de vie
  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

 
  #recalcul des points de vie et indique si le player est tjs dans le game
  def gets_damage(damage)
     @life_points = @life_points - damage
     if @life_points > 0 
      then puts "#{@name} est encore dans le game, il a encore #{@life_points} points de vie !"
      else puts "sorry but #{@name} tu es muerto, tu as #{@life_points} points de vie!"
    end

  end 
 
  #définition de l'attaque et  de qui attaque qui
  def attacks(is_attacked)
    puts "#{@name} attacks #{is_attacked.name}"
    current_attack = compute_damage
    puts "#{@name} lui inflige  #{current_attack} points de dommages"
    is_attacked.gets_damage(current_attack)
  end
  

  #renvoie une valeur aléatoire entre 1 et 6
  def compute_damage
    return rand(1..6)
  end



end