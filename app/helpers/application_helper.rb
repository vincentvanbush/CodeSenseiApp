module ApplicationHelper

	def bootstrap_flash_key(key)
		mapping = { 
			notice: 'info',
			success: 'success',
			alert: 'warning',
			error: 'danger'
		
		}


		mapping[key.to_sym]

	end

end
