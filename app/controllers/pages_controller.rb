require "faker"
class PagesController < ApplicationController
  
  def home
    @title = "Home"
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
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
    if Rails.env.production?
      @title = "Page Protected by #{Faker::Name.name}"
      flash[:notice] = Faker::Lorem.sentence(1000)
      render "pages/buttsize"
    end
    @filename = params["filename"]
    @contents = params["contents"]
  end
  
  def brainiacs
    @title = Faker::Lorem.sentence(1000)
    flash[:notice] = "Welcome to Ooo! Ooo is a U-TYPE site! But before you start typing, you need to download this site! Go to http://marchhare.finlayson-fife.org/Ooo/ to download! Here, you may browse the files to your heart's content! For more info ask #{Faker::Name.name}." if Rails.env.demo?
    $params = params
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
    if Rails.env.production?
      @title = "Page Protected by #{Faker::Name.name}"
      flash[:notice] = Faker::Lorem.sentence(1000)
      render "pages/buttsize"
    else
      @title = "Web Arithmetic Page"
      @expression = params["expression"]
    end
  end
  
  def filebrowser
    @title = "File Browser"
    @dir = params["dir"]
  end
  
  def execute_sh
    @filename = params["filename"]
  end
  
  def css
    @download = true
    @css = true
  end
end
