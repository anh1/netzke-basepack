class FormWithoutModel < Netzke::Basepack::Form
  def configure(c)
    c.items = [
      :text_field,
      {:name => :number_field, :attr_type => :integer},
      {:name => :boolean_field, :attr_type => :boolean, :input_value => true},
      {:name => :date_field, :attr_type => :date},
      # {:name => :datetime_field, :attr_type => :datetime}, #incompatible: no xtype
      {:name => :combobox_field, :xtype => :combo, :store => [[1, "One"], [2, "Two"], [3, "Three"]]},
      {:name => :time_field, :attr_type => :time },
    ]

    super
  end

  endpoint :submit do |params|
    data = ActiveSupport::JSON.decode(params[:data])
    this.nz_feedback data.each_pair.map{ |k,v| "#{k.humanize}: #{v}" }.join("<br/>")
  end
end
