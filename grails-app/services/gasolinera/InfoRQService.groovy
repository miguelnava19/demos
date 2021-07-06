package gasolinera

import grails.transaction.Transactional

@Transactional
class InfoRQService {

    def validate(InfoRQ infoRQInstance) {
        log.debug("validating instance"+ infoRQInstance)
        println("validating instance"+ infoRQInstance)
        def errores = []
        if (infoRQInstance.expirationDateYear.toString().size() != 4)
            errores << "Year expiration min size min acepted 4"

        if (infoRQInstance.amount <= 0)
            errores << "Amount must be greater than 0"
        return [error: errores.size() > 0, errores: errores]
    }
}
