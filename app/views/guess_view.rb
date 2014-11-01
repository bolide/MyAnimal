class GuessView < UIImageView #UIView
  attr_reader :timer,:gamedata,:gooddata
  
  def rmq_build
    rmq(self).enable_interaction
    @state = rmq.append(UILabel, :time_label)
    rmq.append(UIImageView, :game_bg)

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
        controller = GuessController.alloc.init
        rmq.view_controller.presentViewController(controller, animated:true, completion:nil)
      end
      @one = q.append(UIButton, :one_button).on(:tap){|button| show_audio_data}
      @five = q.append(UIButton, :five_button).on(:tap){|button| button_event(button,0,"five")}
      @six = q.append(UIButton, :six_button).on(:tap){|button| button_event(button,1,"six")}
      @seven = q.append(UIButton, :seven_button).on(:tap){|button| button_event(button,2,"seven")}
      @eight = q.append(UIButton, :eight_button).on(:tap){|button| button_event(button,3,"eight")}
      
      
    end
    @five_label = rmq.append(UILabel, :five_label)
    @six_label = rmq.append(UILabel, :six_label)
    @seven_label = rmq.append(UILabel, :seven_label)
    @eight_label = rmq.append(UILabel, :eight_label)
    
    
    @five_label.get.adjustsFontSizeToFitWidth = true
    @six_label.get.adjustsFontSizeToFitWidth = true
    @seven_label.get.adjustsFontSizeToFitWidth = true
    @eight_label.get.adjustsFontSizeToFitWidth = true

    rmq.append(UILabel, :succeed_count)

    @good = rmq.append(UIImageView, :good).hide
    @wrong = rmq.append(UIImageView, :wrong).hide
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
    @gamedata = Animal.get_gamedata
    @gooddata = @gamedata.random
    show_audios(@gooddata[1])
    buttons = [@five,@six,@seven,@eight]
    labels = [@five_label,@six_label,@seven_label,@eight_label]
    @gamedata.each_with_index do |record,i|
      set_button(buttons[i],record,labels[i])
    end
  end

  def set_button(record,data,label)
    record.tag(data[1])
    if ConfigInfo.load_language == "zh-Hans" || ConfigInfo.load_language == "zh-Hant"
      label.style{|st| st.text = data[0]}
    else
      label.style{|st| st.text = data[4]}
    end
    record.style{|st| st.image = rmq.image.resource("images/#{data[2]}")}
  end

  def button_event(sender,index,name)
    data = @gamedata[index]
    if data[1] == @gooddata[1]
      buttons = [@five,@six,@seven,@eight]
      buttons.each do |button|
        button.get.enabled = false
      end
      good_audio = ["good","right"].random
      show_audios(good_audio,good_audio == "good" ? "aac" : "wav")
      ConfigInfo.guess_succeed
      @good.show.animate( duration: 1.5, animations: -> (rmq) {
          rmq.style do |sv|
            sv.scale = 2.0
          end
        },
        completion: -> (did_finish, rmq) {
          rmq.animate( duration: 0.5, animations: -> (rmq) {
              rmq.style do |sv|
                sv.scale = 1.0
              end
              controller = GuessController.alloc.init
              rmq.view_controller.presentViewController(controller, animated:true, completion:nil)
            })
        })
    else
      show_audios("wrong","mp3")
      @wrong.show.animate( duration: 0.5, animations: -> (rmq) {
          rmq.style do |sv|
            sv.scale = 2.0
          end
        },
        completion: -> (did_finish, rmq) {
          rmq.animate( duration: 0.2, animations: -> (rmq) {
              rmq.style do |sv|
                sv.scale = 1.0
              end
              @wrong.hide
            })
        })
    end
  end

  def show_audio_data
    show_audios(@gooddata[1])
  end

  def show_audios(audio,tp="aac")
    SystemSounds.play_audio("audios/#{audio}",tp)
  end
end