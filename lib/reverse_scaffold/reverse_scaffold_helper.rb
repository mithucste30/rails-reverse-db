module ReverseScaffoldHelper
  def ucwords(str = '')
    str.split(' ').select {|w| w.capitalize! || w }.join(' ');
  end

end