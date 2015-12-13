module Utility


  # global sleep control - for extra app load time
  def global_sleep
    sleep(0.5)
  end


  ## extracts button by hash key and checks for existence
  def verify_buttons(table)

    table.hashes.each do |item|

      btn = item[:button]

      if (!btn_exists?(btn))
        fail("Button: #{btn} - does not exist!")
      end
    end
  end


  ## returns bool on button existence
  def btn_exists?(btn)
    element_exists("Button {text CONTAINS[c] '#{btn}'}")
  end


  # checks for scroll views - if none found, you need to perform a flick gesture instead of scroll
  def scroll_view_exists?

    scroll_view_query_string = 'android.widget.ScrollView index:0'
    list_view_query_string = 'android.widget.AbsListView index:0'
    web_view_query_string = 'android.webkit.WebView index:0'

    if (element_exists(scroll_view_query_string) ||
        element_exists(list_view_query_string)   ||
        element_exists(web_view_query_string))
      true
    else
      false
    end
  end


  ## scrolls to element w/optional args
  def scroll_to_element(element, **args)

    start_duration = Time.now
    scroll_view = scroll_view_exists?

    if (args.has_key?(:duration))
      duration = args[:duration]
    else
      duration = 10
    end

    if (args.has_key?(:time))
      time = args[:time]
    else
      time = 2
    end

    total_duration = start_duration + duration

    while (element_does_not_exist(element))

      global_sleep

      case (scroll_view)

        when (scroll_view)
          if (args[:direction] == 'up')
            scroll_up
          else
            scroll_down
          end
        when (!scroll_view)
          if (args[:direction] == 'up')
            flick_down(time:time)
          else
            flick_up(time:time)
          end
        else
          raise('Scroll condition net yet implemented!')
      end

      if (Time.now > total_duration)
        raise("Could not find element: #{element} - in the allotted duration: #{duration}")
      end
    end
  end


  ## swipe/flick - can be expanded to flick on specific elements
  def swipe(dir)

    case (dir)

      when 'left'
        flick_left
      when 'right'
        flick_right
      else
        raise('Swipe condition not yet implemented!')
    end

  end

  def navigate_to(page)

    case (page)

      when (/(settings)/i)
        @page = settings

      else

    end



  end

end