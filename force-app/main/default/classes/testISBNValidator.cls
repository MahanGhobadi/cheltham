@isTest
private class testISBNValidator {
    @isTest
    static void testFindTheCorrectLastDigitOfConvertedIsbn(){
        List<String> validISBNs = ISBNValidatorUtility.createValidISBNs();
        List<String> correctlyFormattedWithInvalidISBNs = ISBNValidatorUtility.createCorrectlyFormattedWithInvalidISBNs();
        
        system.assertEquals('3', ISBNValidator.findTheCorrectLastDigitOfConverted10DigitIsbn('9781111111111'));
        system.assertEquals('3', ISBNValidator.findTheCorrectLastDigitOfConverted10DigitIsbn('978900002000X'));
        system.assertEquals('3', ISBNValidator.findTheCorrectLastDigitOfConverted10DigitIsbn('978900002000x'));
    }
    @isTest
    static void testConvert10DigitIsbnTo13Digit(){
       	List<String> validISBNs = ISBNValidatorUtility.createValidISBNs();
        
       	system.assertEquals('9781111111113', ISBNValidator.convert10DigitIsbnTo13Digit(validISBNs[0]));
        system.assertEquals('9789000020003', ISBNValidator.convert10DigitIsbnTo13Digit(validISBNs[1]));
        
    }
    @isTest
    static void testIs10DigitIsbnValid(){
       	List<String> validISBNs = ISBNValidatorUtility.createValidISBNs();
       	List<String> correctlyFormattedWithInvalidISBNs = ISBNValidatorUtility.createCorrectlyFormattedWithInvalidISBNs();
        
       	system.assertEquals(true, ISBNValidator.is10DigitIsbnValid(validISBNs[0]));
        system.assertEquals(true, ISBNValidator.is10DigitIsbnValid(validISBNs[1]));
        system.assertEquals(false, ISBNValidator.is10DigitIsbnValid(correctlyFormattedWithInvalidISBNs[0]));
        system.assertEquals(false, ISBNValidator.is10DigitIsbnValid(correctlyFormattedWithInvalidISBNs[1]));
        system.assertEquals(false, ISBNValidator.is10DigitIsbnValid(correctlyFormattedWithInvalidISBNs[3]));
        
    }
    @isTest
    static void testIs13DigitIsbnValid(){
       	List<String> validISBNs = ISBNValidatorUtility.createValidISBNs();
       	List<String> correctlyFormattedWithInvalidISBNs = ISBNValidatorUtility.createCorrectlyFormattedWithInvalidISBNs();
        
        system.assertEquals(true, ISBNValidator.is13DigitIsbnValid(validISBNs[3]));
        system.assertEquals(false, ISBNValidator.is13DigitIsbnValid(correctlyFormattedWithInvalidISBNs[2]));
    }
    @isTest
    static void testCheckISBNValidation(){
       	List<String> validISBNs = ISBNValidatorUtility.createValidISBNs();
       	List<String> correctlyFormattedWithInvalidISBNs = ISBNValidatorUtility.createCorrectlyFormattedWithInvalidISBNs();
        List<String> incorrectlyFormattedISBNs = ISBNValidatorUtility.createincorrectlyFormattedISBNs();
        
        system.assertEquals(true, ISBNValidator.checkISBNValidation(validISBNs[0], 10));
        system.assertEquals(true, ISBNValidator.checkISBNValidation(validISBNs[3], 13));
        system.assertEquals(false, ISBNValidator.checkISBNValidation(correctlyFormattedWithInvalidISBNs[0], 10));
        system.assertEquals(false, ISBNValidator.checkISBNValidation(correctlyFormattedWithInvalidISBNs[2], 13));
        system.assertEquals(false, ISBNValidator.checkISBNValidation(incorrectlyFormattedISBNs[3], 11));
    }
    @isTest
    static void testHasCorrectFormat(){
       List<String> validISBNs = ISBNValidatorUtility.createValidISBNs();
       	List<String> correctlyFormattedWithInvalidISBNs = ISBNValidatorUtility.createCorrectlyFormattedWithInvalidISBNs();
        List<String> incorrectlyFormattedISBNs = ISBNValidatorUtility.createincorrectlyFormattedISBNs();
        
        system.assertEquals(true, ISBNValidator.hasCorrectFormat(validISBNs[0], 10));
        system.assertEquals(true, ISBNValidator.hasCorrectFormat(validISBNs[3], 13));
        system.assertEquals(true, ISBNValidator.hasCorrectFormat(correctlyFormattedWithInvalidISBNs[0], 10));
        system.assertEquals(true, ISBNValidator.hasCorrectFormat(correctlyFormattedWithInvalidISBNs[2], 13));
        system.assertEquals(false, ISBNValidator.hasCorrectFormat(incorrectlyFormattedISBNs[0], 10));
        system.assertEquals(false, ISBNValidator.hasCorrectFormat(incorrectlyFormattedISBNs[1], 13));
        system.assertEquals(false, ISBNValidator.hasCorrectFormat(incorrectlyFormattedISBNs[2], 10));
        system.assertEquals(false, ISBNValidator.hasCorrectFormat(incorrectlyFormattedISBNs[3], 11));
        system.assertEquals(false, ISBNValidator.hasCorrectFormat(incorrectlyFormattedISBNs[4], 14)); 
    }
    @isTest
    static void testIsValid(){
       	List<String> validISBNs = ISBNValidatorUtility.createValidISBNs();
       	List<String> correctlyFormattedWithInvalidISBNs = ISBNValidatorUtility.createCorrectlyFormattedWithInvalidISBNs();
        List<String> incorrectlyFormattedISBNs = ISBNValidatorUtility.createIncorrectlyFormattedISBNs();
        
        system.assertEquals(ISBNValidator.isValid(validISBNs[0]), true);
        system.assertEquals(ISBNValidator.isValid(validISBNs[1]), true);
        
        system.assertEquals(ISBNValidator.isValid(correctlyFormattedWithInvalidISBNs[0]), false);
        system.assertEquals(ISBNValidator.isValid(correctlyFormattedWithInvalidISBNs[1]), false);
        system.assertEquals(ISBNValidator.isValid(correctlyFormattedWithInvalidISBNs[2]), false);
        system.assertEquals(ISBNValidator.isValid(correctlyFormattedWithInvalidISBNs[3]), false);
        
        system.assertEquals(ISBNValidator.isValid(incorrectlyFormattedISBNs[0]), false);
        system.assertEquals(ISBNValidator.isValid(incorrectlyFormattedISBNs[1]), false);
        system.assertEquals(ISBNValidator.isValid(incorrectlyFormattedISBNs[2]), false);
        system.assertEquals(ISBNValidator.isValid(incorrectlyFormattedISBNs[3]), false);
    }
    @isTest
    static void testcheckAndUpdatebookIsbn(){
       	List<book__c> bookWithValidISBNs = ISBNValidatorUtility.createBookWithValidISBNs();
       	List<book__c> bookWithCorrectlyFormattedWithInvalidISBNs = ISBNValidatorUtility.createBookWithCorrectlyFormattedWithInvalidISBNs();
        List<book__c> bookWithIncorrectlyFormattedISBNs = ISBNValidatorUtility.createBookWithIncorrectlyFormattedISBNs();
        
        ISBNValidator.checkAndUpdatebookIsbn(bookWithValidISBNs);
        system.assertEquals('9781111111113', String.valueOf(bookWithValidISBNs[0].ISBN__c));
        system.assertEquals('9789000020003', String.valueOf(bookWithValidISBNs[2].ISBN__c));
        
        try{
            ISBNValidator.checkAndUpdatebookIsbn(bookWithCorrectlyFormattedWithInvalidISBNs);
        }catch(Exception error){
            system.assert(error.getMessage().contains('This is not a valid ISBN. A valid ISBN is a 13 or 10 digit code'));
        }
        
        try{
            ISBNValidator.checkAndUpdatebookIsbn(bookWithIncorrectlyFormattedISBNs);
        }catch(Exception error){
            system.assert(error.getMessage().contains('This is not a valid ISBN. A valid ISBN is a 13 or 10 digit code'));
        }
    }
    
    @isTest
    static void testISBN_validation(){
       	List<book__c> bookWithValidISBNs = ISBNValidatorUtility.createBookWithValidISBNs();
       	List<book__c> bookWithCorrectlyFormattedWithInvalidISBNs = ISBNValidatorUtility.createBookWithCorrectlyFormattedWithInvalidISBNs();
        List<book__c> bookWithIncorrectlyFormattedISBNs = ISBNValidatorUtility.createBookWithIncorrectlyFormattedISBNs();
        
        try{
            insert bookWithCorrectlyFormattedWithInvalidISBNs;
        }
        catch(Exception error){
            system.assert(error.getMessage().contains('This is not a valid ISBN. A valid ISBN is a 13 or 10 digit code'));
        }
        
        try{
            insert bookWithIncorrectlyFormattedISBNs;
        }
        catch(Exception error){
            system.assert(error.getMessage().contains('This is not a valid ISBN. A valid ISBN is a 13 or 10 digit code'));
        }
    }
}