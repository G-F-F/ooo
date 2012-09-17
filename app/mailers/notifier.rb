class Notifier < ActionMailer::Base
  default :from => "graham@finlayson-fife.org", :return_path => "jennifife67@gmail.com", :sender => "graham@marchhare.finlayson-fife.org"
  def go_and_get(a_person)
    attachments["little_file"] = "hi"
    @account = a_person
    mail(:to => a_person, :subject => "Hi!")
  end
  def tell(a_person)
    mail(:to => a_person, :subject => "Ooo recieved a visit")
  end

  def say_hi_to(a_person)
    attachments["a_file"] = `ls -lAF`
    mail(:to => a_person, :subject => "hi")
  end
end
