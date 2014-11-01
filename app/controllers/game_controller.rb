class GameController < UIViewController 

  def viewDidLoad
    rmq.stylesheet = GameStylesheet
    rmq(self.view).apply_style :root_view
    rmq.append GameView, :game_view
    super
  end
end


