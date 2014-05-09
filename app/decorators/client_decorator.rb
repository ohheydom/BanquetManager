class ClientDecorator < ApplicationDecorator
  delegate_all

  def delete_link
    h.link_to 'Delete', object, method: :delete, data: { confirm: 'Are you sure?' }
  end
end
