module ApplicationHelper
	def bootstrap_flash_key(key)
		mapping = {
			notice: 'info',
			success: 'success',
			alert: 'warning',
			error: 'danger'
		}.with_indifferent_access
		mapping[key]
	end	
end
