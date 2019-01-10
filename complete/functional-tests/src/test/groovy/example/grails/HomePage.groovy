package example.grails

import geb.Page

class HomePage extends Page {

    static url = '/#/'

    static at = { title.contains('Grails & Vue') }

    static content = {
        controllers { $('#controllers li') }
    }

    List<String> controllerNames() {
        controllers.collect { it.text() } as List<String>
    }
}
