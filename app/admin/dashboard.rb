ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel 'Welcome to MesaBuggy!' do
          para 'Intro text will go here.'
        end
      end

      column do
        panel 'Recent Visits' do
          table_for Ahoy::Visit.all.order(started_at: :desc).limit(10) do
            column :ip
            column :referrer
            column('City / Region') { |visit| "#{visit.city}, #{visit.region}" }
          end
        end

        panel 'Recent Searches' do
          table_for Ahoy::Event.all
            .where(name: "Site search")
            .order(time: :desc)
            .limit(10) do
            column :time
            column :properties
          end
        end
      end
    end
  end # content
end
