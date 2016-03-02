package advancejquery
/**
 * Created by neetesh on 2/3/16.
 */
class ContactController {

    def index() {
        [contacts: Contact.list()]
    }

    def add() {
    }

    def save(Contact contact) {
        Thread.sleep(3000)
        renderAsJSON {
            contact.save(flush: true)
        }
    }

    def updateCircle(Long id, String circle) {
        Contact contact = Contact.get(id)
        contact.circle = circle
        renderAsJSON {
            contact.save(flush: true)
        }
    }

    def isContactExists() {
        Contact contact = Contact.findByMobile(params.mobileField)
        String result = contact ? false : true
        render result
    }

    private void renderAsJSON(def cl) {
        render(contentType: "text/json", encoding: "UTF-8", cl)
    }
}
