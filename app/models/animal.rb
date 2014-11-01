class Animal

  DATA = [["乌鸦","1","1.jpg","aac","crow"],["鹌鹑","2","2.jpg","aac","quail"],["八哥","3","3.jpg","aac","crested myna"],["白颊鸟","4","4.jpg","aac","hornbill"],
    ["白鹭","5","5.jpg","aac","egret"],["白头翁","6","6.jpg","aac","pycnonotus sinensis"],["白鼬","7","7.jpg","aac","stoat"],["斑马","8","8.jpg","aac","zebra"],
    ["豹","9","9.jpg","aac","leopard"],["必胜鸟","10","10.jpg","aac","kingbird"]]
  def self.all
    Animal::DATA
  end

  def self.get_gamedata
    Animal.all.random_count(4)
  end
end
