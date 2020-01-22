require "rubygems"
require "sinatra"
require "./caesar-cipher.rb"

def checkParams(params = {})
  if params.nil? || params[:plaintext].nil? || params[:plaintext]==""
    return ["No text was given to encode",0]
  end
  if params[:shift].nil? || params[:shift] == ""
    return [params[:plaintext],0]
  end
  if params[:shift].to_i.is_a? Integer
    return [params[:plaintext],params[:shift].to_i]
  else
    return ["invalid shift parameter provided",0]
  end
end



get '/' do

  msg, shift = checkParams(params)

  msg = caesar_cipher(msg,shift)

  erb :index, :locals => {message: msg}
end
