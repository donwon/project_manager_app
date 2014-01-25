module ApplicationHelper

def truncate_text(x)
  x.truncate 100, omission:"....."
  #interesting,  x.truncate(10), omission does not work, the brackets expects end
  #"end" after the brackets
end

end