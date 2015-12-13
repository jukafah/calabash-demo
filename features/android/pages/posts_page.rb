require 'calabash-android/abase'


class PostsPage < Calabash::ABase
  include(ActionBar)
  include(Utility)

  @@title

  def trait
    dismiss_menu
    "* id:'action_bar_title' text:'Posts'"
  end


  def dismiss_menu
    1.upto(5) do |n|
      if (element_exists(menu_overlay))
        touch(menu_btn)
        wait_for_element_does_not_exist(menu_overlay)
        break
      end
      sleep(1)
    end
  end

  def create_post(title)
    @@title = title
    touch(new_post_btn)
    wait_for_element_exists(post_title_field)
    touch(post_title_field)
    keyboard_enter_text(title)

    wait_for_element_exists(save_post_btn)
    touch(save_post_btn)
    wait_for_element_exists(post_date)
  end

  def check_post
    act_text = query(post_list)[0].fetch('text')
    fail("Expected: #{@@title}\nActual: #{act_text}") if (@@title != act_text)
  end


  def post_title_field
    "* id:'post_title'"
  end

  def post_content_field
    "* id:'post_content'"
  end

  def new_post_btn
    "* id:'menu_new_post'"
  end

  def menu_btn
    "* id:'home'"
  end

  def post_date
    "* id:'post_list_date'"
  end

  def menu_overlay
    "* id:'md__menu'"
  end

  def save_post_btn
    "* id:'menu_save_post'"
  end

  def post_list
    "* id:'post_list_title'"
  end

end
