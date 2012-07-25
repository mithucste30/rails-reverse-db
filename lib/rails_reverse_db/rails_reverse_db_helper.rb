module RailsReverseDbHelper
  class RailsReverseDbHelper
    def self.ucwords(str = '')
      str.split(' ').select {|w| w.capitalize! || w }.join(' ');
    end
    
    def self.test_singularity(str)
      str.pluralize != str and str.singularize == str
    end
  end
end