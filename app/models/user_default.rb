class UserDefault
  def self.get_hash
    defaults = NSUserDefaults.standardUserDefaults
    return defaults
  end
  
  def self.get(key)
    self.get_hash[key]
  end

  def self.set(key,value)
    defaults = NSUserDefaults.standardUserDefaults
    defaults[key] = value
  end
end
