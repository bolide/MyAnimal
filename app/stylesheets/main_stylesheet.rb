class MainStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
    
  end

  def main_view(st)
    st.frame = {l: 0, t: 0, w: rmq.device.width, h: rmq.device.height}
    st.image = rmq.image.resource_resizable('bg.jpg', left: 0, top: 0, right: 0, bottom: 0)
  end
  
  def hello_label(st)
    st.frame = "a0:j1"
    st.text = I18n.t("title")
    st.text_alignment = :center
    st.color = color.from_hex("555555")
    st.font = font.system(36)
  end

  def guess_button(st)
    st.frame = "c3:h4"
    st.background_color = color.from_hex('BCDCE2')
    st.color = color.from_hex("333333")
    st.text = I18n.t("guess_animals")
    st.corner_radius = 10
  end

  def game_button(st)
    st.frame = "c6:h7"
    st.background_color = color.from_hex('B9DCF5')
    st.color = color.from_hex("333333")
    st.text = I18n.t("animal_match")
    st.corner_radius = 10
  end

  def collection_button(st)
    st.frame = "c9:h10"
    st.background_color = color.from_hex('CFDBB3')
    st.color = color.from_hex("222222")
    st.text = I18n.t("all_the_animals")
    st.corner_radius = 10
  end

  def good_button(st)
    st.frame = "c12:e13"
    st.background_color = color.from_hex('c0d883')
    st.color = color.from_hex("1c1c1c")
    st.text = I18n.t("to_rate")
    st.corner_radius = 10
  end
  
  def language_button(st)
    st.frame = "f12:h13"
    st.background_color = color.from_hex('c0d883')
    st.color = color.from_hex("1c1c1c")
    if ConfigInfo.load_language == "en"
      st.text = "中文"
    else
      st.text = "English"
    end
    st.corner_radius = 10
  end
end
