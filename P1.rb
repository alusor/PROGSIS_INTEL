
class Cadena
	attr_accessor :label
	attr_accessor :mnemonic
	attr_accessor :arguments
	def initialize cadena
		@array = cadena.split

		if @array.length == 2 then
			@mnemonic = @array[0]
			@arguments = @array[1..@array.length]
			if @arguments == nil then
				print "es nulo"
			end
			if @arguments !=nil then
				@arguments = @arguments[0].split ","
			end
		end
		if @array.length == 3 then
			@label = @array[0]
			@mnemonic = @array[1]
			@arguments = @array[2..@array.length]
		if @arguments !=nil then
			@arguments = @arguments[0].split ","
		end
		end
		
	end
	def analize_label
		if @label != nil then
			if @label[-1] == ":" then
				return "Etiqueta correcta "
			else 
				return "Etiqueta incorrecta "
			end
		else
			return "Sin etiqueta"
		end
	end
	def analize_mnemonic
		if @mnemonic != nil then
			if @mnemonic == "MOV" then
				return "Mnemonico valido "
			else
				return "Mnemonico invalido "
			end 
		end
	end
	def analize_arguments
		a = ""
		if @arguments != nil then
			#print @arguments
			if @arguments.length > 3 then
				return "Sobrecarga de Argumentos"
			else 
				if @arguments.length >0 then
					for argument in @arguments do
						if argument[-1] == "H" or argument[-1] == "B" then
							a += "Argumento Valido "
						else
							a += "Argumento Invalido "
						end
					end
				end
				return a
			end
			
		end
	end
end

class OpenFile
	attr_accessor :archivo
	def initialize name
		begin 
			@archivo = File.new name
		rescue
			@archivo = nil
		end
	end
	def separate
		if @archivo != nil then
			return @archivo.readlines
		end
	end
end


puts "Nombre del archivo de entrada"
STDOUT.flush
@resultado = ""
i =  0
nombre = gets.chomp
file = OpenFile.new nombre
if file.archivo != nil then 
	lines = file.separate
	for line in lines do
		line = line.gsub ", ", ","
		if line != nil and line[0].ord !=  10 then
			 temp = Cadena.new line
			 #if temp.analize_label then
			 #	@resultado += "Correcto"
			 #end
			 #if temp.analize_mnemonic then
			# 	@resultado += "Correcto"
			 #nd
			 #if temp.analize_arguments.to_s["Invalido"] then
			 #	@resultado += "Incorrecto"
			 #else
			 #	@resultado += "Correcto"
			 #end
			 @resultado += "Linea: " + i.to_s + " "
			 @resultado += temp.analize_label.to_s
			 @resultado += temp.analize_mnemonic.to_s
			 @resultado += temp.analize_arguments.to_s
			 @resultado += "\n"
			 i+=1
		end
	end
	write = File.new("out.err",'w')
	write.puts @resultado
else
	print "Archivo no encontrado..."
end