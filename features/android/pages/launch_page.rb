require 'calabash-android/abase'


class LaunchPage < Calabash::ABase
  include(ActionBar)
  include(Utility)

  def trait
    "* id:'nux_sign_in_button'"
  end


  def sign_in(username, password)

    wait_for_element_exists(username_field)
    touch(username_field)
    keyboard_enter_text(username)
    hide_soft_keyboard

    wait_for_element_exists(password_field)
    touch(password_field)
    keyboard_enter_text(password)
    hide_soft_keyboard

    wait_for_element_exists(sign_in_btn)
    touch(sign_in_btn)

    page(PostsPage).await
  end




  def username_field
    "* id:'nux_username'"
  end

  def password_field
    "* id:'nux_password'"
  end

  def sign_in_btn
    "* id:'nux_sign_in_button'"
  end

end
