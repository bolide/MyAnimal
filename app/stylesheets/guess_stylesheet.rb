class GuessStylesheet < ApplicationStylesheet

  BGCOLOR = "D0D6F2"
  BUTTONCOLOR = "0985E6"
  
  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def guess_view(st)
    st.frame = {l: 0, t: 0, w: rmq.device.width, h: rmq.device.height}
  end
  
  def good(st)
    st.frame = "c5:h8"
    st.image = rmq.image.resource("good")
    st.corner_radius = 10
  end
  
  def wrong(st)
    st.frame = "c5:h8"
    st.image = rmq.image.resource("wrong")
    st.corner_radius = 10
  end

  def back_button(st)
    st.frame = {l: 5, t: 25, w: 50, h: 55}
    st.image = rmq.image.resource("back")
  end

  def restart_button(st)
    st.frame = {l: 60, t: 25, w: 50, h: 55}
    st.image = rmq.image.resource("restart")
  end
  
  def succeed_count(st)
    st.frame = {l: 105, t: 25, w: (rmq.device.width - 105), h: 25}
    st.text = I18n.t("gameround",:count=>ConfigInfo.get_guess_succeed_count)
    st.text_alignment = :center
    st.color = color.from_hex("555555")
    st.font = font.system(16)
  end

  def time_label(st)
    st.frame = {l: 105, t: 50, w: (rmq.device.width - 105), h: 25}
    st.text_alignment = :center
    st.color = color.from_hex("555555")
    st.font = font.system(14)
  end

  def game_bg(st)
    st.frame = {l: 5, t: 85, w: (rmq.device.width - 10), h: (rmq.device.height - 90)}
    st.background_color = color.from_hex("cccccc")
  end

  def one_button(st)
    st.frame = "b1:i4"
    st.image = rmq.image.resource("audio")
    st.color = color.white
  end
  

  
  def five_button(st)
    st.frame = "b6:d8"
    st.background_color = color.from_hex("9B93D6")
    st.color = color.white
  end

  def five_label(st)
    st.frame = "b9:d9"
    st.text_alignment = :center
    st.color = color.from_hex("555555")
    st.font = font.system(14)
  end
  
  def five_bg(st)
    st.frame = "b6:d9"
    st.background_color = color.from_hex(BGCOLOR)
    st.corner_radius = 10
  end


  def six_button(st)
    st.frame = "g6:i8"
    st.background_color = color.from_hex("9B93D6")
    st.color = color.white
  end


  def six_label(st)
    st.frame = "g9:i9"
    st.text_alignment = :center
    st.color = color.from_hex("555555")
    st.font = font.system(14)
  end

  def six_bg(st)
    st.frame = "g6:i9"
    st.background_color = color.from_hex(BGCOLOR)
    st.corner_radius = 10
  end
  
  def seven_button(st)
    st.frame = "b11:d13"
    st.background_color = color.from_hex("9B93D6")
    st.color = color.white
  end

  def seven_label(st)
    st.frame = "b14:d14"
    st.text_alignment = :center
    st.color = color.from_hex("555555")
    st.font = font.system(14)
  end

  def seven_bg(st)
    st.frame = "b11:d14"
    st.background_color = color.from_hex(BGCOLOR)
    st.corner_radius = 10
  end

  def eight_button(st)
    st.frame = "g11:i13"
    st.background_color = color.from_hex("9B93D6")
    st.color = color.white
  end

  def eight_label(st)
    st.frame = "g14:i14"
    st.text_alignment = :center
    st.color = color.from_hex("555555")
    st.font = font.system(14)
  end

  def eight_bg(st)
    st.frame = "g11:i14"
    st.background_color = color.from_hex(BGCOLOR)
    st.corner_radius = 10
  end
end
