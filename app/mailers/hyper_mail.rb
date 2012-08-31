class HyperMail < ActionMailer::Base
  default :sender => "graham@marchhare.finlayson-fife.org"
  def get_angry_at(a_person)
    mail(:to => a_person, :subject => "Hooray!")
  end
end
