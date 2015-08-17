class ApplicationMailer < ActionMailer::Base
  default :from => "no-reply@smashingboxes.com"

  layout 'mailer'
end
