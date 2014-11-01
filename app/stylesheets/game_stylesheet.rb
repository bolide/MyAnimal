class GameStylesheet < ApplicationStylesheet

  BGCOLOR = "D0D6F2"
  BUTTONCOLOR = "0985E6"
  
  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def game_view(st)
    st.frame = {l: 0, t: 0, w: rmq.device.width, h: rmq.device.height}
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
    st.text = I18n.t("gameround",:count=>ConfigInfo.get_succeed_count)
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
    st.frame = {l: 15, t: (85 + 10), w: (rmq.device.width - 50) / 2, h: (rmq.device.height - 160) / 4}
    st.background_color = color.from_hex("9B93D6")
    st.color = color.white
  end
  
  def one_bg(st)
    st.frame = {l: 10, t: (85 + 5), w: (rmq.device.width - 25) / 2, h: (rmq.device.height - 120) / 4}
    st.background_color = color.from_hex(BGCOLOR)
    st.corner_radius = 10
  end
  
  def two_button(st)
    st.frame = {l: rmq.device.width / 2 + 10, t: (85 + 10), w: (rmq.device.width - 50) / 2, h: (rmq.device.height - 160) / 4}
    st.background_color = color.from_hex("9B93D6")
    st.color = color.white
  end

  def two_bg(st)
    st.frame = {l: rmq.device.width / 2 + 5, t: (85 + 5), w: (rmq.device.width - 30) / 2, h: (rmq.device.height - 120) / 4}
    st.background_color = color.from_hex(BGCOLOR)
    st.corner_radius = 10
  end
  
  def three_button(st)
    st.frame = {l: 15, t: (85 + 15) + (rmq.device.height - 120) / 4, w: (rmq.device.width - 50) / 2, h: (rmq.device.height - 160) / 4}
    st.background_color = color.from_hex("9B93D6")
    st.color = color.white
  end

  def three_bg(st)
    st.frame = {l: 10, t: (85 + 10) + (rmq.device.height - 120) / 4, w: (rmq.device.width - 25) / 2, h: (rmq.device.height - 120) / 4}
    st.background_color = color.from_hex(BGCOLOR)
    st.corner_radius = 10
  end

  
  def four_button(st)
    st.frame = {l: rmq.device.width / 2 + 10, t: (85 + 15) + (rmq.device.height - 120) / 4, w: (rmq.device.width - 50) / 2, h: (rmq.device.height - 160) / 4}
    st.background_color = color.from_hex("9B93D6")
    st.color = color.white
  end

  def four_bg(st)
    st.frame = {l: rmq.device.width / 2 + 5, t: (85 + 10) + (rmq.device.height - 120) / 4, w: (rmq.device.width - 30) / 2, h: (rmq.device.height - 120) / 4}
    st.background_color = color.from_hex(BGCOLOR)
    st.corner_radius = 10
  end
  
  def five_button(st)
    st.frame = {l: 15, t: (85 + 20) + (rmq.device.height - 120) / 4 * 2, w: (rmq.device.width - 50) / 2, h: (rmq.device.height - 160) / 4}
    st.background_color = color.from_hex("9B93D6")
    st.color = color.white
  end
  
  def five_bg(st)
    st.frame = {l: 10, t: (85 + 15) + (rmq.device.height - 120) / 4 * 2, w: (rmq.device.width - 25) / 2, h: (rmq.device.height - 120) / 4}
    st.background_color = color.from_hex(BGCOLOR)
    st.corner_radius = 10
  end


  def six_button(st)
    st.frame = {l: rmq.device.width / 2 + 10, t: (85 + 20) + (rmq.device.height - 120) / 4 * 2, w: (rmq.device.width - 50) / 2, h: (rmq.device.height - 160) / 4}
    st.background_color = color.from_hex("9B93D6")
    st.color = color.white
  end

  def six_bg(st)
    st.frame = {l: rmq.device.width / 2 + 5, t: (85 + 15) + (rmq.device.height - 120) / 4 * 2, w: (rmq.device.width - 30) / 2, h: (rmq.device.height - 120) / 4}
    st.background_color = color.from_hex(BGCOLOR)
    st.corner_radius = 10
  end
  
  def seven_button(st)
    st.frame = {l: 15, t: (85 + 25) + (rmq.device.height - 120) / 4 * 3, w: (rmq.device.width - 50) / 2, h: (rmq.device.height - 160) / 4}
    st.background_color = color.from_hex("9B93D6")
    st.color = color.white
  end

  def seven_bg(st)
    st.frame = {l: 10, t: (85 + 20) + (rmq.device.height - 120) / 4 * 3, w: (rmq.device.width - 25) / 2, h: (rmq.device.height - 120) / 4}
    st.background_color = color.from_hex(BGCOLOR)
    st.corner_radius = 10
  end

  def eight_button(st)
    st.frame = {l: rmq.device.width / 2 + 10, t: (85 + 25) + (rmq.device.height - 120) / 4 * 3, w: (rmq.device.width - 50) / 2, h: (rmq.device.height - 160) / 4}
    st.background_color = color.from_hex("9B93D6")
    st.color = color.white
  end

  def eight_bg(st)
    st.frame = {l: rmq.device.width / 2 + 5, t: (85 + 20) + (rmq.device.height - 120) / 4 * 3, w: (rmq.device.width - 30) / 2, h: (rmq.device.height - 120) / 4}
    st.background_color = color.from_hex(BGCOLOR)
    st.corner_radius = 10
  end
end
