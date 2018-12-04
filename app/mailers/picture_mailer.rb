class PictureMailer < ApplicationMailer
  def picture_mail(pictures)
    @pictures = pictures
    mail to: "#{@pictures.user.name}の投稿確認メール", subject: "内容確認"
  end
end
