module Enumerable

	def my_each
		if block_given?
			for item in self
				yield(item)
			end
		end
		self
	end

	def my_each_with_index
		if block_given?
			i=0
			while i < self.size
				yield(self[i], i)
				i+=1
			end
		end
		self
	end

	def my_select
		array = []
		self.my_each {|item| array << item if yield(item)}
		array
	end

	def my_all?
		for item in self
			return false if yield(item) == false
		end
		true
	end

	def my_any?
		for item in self
			return true if yield(item) == true
		end
		false
	end

	def my_none?
		for item in self
			return false if yield(item) == true
		end
		true
	end

	def my_count (x = nil)
		count = 0
		if block_given?
			for item in self
				count+=1 if yield(item) == true
			end
		elsif x != nil
			for item in self
				count+=1 if x==item
			end
		else
			return self.size
		end
		count
	end

	def my_map
		array = []
		for item in self
			array << yield(item)
		end
		array
	end

	def my_map_with_proc_or_block (proc=false)
		if proc != false
			for item in self
				proc.call(item)
			end
		else
			for item in self
				yield(item)
			end
		end
		self
	end

end

