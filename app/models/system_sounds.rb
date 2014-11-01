# Add the following to your Rakefile
# app.frameworks += ['MediaPlayer']
class SystemSounds
  class << self
    def play_audio(file_name,audiotype="mp3",loop=0)
      Dispatch::Queue.concurrent.async do
        mainBundle = NSBundle.mainBundle
        filePath = mainBundle.pathForResource(file_name, ofType: "#{audiotype}")
        fileData = NSData.dataWithContentsOfFile(filePath)
        error = Pointer.new(:object)
        @audio_player = AVAudioPlayer.alloc.initWithData(fileData, error:error)
        unless (@audio_player.nil?)
          @audio_player.delegate = self
          @audio_player.numberOfLoops = loop
          @audio_player.play if(@audio_player.prepareToPlay)
        else
          p "Failed to instantiate AVAudioPlayer"
        end
      end
    end

    def play_background_audio(file_name,loop=0)
      Dispatch::Queue.concurrent.async do
        mainBundle = NSBundle.mainBundle
        filePath = mainBundle.pathForResource(file_name, ofType:"mp3")
        fileData = NSData.dataWithContentsOfFile(filePath)
        error = Pointer.new(:object)

        @background_audio_player = AVAudioPlayer.alloc.initWithData(fileData, error:error)
        unless (@background_audio_player.nil?)
          @background_audio_player.delegate = self
          @background_audio_player.numberOfLoops = loop
          if (@background_audio_player.prepareToPlay && @background_audio_player.play)
            p "play"
          end
        end
      end
    end

    def self.stop_audio
      @background_audio_player.stop if @background_audio_player
      @audio_player.stop if @audio_player
    end

    def self.start_audio
      @background_audio_player.play if @background_audio_player
    end

    def self.quiet
      @background_audio_player.stop if @background_audio_player
    end
  end
end