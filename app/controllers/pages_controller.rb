class PagesController < ApplicationController
  
  def home
    @title = "Home"
  end
  
  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  
  def buttsize
    @title = "Buttsizes"
  end
  
  def paramstest
    @title = "Params"
    #require "cgi"
    #$cgi = CGI.new
    $params = params
  end
  
  def te
    @title = "Text Editor"
    @filename = params["filename"]
    @contents = params["contents"]
  end
  
  def brainiacs
    @download = true
  end
  
  def trade
    @title = "Sail all you want but you can't leave this site"
  end
  
  def kerplunk
    @title = "Estimated Time: \"26:34:56\""
  end
  
  def kerplunk2
    @title = "You will never make it!"
  end
  
  def kerplunk3
    @title = ("LOSER "*99)+"LOSER"
  end
  
  def display
    @title = "HTML viewer"
    @filename = params["filename"]
    @download = !params["use_layout"]
  end
  
  def execute
    @download = true
    @filename = params["filename"]
  end

  def arithmetic
    @expression = params["expression"]
  end
end
