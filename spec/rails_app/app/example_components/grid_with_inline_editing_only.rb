class GridWithInlineEditingOnly < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = 'Book'
    c.edit_in_form = false
  end
end
