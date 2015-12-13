
Before do |scenario|

  ## code to execute before each scenario

end


After do |scenario|

  ## code to execute before each scenario

  if (element_does_not_exist(overflow_btn))
    press_back_button
  end

  wait_for_element_exists(overflow_btn)
  touch(overflow_btn)
  wait_for_element_exists(sign_out_btn)
  touch(sign_out_btn)
  wait_for_element_exists(sign_out)
  touch(sign_out)
  wait_for_element_exists(sign_in_btn)

end


def overflow_btn
  "* contentDescription:'More options'"
end

def sign_out_btn
  "* id:'title' text:'Sign out'"
end

def sign_out
  "* id:'button1'"
end

def sign_in_btn
  "* id:'nux_sign_in_button'"
end