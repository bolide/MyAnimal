class MainController < UIViewController 

  def viewDidLoad
    rmq.stylesheet = MainStylesheet
    rmq(self.view).apply_style :root_view
    rmq.append MainView, :main_view


    super
  end
end


