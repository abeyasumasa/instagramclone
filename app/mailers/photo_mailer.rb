class PhotoMailer < ApplicationMailer
  def photo_mail(photo)
    @photo = photo
    binding.pry

    mail to: @photo.user.email, subject: "写真の投稿確認メール"
  end
end
