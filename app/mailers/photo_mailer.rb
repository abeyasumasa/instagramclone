class PhotoMailer < ApplicationMailer
  def photo_mail(photo)
    @photo = photo

    mail to: "abeyasumasa@gmail.com", subject: "写真の投稿確認メール"
  end
end
