class PhotoMailer < ApplicationMailer
  def photo_mail(user)
    @photo = photo
    binding.pry

    mail to: "abeyasumasa@gmail.com", subject: "写真の投稿確認メール"
  end
end
