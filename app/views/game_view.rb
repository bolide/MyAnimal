class GameView < UIImageView #UIView
  attr_reader :timer,:gamedata,:gooddata
  
  def rmq_build
    rmq(self).enable_interaction
    @state = rmq.append(UILabel, :time_label)
    rmq.append(UIImageView, :game_bg)

    rmq.append(UIImageView, :one_bg)
    rmq.append(UIImageView, :two_bg)
    rmq.append(UIImageView, :three_bg)
    rmq.append(UIImageView, :four_bg)
    rmq.append(UIImageView, :five_bg)
    rmq.append(UIImageView, :six_bg)
    rmq.append(UIImageView, :seven_bg)
    rmq.append(UIImageView, :eight_bg)
    rmq(self).tap do |q|
      q.append(UIButton, :back_button).on(:tap) do |sender|
        controller = MainController.alloc.init
        rmq.view_controller.presentViewController(controller, animated:true, completion:nil)
      end
      q.append(UIButton, :restart_button).on(:tap) do |sender|
        controller = GameController.alloc.init
        rmq.view_controller.presentViewController(controller, animated:true, completion:nil)
      end
      @one = q.append(UIButton, :one_button).on(:tap){|button| button_event(button,0,"one")}
      @two = q.append(UIButton, :two_button).on(:tap){|button| button_event(button,1,"two")}
      @three = q.append(UIButton, :three_button).on(:tap){|button| button_event(button,2,"three")}
      @four = q.append(UIButton, :four_button).on(:tap){|button| button_event(button,3,"four")}
      @five = q.append(UIButton, :five_button).on(:tap){|button| button_event(button,4,"five")}
      @six = q.append(UIButton, :six_button).on(:tap){|button| button_event(button,5,"six")}
      @seven = q.append(UIButton, :seven_button).on(:tap){|button| button_event(button,6,"seven")}
      @eight = q.append(UIButton, :eight_button).on(:tap){|button| button_event(button,7,"eight")}
    end
    rmq.append(UILabel, :succeed_count)
    start_game
    actionTapped
  end

  def actionTapped
    if @timer
      @timer.invalidate
      @timer = nil
    else
      @duration = 0
      @timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target:self, selector:'timerFired', userInfo:nil, repeats:true)
    end
  end

  def timerFired
    @state.get.text = I18n.t("gametime") % (@duration += 0.1)
  end

  def start_game
    data,i,index = [],0,0
    Animal.get_gamedata.each do |record|
      data << [index,0,record[0],i,record[1],record[4]]
      index += 1
      data << [index,1,record[2],i,record[1]]
      index += 1
      i+=1
    end
    
    @gamedata = data.randomize
    @gooddata = 0
    buttons = [@one,@two,@three,@four,@five,@six,@seven,@eight]
    @gamedata.each_with_index do |record,i|
      buttons[i].get.titleLabel.adjustsFontSizeToFitWidth = true
      set_button(buttons[i],record)
    end
  end

  def set_button(record,data)
    record.tag(data[0])
    if data[1] == 0
      if ConfigInfo.load_language == "zh-Hans" || ConfigInfo.load_language == "zh-Hant"
        record.style{|st| st.text = data[2]}
      else
        record.style{|st| st.text = data[5]}
      end
    else
      record.style{|st| st.image = rmq.image.resource("images/#{data[2]}")}
    end
  end

  def button_event(sender,index,name)
    data = @gamedata[index]
    usename = UserDefault.get(:selectbutton_name)
    if UserDefault.get(:selectbutton).nil?
      show_audios(data[4])
      UserDefault.set(:selectbutton,data[3])
      UserDefault.set(:selectbutton_tp,data[1])
      UserDefault.set(:selectbutton_name,name)
      rmq("#{name}_bg".to_sym).style{|st| st.background_color = rmq.color.from_hex("B29CB8")}
    else
      if UserDefault.get(:selectbutton) == data[3] && UserDefault.get(:selectbutton_tp) != data[1]
        rmq("#{usename}_bg".to_sym).style{|st| st.background_color = rmq.color.from_hex("74E26d")}#GameStylesheet::BGCOLOR
        rmq("#{usename}_button".to_sym).style{|st| st.color = rmq.color.from_hex("555555")}
        rmq("#{usename}_button".to_sym).get.enabled = false
        rmq(sender).style{|st| st.enabled = false,st.color = rmq.color.from_hex("555555")}
        rmq("#{name}_bg".to_sym).style{|st| st.background_color = rmq.color.from_hex("74E26d")}
        good_audio = ["good","right"].random
        show_audios(good_audio,good_audio == "good" ? "aac" : "wav")
        UserDefault.set(:selectbutton,nil)
        UserDefault.set(:selectbutton_name,nil)
        @gooddata += 1
      else
        rmq("#{usename}_bg".to_sym).style{|st| st.background_color = rmq.color.from_hex(GameStylesheet::BGCOLOR)}
        rmq("#{name}_bg".to_sym).style{|st| st.background_color = rmq.color.from_hex("B29CB8")}
        show_audios(data[4])
        UserDefault.set(:selectbutton,data[3])
        UserDefault.set(:selectbutton_tp,data[1])
        UserDefault.set(:selectbutton_name,name)
      end
    end
    if @gooddata == 4
      ConfigInfo.succeed
      rmq(:succeed_count).style{|st| st.text = I18n.t("gameround",:count=>ConfigInfo.get_succeed_count)}
      rmq(:succeed_count).animate( duration: 0.5, animations: -> (rmq) {
          rmq.style do |sv|
            sv.top = rmq.device.height / 2
            sv.left = 50
            sv.color = rmq.color.from_hex("74E26d")
            sv.scale = 3.0
          end
        },
        completion: -> (did_finish, rmq) {
          rmq.animate( duration: 0.2, animations: -> (rmq) {
              rmq.style do |sv|
                sv.scale = 1.0
              end
              controller = GameController.alloc.init
              rmq.view_controller.presentViewController(controller, animated:true, completion:nil)
            })
        })
    end
  end

  def show_audios(audio,tp="aac")
    SystemSounds.play_audio("audios/#{audio}",tp)
  end
end