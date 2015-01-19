names = [2,3,4,5,6,7,8,9,10,"Jack","Queen","King","Ace"]
deck = (2..14).to_a
deck_shuffled = (deck * 4).shuffle
player1 = deck_shuffled[0..25]
player2 = deck_shuffled[26..-1]
table = []
 
turn = 0
 
while (player1.size > 0) && (player2.size > 0)
  if turn == 3000
    puts "It's a tie!"
    exit
  end
  
  puts "\n\nTurn #{turn}:"
  
  table += [player1[0], player2[0]]
  player1.shift
  player2.shift
  
  while table.size > 0
    puts "Player A: #{names[(table[-2])-2]}\nPlayer B: #{names[(table[-1])-2]}"
    if table[-2] > table[-1]
      puts "Player A wins that round!"
      player1 += table
      puts "Player A has #{player1.size} cards.\nPlayer B has #{player2.size} cards."
      table.clear
 
    elsif table[-2] < table[-1]
      puts "Player B wins that round!"
      player2 += table
      puts "Player A has #{player1.size} cards.\nPlayer B has #{player2.size} cards."
      table.clear
    
    else 
	  puts "\nTHIS MEANS WAR!!"
      if (player1.size < 4) || (player2.size < 4)
        puts "Player A doesn't have enough cards for a war!" if player1.size < 4
        puts "Player B doesn't have enough cards for a war!" if player2.size < 4
        exit
      else
        table += player1[0..2] + player2[0..2] + [player1[3], player2[3]]
        player1.shift(4)
        player2.shift(4)
        puts "Player A puts face down: #{names[(table[-8])-2]}, #{names[(table[-7])-2]}, #{names[(table[-6])-2]}. And the face up card is: #{names[(table[-2])-2]}"
        puts "Player B puts face down: #{names[(table[-5])-2]}, #{names[(table[-4])-2]}, #{names[(table[-3])-2]}. And the face up card is: #{names[(table[-1])-2]}"
      end  
    end
  end
  turn += 1
  puts "\n\nPlayer A wins the game!" if player1.length == 52
  puts "\n\nPlayer B wins the game!" if player2.length == 52
end