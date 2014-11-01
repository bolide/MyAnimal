# -*- coding: utf-8 -*-
class ConfigInfo < NanoStore::Model
  attribute :name
  attribute :code

  def self.succeed
    if record = ConfigInfo.find(:name=> "succeed").first
      record.code = 1 + record.code.to_i
    else
      record = ConfigInfo.create(:name=>"succeed",:code=>"1")
    end
    record.save
  end

  def self.get_succeed_count
    if record = ConfigInfo.find(:name=> "succeed").first
      return record.code
    else
      0
    end
  end

  def self.guess_succeed
    if record = ConfigInfo.find(:name=> "guess_succeed").first
      record.code = 1 + record.code.to_i
    else
      record = ConfigInfo.create(:name=>"guess_succeed",:code=>"1")
    end
    record.save
  end

  def self.get_guess_succeed_count
    if record = ConfigInfo.find(:name=> "guess_succeed").first
      return record.code
    else
      0
    end
  end

  def self.load_language
    if record = ConfigInfo.find(:name=> "language").first
      language = record.code
    else
      if I18n.locale == "zh-Hans" || I18n.locale == "zh-Hant"
        record = ConfigInfo.create(:name=>"language",:code=>"zh-Hans")
        language = "zh-Hans"
      else
        record = ConfigInfo.create(:name=>"language",:code=>"en")
        language = "en"
      end
      record.save
    end
    return language
  end

  def self.set_language!
    record = ConfigInfo.find(:name=> "language").first
    if ConfigInfo.load_language == "en"
      record.code = "zh-Hans"
    else
      record.code = "en"
    end
    record.save
  end
end
