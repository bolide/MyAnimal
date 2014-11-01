class CollectionController < UICollectionViewController
  COLLECTION_CELL_ID = "CollectionCell"
  attr_reader :index
  def self.new(args = {})
    # Set layout 
    layout = UICollectionViewFlowLayout.alloc.init
    self.alloc.initWithCollectionViewLayout(layout)
  end

  def viewDidLoad
    super
    self.title = I18n.t("all_animals")

    rmq.stylesheet = CollectionControllerStylesheet

    collectionView.tap do |cv|
      cv.registerClass(CollectionCell, forCellWithReuseIdentifier: COLLECTION_CELL_ID)
      cv.delegate = self
      cv.dataSource = self
      cv.allowsSelection = true
      cv.allowsMultipleSelection = false
      rmq(cv).apply_style :collection_view
    end
    self.navigationItem.leftBarButtonItem = UIBarButtonItem.alloc.initWithTitle(I18n.t("appback"), style:UIBarButtonItemStylePlain, target:self, action:'return_view:')
  end
  
  def return_view(sender)
    controller = MainController.alloc.init
    self.presentViewController(controller, animated:true, completion:nil)
  end
  # Remove if you are only supporting portrait
  def supportedInterfaceOrientations
    UIInterfaceOrientationMaskAll
  end

  # Remove if you are only supporting portrait
  def willAnimateRotationToInterfaceOrientation(orientation, duration: duration)
    rmq(:reapply_style).reapply_styles
  end

  def numberOfSectionsInCollectionView(view)
    1
  end
 
  def collectionView(view, numberOfItemsInSection: section)
    Animal.all.count
  end
    
  def collectionView(view, cellForItemAtIndexPath: index_path)
    view.dequeueReusableCellWithReuseIdentifier(COLLECTION_CELL_ID, forIndexPath: index_path).tap do |cell|
      cell.index= index_path.row
      unless cell.reused
        rmq.build(cell)
      end
      cell.load_data
    end
  end

  def collectionView(view, didSelectItemAtIndexPath: index_path)
    cell = view.cellForItemAtIndexPath(index_path)
  end

end
