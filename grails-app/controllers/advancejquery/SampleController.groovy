package advancejquery

class SampleController {

    def index() {
    }

    def sendMail(MailCO co) {
        println("Incoming parameters : ${co.properties}")
        render(view: 'mailSendSuccess', model: [email: co.email])
    }
}
