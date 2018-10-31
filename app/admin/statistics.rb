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

        end
      end
    end
  end
end
