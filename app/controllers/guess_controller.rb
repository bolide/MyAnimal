class GuessController < UIViewController 

  def viewDidLoad
    rmq.stylesheet = GuessStylesheet
    rmq(self.view).apply_style :root_view
    rmq.append GuessView, :guess_view
    super
  end
end


