module ActionBar


  def settings
    wait_for_element_exists(overflow_btn)
    touch(overflow_btn)
    wait_for_element_exists(settings_btn)
    touch(settings_btn)
    page(SettingsPage).await
  end


  def navigation_menu
    "* id:'md__menu'"
  end

  def settings_btn
    "* id:'title' text:'Settings'"
  end



  def overflow_btn
    "* contentDescription:'More options'"
  end





end