class PictureMailer < ApplicationMailer
  def picture_mail(pictures)
    @pictures = pictures
    mail to: "自分のメールアドレス", subject: "お問い合わせの確認メール"
  end
end
