module I18n
  class << self
    
    def translate(key, substitutions = {})
      path = NSBundle.mainBundle.pathForResource(ConfigInfo.load_language,ofType:"lproj")
      languageBundle = NSBundle.bundleWithPath(path)
      str = languageBundle.localizedStringForKey(key,value:"",table:nil)
      
      String.new(str).tap do |result|
        substitutions.each do |key, value|
          result.gsub!("%{#{key}}", value.to_s)
        end
      end
    end
    alias t translate
  end
end