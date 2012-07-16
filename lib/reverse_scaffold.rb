module ReverseScaffold
  class Generate
    def run
      puts "Implement me" + __FILE__ + ":" + __LINE__

      file = File.open("tables.txt", "w")

      # special cases here
      special = { 'cities' => 'city', 'businesses' => 'business' }

      plural = 'order_notification_copy'

      singular = plural.sub(/s$/, '')
      singular.gsub!('_', ' ')
      singular = ucwords(singular)
      singular.gsub!(' ', '')

      print plural + ' ' + singular + "\n"
      file.write(plural + ' ' + singular + "\n")

      file.close()
    end
  end
end
