@isTest
public class ISBNValidatorUtility {
	@isTest
    public static List<String> createCorrectlyFormattedWithInvalidISBNs(){
        List<String> correctlyFormattedWithInvalidISBNs = new List<String>();
        correctlyFormattedWithInvalidISBNs.add('1111111112');
        correctlyFormattedWithInvalidISBNs.add('900000000X');
        correctlyFormattedWithInvalidISBNs.add('9789878767421');
        correctlyFormattedWithInvalidISBNs.add('900000000x');
        
        return correctlyFormattedWithInvalidISBNs;
    }
    @isTest
    public static List<String> createValidISBNs(){
        List<String> validISBNs = new List<String>();
        validISBNs.add('1111111111');
        validISBNs.add('900002000X');
        validISBNs.add('900002000x');
        validISBNs.add('9780747546245');
        
        return validISBNs;
    }
    @isTest
    public static List<String> createIncorrectlyFormattedISBNs(){
        List<String> incorrectlyFormattedISBNs = new List<String>();
        incorrectlyFormattedISBNs.add('12345678XX');
        incorrectlyFormattedISBNs.add('xc`~\\`!1@4%5');
        incorrectlyFormattedISBNs.add('900002000A');
        incorrectlyFormattedISBNs.add('90000200031');
        incorrectlyFormattedISBNs.add('97807475462450');
        
        return incorrectlyFormattedISBNs;
    }
    @isTest
	public static List<book__c> createBookWithCorrectlyFormattedWithInvalidISBNs(){
        List<book__c> bookWithCorrectlyFormattedWithInvalidISBNs = new List<book__c>();
        bookWithCorrectlyFormattedWithInvalidISBNs.add(new book__c(ISBN__c = '1111111112'));
        bookWithCorrectlyFormattedWithInvalidISBNs.add(new book__c(ISBN__c = '900000000X'));
        bookWithCorrectlyFormattedWithInvalidISBNs.add(new book__c(ISBN__c = '9789878767421'));
        bookWithCorrectlyFormattedWithInvalidISBNs.add(new book__c(ISBN__c = '900000000x'));
        
        return bookWithCorrectlyFormattedWithInvalidISBNs;
    }
    @isTest
    public static List<book__c> createBookWithValidISBNs(){
        List<book__c> bookWithValidISBNs = new List<book__c>();
        bookWithValidISBNs.add(new book__c(ISBN__c = '1111111111'));
        bookWithValidISBNs.add(new book__c(ISBN__c = '900002000X'));
        bookWithValidISBNs.add(new book__c(ISBN__c = '900002000x'));
        bookWithValidISBNs.add(new book__c(ISBN__c = '9780747546245'));
        
        return bookWithValidISBNs;
    }
    @isTest
    public static List<book__c> createBookWithIncorrectlyFormattedISBNs(){
        List<book__c> bookWithIncorrectlyFormattedISBNs = new List<book__c>();
        bookWithIncorrectlyFormattedISBNs.add(new book__c(ISBN__c = '12345678XX'));
        bookWithIncorrectlyFormattedISBNs.add(new book__c(ISBN__c = 'xc`~\\`!1@4%5'));
        bookWithIncorrectlyFormattedISBNs.add(new book__c(ISBN__c = '900002000A'));
        bookWithIncorrectlyFormattedISBNs.add(new book__c(ISBN__c = '90000200031'));
        bookWithIncorrectlyFormattedISBNs.add(new book__c(ISBN__c = '97807475462450'));
        
        return bookWithIncorrectlyFormattedISBNs;
    }
}