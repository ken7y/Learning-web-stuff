require_relative 'config/environment'

class App < Sinatra::Base

  get '/reversename/:name'do
  @name = params[:name]
  @reversename = @name.reverse
  "#{@reversename}"
end


get '/square/:number' do
  @num = params[:number]
  @numi = @num.to_i
  @sq = @numi * @numi
  "#{@sq.to_s}"
end


get '/say/:number/:phrase' do
  @number = params[:number].to_i
  @text = params[:phrase]
  "#{@text}\n"*@number


end


get '/say/:word1/:word2/:word3/:word4/:word5' do
  @num1 = params[:word1]
  @num2 = params[:word2]
  @num3 = params[:word3]
  @num4 = params[:word4]
  @num5 = params[:word5]
  "#{@num1} #{@num2} #{@num3} #{@num4} #{@num5}."

end


get '/:operation/:number1/:number2' do
  @op = params[:operation]
  @num1 = params[:number1].to_i
  @num2 = params[:number2].to_i
  @answer

  if @op == "add"
    @answer = @num1 + @num2
  elsif @op == "subtract"
    @answer = @num1 - @num2
  elsif @op == "multiply"
    @answer = @num1 * @num2
  elsif @op == "divide"
    @answer = @num1/@num2
  end
  "#{@answer}"


end


end
