ActiveAdmin.register_page "Statistics" do
  content do
    columns do
      column do
        panel 'Cities' do
          Ahoy::Visit.group("city").count.each do |city, count|
            para raw("City: #{city} &mdash; Count: #{count}")
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
