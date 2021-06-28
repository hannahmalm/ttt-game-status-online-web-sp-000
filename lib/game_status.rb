require 'pry' 

# Helper Method
#if the board does not == nil or blank space, then it is taken (returns true). When using these types of methods you dont need an if statement 
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top Row
  [3,4,5], #Middle Row
  [6,7,8], #Bottom Row
  [0,3,6], #Right Row
  [1,4,7], #Middle Vertical
  [2,5,8], #Left Row
  [0,4,8], #Cross 1 
  [2,4,6], #Cross 2
  ]
  
def won?(board)
   WIN_COMBINATIONS.detect do |i|
    #check if index [0,1,2] are all the same - this isnt saying necessarying the array number 0,1,2; its saying if the first spot = X, and the second and third spot = X (or O), then it is a win. The spots can be any of the win combinations from above
   board[i[0]] == board[i[1]] &&
   board[i[1]] == board[i[2]] &&
   #see if there are values in this arrary
   position_taken?(board,i[0]) 
  end 
end 

def full?(board)
#check to see if board has all arrary spots filled in, if they all are filled in, this will automatically be true, we want to ask if it is == to X or O 
  board.all?  do |i|
    #ask if i is equal to X or O 
  i == "X" || i == "O"  
end
end

def draw?(board)
  #if board has not been won but is full 
   !won?(board) && full?(board)
end  

def over?(board)
  #if the board has been won, is a draw, or is full, return true 
   won?(board)  || draw?(board) || full?(board)  
end  

def winner(board)
  #make a new element including the won? method 
   won=won?(board)
   if won 
     #if the board is won, return one of the spots in the array, which will be X or O. 
      board[won[0]]
    end  
end  
  