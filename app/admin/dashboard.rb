ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel 'Welcome to MesaBuggy!' do
          para 'Intro text will go here.'
        end
      end
    end
  end # content
end
