@isTest
public class TestVerifyDate {

    // date2 dentro de 30 dias
    @isTest
    static void shouldReturnDate2WhenWithin30Days() {
        Date date1 = Date.newInstance(2025, 3, 1);
        Date date2 = Date.newInstance(2025, 3, 15);

        Date result = VerifyDate.CheckDates(date1, date2);

        System.assertEquals(
            date2,
            result,
            'Quando date2 está dentro de 30 dias, deve retornar date2'
        );
    }

    // date2 exatamente no limite de 30 dias
    @isTest
    static void shouldReturnEndOfMonthWhenExactly30Days() {
        Date date1 = Date.newInstance(2025, 3, 1);
        Date date2 = date1.addDays(30);

        Date result = VerifyDate.CheckDates(date1, date2);
        Date expected = Date.newInstance(2025, 3, 31);

        System.assertEquals(
            expected,
            result,
            'Quando date2 é exatamente 30 dias, deve retornar o fim do mês'
        );
    }

    // date2 após 30 dias
    @isTest
    static void shouldReturnEndOfMonthWhenAfter30Days() {
        Date date1 = Date.newInstance(2025, 3, 1);
        Date date2 = Date.newInstance(2025, 4, 10);

        Date result = VerifyDate.CheckDates(date1, date2);
        Date expected = Date.newInstance(2025, 3, 31);

        System.assertEquals(
            expected,
            result,
            'Quando date2 passa de 30 dias, deve retornar o fim do mês'
        );
    }

    // date2 no passado
    @isTest
    static void shouldReturnEndOfMonthWhenDate2IsInPast() {
        Date date1 = Date.newInstance(2025, 3, 10);
        Date date2 = Date.newInstance(2025, 3, 1);

        Date result = VerifyDate.CheckDates(date1, date2);
        Date expected = Date.newInstance(2025, 3, 31);

        System.assertEquals(
            expected,
            result,
            'Quando date2 está no passado, deve retornar o fim do mês'
        );
    }

    // valida fevereiro em ano bissexto
    @isTest
    static void shouldHandleLeapYearCorrectly() {
        Date date1 = Date.newInstance(2024, 2, 5);
        Date date2 = Date.newInstance(2024, 4, 1);

        Date result = VerifyDate.CheckDates(date1, date2);
        Date expected = Date.newInstance(2024, 2, 29);

        System.assertEquals(
            expected,
            result,
            'Deve retornar 29/02 em ano bissexto'
        );
    }
}