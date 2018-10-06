ActiveAdmin.register Link do
  permit_params :full_url, :slug
end
