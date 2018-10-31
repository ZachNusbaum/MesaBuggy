ActiveAdmin.register_page "Statistics" do
  content do
    columns do
      column do
        panel 'Cities' do
          table_for Ahoy::Visit.group("city").count.each do
            column('City') { |c| c[0].blank? ? 'N/A' : c[0] }
            column('Count') { |c| c[1] }
          end
        end
      end

      column do
        panel 'Search Stats' do
          table_for Ahoy::Event.where(name: 'Site search') do
            column :time
            column("Query") { |event| event.properties['name_or_description_cont'] }
          end
        end
      end
    end

    columns do
      column do
        panel 'Average Product Ratings' do
          table_for Review.all.includes(:product).joins(:product).group('products.name').average(:rating).each do
            column('Product') { |p| p[0] }
            column('Avg. Rating') { |p| p[1] }
          end
        end
      end
    end
  end
end
