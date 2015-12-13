require 'calabash-android/abase'


class SettingsPage < Calabash::ABase
  include(ActionBar)
  include(Utility)

  def trait
    "* id:'action_bar_title' text:'Settings'"
  end



  def check_settings_element(element, exp_text)

    @act_text = ''

    case (element)

      when (/(username)/i)
        wait_for_element_exists(username_element)
        @act_text = query(username_element)[0].fetch('text')

      else
        raise("Logic for element - #{element} has not been implemented!")
    end

    fail("Expected value: #{exp_text}\nActual value: #{@act_text}")if (exp_text != @act_text)
  end


  def username_element
    "* id:'title' text:'Username' sibling * id:'summary'"
  end
end
