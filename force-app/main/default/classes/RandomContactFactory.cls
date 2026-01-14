public class RandomContactFactory {

    /**
     * Gera uma lista de contatos em memória (não persiste no banco)
     *
     * @param numberOfContacts Quantidade de contatos a serem gerados
     * @param lastName Sobrenome comum a todos os contatos
     * @return List<Contact>
     */
    public static List<Contact> generateRandomContacts(
        Integer numberOfContacts,
        String lastName
    ) {
        List<Contact> contacts = new List<Contact>();

        for (Integer i = 0; i < numberOfContacts; i++) {
            Contact c = new Contact();
            c.FirstName = 'Teste ' + i;
            c.LastName  = lastName;

            contacts.add(c);
        }

        return contacts;
    }
}