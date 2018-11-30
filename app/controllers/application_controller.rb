class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper
  #Applicationコントローラにこのモジュールをインクルードする（含める）ことによって、
  #Railsの全コントローラでこのモジュールが使用できるようになるので、設定しておきます。
  # application_contoroller에서include SessionsHelper하면어디서든 sessionhelper를 사용가능하다 이거다이
end
