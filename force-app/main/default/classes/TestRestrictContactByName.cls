@IsTest
public class TestRestrictContactByName {

    @IsTest
    static void testInsertValidContact() {
        // Cenário válido (não deve gerar erro)
        Contact c = new Contact(
            FirstName = 'João',
            LastName  = 'Silva'
        );

        Test.startTest();
        insert c;
        Test.stopTest();

        // Confirma que o contato foi inserido
        System.assertNotEquals(null, c.Id, 'O contato válido deveria ser inserido.');
    }

    @IsTest
    static void testInsertInvalidContact() {
        // Cenário inválido (deve gerar erro)
        Contact c = new Contact(
            FirstName = 'Teste',
            LastName  = 'INVALIDNAME'
        );

        Test.startTest();
        try {
            insert c;
            System.assert(false, 'Era esperado um erro de validação no insert.');
        } catch (DmlException e) {
            System.assert(
                e.getMessage().contains('INVALIDNAME'),
                'A mensagem de erro deveria mencionar o sobrenome inválido.'
            );
        }
        Test.stopTest();
    }

    @IsTest
    static void testUpdateToInvalidLastName() {
        // Cria contato inicialmente válido
        Contact c = new Contact(
            FirstName = 'Maria',
            LastName  = 'Souza'
        );
        insert c;

        // Atualiza para um sobrenome inválido
        c.LastName = 'INVALIDNAME';

        Test.startTest();
        try {
            update c;
            System.assert(false, 'Era esperado um erro de validação no update.');
        } catch (DmlException e) {
            System.assert(
                e.getMessage().contains('INVALIDNAME'),
                'A mensagem de erro deveria mencionar o sobrenome inválido.'
            );
        }
        Test.stopTest();
    }

    @IsTest
    static void testUpdateValidContact() {
        // Cria contato válido
        Contact c = new Contact(
            FirstName = 'Carlos',
            LastName  = 'Pereira'
        );
        insert c;

        // Atualização válida
        c.LastName = 'Almeida';

        Test.startTest();
        update c;
        Test.stopTest();

        // Confirma que o update ocorreu
        Contact updated = [SELECT LastName FROM Contact WHERE Id = :c.Id];
        System.assertEquals(
            'Almeida',
            updated.LastName,
            'O sobrenome deveria ter sido atualizado com sucesso.'
        );
    }
}