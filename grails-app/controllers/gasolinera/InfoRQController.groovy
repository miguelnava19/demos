package gasolinera

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Transactional(readOnly = true)
class InfoRQController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def infoRQService

    @Transactional
    def save(InfoRQ infoRQInstance) {
        log.debug("params --> "+ params)
        println("params --> "+ params)
        log.debug("params --> " + params)
        if (infoRQInstance == null) {
            notFound()
            return
        }
        def mensaje = "Registro éxitoso"
        def success = true
        def error = false

        if (!infoRQInstance.validate()) {
            def errors = infoRQInstance.errors.allErrors.collect {
                [g.message(error: it)]
            }
            mensaje = errors.join(",")
            error = true
            success = false
            infoRQInstance.discard()
        } else {
            def resp = infoRQService.validate(infoRQInstance)
            println("resp --> " + resp)
            if (resp?.error) {
                mensaje = resp?.errores?.join(",")?.toString()
                error = true
                success = false
                infoRQInstance.discard()
            } else
                infoRQInstance.save(flush: true)
        }

        request.withFormat {
            form multipartForm {
                render([success: success, error: error, message: mensaje] as JSON)
            }
            '*' { respond infoRQInstance, [status: CREATED] }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'infoRQ.label', default: 'InfoRQ'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
