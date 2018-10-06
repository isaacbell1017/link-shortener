ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    columns do
      column do
        panel "Recent Links" do
          ul do
            Link.last(10).map do |link|
              li link_to(link.full_url, link_path(link))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "You can edit links at will using this dashboard."

          para "In total we have #{Link.count} links created."
        end
      end
    end
  end # content
end
