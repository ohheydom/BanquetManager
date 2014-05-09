class ClientDecorator < ApplicationDecorator
  delegate_all

  def delete_link
    h.link_to 'Delete', object, method: :delete, data: { confirm: 'Are you sure?' }
  end

  def edit_link
    h.link_to object.name, h.edit_client_path(object)
  end

  def base_price
    h.number_to_currency object.base_price
  end
end
