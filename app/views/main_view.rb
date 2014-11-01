class MainView < UIImageView #UIView
  def rmq_build
    rmq(self).enable_interaction
    rmq.append(UILabel, :hello_label)

    rmq(self).tap do |q|
      q.append(UIButton, :guess_button).on(:tap) do |sender|
        controller = GuessController.alloc.init
        rmq.view_controller.presentViewController(controller, animated:true, completion:nil)
      end
      
      q.append(UIButton, :game_button).on(:tap) do |sender|
        controller = GameController.alloc.init
        rmq.view_controller.presentViewController(controller, animated:true, completion:nil)
      end

      q.append(UIButton, :collection_button).on(:tap) do |sender|
        collection = UINavigationController.alloc.initWithRootViewController(CollectionController.new)
        rmq.view_controller.presentViewController(collection, animated:true, completion:nil)
      end

      rmq.append(UIButton, :good_button).on(:tap) do |sender|
        App.open_url(AppDelegate::APP_URL)
      end
      rmq.append(UIButton, :language_button).on(:tap) do |sender|
        ConfigInfo.set_language!
        controller = MainController.alloc.init
        rmq.view_controller.presentViewController(controller, animated:true, completion:nil)
      end
    end
  end
end