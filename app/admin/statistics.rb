ActiveAdmin.register_page "Statistics" do
  content do
    columns do
      column do
        panel 'Cities' do
          table_for Ahoy::Visit.group("city").count do
            column('City') { |city| city.keys.first.to_s }
            column('Visits') { |city| city.first[1] }
          end
        end
      end

      column do
        panel 'Search Stats' do

        end
      end
    end
  end
end
