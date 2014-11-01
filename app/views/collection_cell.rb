class CollectionCell < UICollectionViewCell 
  attr_reader :reused,:index,:animal

  def rmq_build
    rmq(self).apply_style :collection_cell
    rmq(self.contentView).tap do |q|
      @animal_image = q.append(UIImageView, :animal_image)
      @title = q.append(UILabel, :title).tag(:animal_title)
      q.on(:tap) do |sender|
        rmq(:animal_title).style{|st| st.color = rmq.color.white}
        @title.get.color = rmq.color.from_hex('555555')
        show_audios
      end

      @title.get.adjustsFontSizeToFitWidth = true
    end
  end

  def index=(data)
    @index = data
  end

  def load_data
    @animal = Animal.all[@index]
    if ConfigInfo.load_language == "zh-Hans" || ConfigInfo.load_language == "zh-Hant"
      @title.get.text = animal[0]
    else
      @title.get.text = animal[4]
    end


    @animal_image.get.image = rmq.image.resource("images/#{@animal[2]}")
  end

  def show_audios
    SystemSounds.play_audio("audios/#{@animal[1]}","aac") #animal[3]
  end

  def prepareForReuse
    @reused = true
  end
end
