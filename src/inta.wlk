import parcelas.*
import semillas.*

class Inta{
	var property parcelas=[]
	method agregarParcela(parcela){parcelas.add(parcela)}
	method cantDeParcelas()=parcelas.size()
	method totalDePlantas()=parcelas.sum({p=>p.size()})
	method promedioDePlantas()=self.totalDePlantas()/self.cantDeParcelas()
	method masAutosustentable(){
		var parcela=parcelas.filter({p=>p.plantas().size()>4})
		return parcela.max({p=>p.porcenajeDeBienAsociadas()})
	}
}