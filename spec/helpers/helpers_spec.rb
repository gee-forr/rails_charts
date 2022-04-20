require_relative "../rails_helper"

describe RailsCharts::Helpers do
  before do
    User.create(age: 10, role: 'admin')
    User.create(age: 20, role: 'moderator')
    User.create(age: 30, role: 'user')
  end

  describe "#line_chart" do
    it "works" do
      expect { helper.line_chart(User.group(:age).count, style: "margin: 0 auto", width: '1000px', height: '300px', theme: 'vintage', smooth: true, x_title: "Age", y_title: "Count") }.not_to raise_error
    end

    it "works multiline" do
      expect { helper.line_chart(User.distinct.pluck(:role).map{|e| {name: e, data: User.where(role: e).group_by_day(:created_at).count} } , style: "margin: 0 auto", width: '1000px', theme: 'infographic', toolbox: RailsCharts::Options.toolboxes[:download_image_zoom]) }.not_to raise_error
    end
  end

  describe "#area_chart" do
    it "works" do
      expect { helper.area_chart(User.group(:age).count, style: "margin: 0 auto", width: '1000px', height: '300px', theme: 'vintage', smooth: true, x_title: "Age", y_title: "Count") }.not_to raise_error
    end
  end

  describe "#bar_chart" do
    it "works" do
      expect { helper.bar_chart(User.group(:age).count, style: "margin: 0 auto", width: '1000px', height: '300px', theme: 'vintage', smooth: true, x_title: "Age", y_title: "Count") }.not_to raise_error
    end

    it "works (vertical)" do
      expect { helper.bar_chart(User.group(:age).count, vertical: true, style: "margin: 0 auto", width: '1000px', height: '300px', theme: 'vintage', smooth: true, x_title: "Age", y_title: "Count") }.not_to raise_error
    end    
  end

  describe "#pie_chart" do
    it "works" do
      expect { helper.pie_chart(User.group(:age).count, class: 'some_ui_class', style: "margin: 0 auto", width: '1000px', height: '300px', theme: 'vintage', smooth: true, x_title: "Age", y_title: "Count") }.not_to raise_error
    end
  end

  describe "donut_chart" do
    it "works" do
      expect { helper.donut_chart(User.group(:age).count, radius: ['50%', '70%'], style: "margin: 0 auto", width: '1000px', height: '300px', theme: 'vintage', smooth: true, x_title: "Age", y_title: "Count") }.not_to raise_error
    end
  end  

end