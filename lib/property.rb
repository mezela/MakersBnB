class Property

  attr_reader :id, :title, :description, :picture, :ppn, :start_date, :end_date
  
def initialize(
  id: id,
  title: title,
  description: description,
  picture: picture,
  ppn: ppn,
  start_date: start_date,
  end_date: end_date
)
@id = id
@title = title
@description = description
@picture = picture
@ppn = ppn
@start_date = start_date
@end_date = end_date
end

end
