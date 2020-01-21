public class ISBNValidator {
    
    private static final List<Integer> ThirteenISBN_weights = new List<Integer>{1,3,1,3,1,3,1,3,1,3,1,3,1};
    private static final List<Integer> TenISBN_weights = new List<Integer>{10,9,8,7,6,5,4,3,2,1};
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////      
   public static void checkAndUpdatebookIsbn(List<Book__c> books){
       for(Book__c book: books){
           if(book.ISBN__c == NULL){
               continue;
           }
           String bookIsbn = String.valueOf(book.ISBN__c);
           if(isValid(bookIsbn)){
               if(bookIsbn.length() == 10){
                   book.ISBN__c = convert10DigitIsbnTo13Digit(bookIsbn);
               }
               
           }
           else{
              book.ISBN__c.addError('This is not a valid ISBN. A valid ISBN is a 13 or 10 digit code'); 
           }
       }     
   }
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////      
    public static boolean isValid(string ISBN){
        Integer isbnLength = ISBN.length();
        if(hasCorrectFormat(ISBN, isbnLength)){
            if(checkISBNValidation(ISBN, isbnLength)){
                return true;
            }
        }
        return false;
    }
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////   
    public static boolean hasCorrectFormat(String ISBN, Integer isbnLength){
        //Pattern legitimate_ISBN_pattern;
        if(isbnLength == 13){
            if(Pattern.matches('[0-9]{13}',ISBN)){
                return true;
            }
            return false;
        }
        else if(isbnLength == 10){
            if(Pattern.matches('[0-9]{9}[0-9Xx]',ISBN)){
                return true;
            }
            return false;
        }
        else{
            return false;
        }
    } 
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////   
    public static boolean checkISBNValidation(String ISBN, Integer isbnLength){
        if(isbnLength == 10){
            if(is10DigitIsbnValid(ISBN)){
                return true;
            }
            else{
                return false;
            }
        }
        if(is13DigitIsbnValid(ISBN)){
            return true;
        }
        return false;
    }
   ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
    public static boolean is13DigitIsbnValid(String ISBN){
        List<String> separatedIsbnInDigits = ISBN.split('');
        Integer weightedSum = 0;
        Integer isbnWeightsIndex = 0;
                
        for(String singleDigit: separatedIsbnInDigits){
            weightedSum  += Integer.valueOf(singleDigit)* ThirteenISBN_weights[isbnWeightsIndex];
            isbnWeightsIndex++;
        }
            
        if(math.mod(weightedSum, 10) == 0){
            return true;
        }
        return false;
    }
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
    public static boolean is10DigitIsbnValid(String ISBN){
        Integer weightedSum = 0;
        List<String> separatedIsbnInDigits = ISBN.split('');
        if(separatedIsbnInDigits[separatedIsbnInDigits.size()-1].toUpperCase() == 'X'){
            weightedSum = 10;
            separatedIsbnInDigits.remove(separatedIsbnInDigits.size()-1);
            
        }
        Integer isbnWeightsIndex = 0;
                
        for(String singleDigit: separatedIsbnInDigits){
            weightedSum  += Integer.valueOf(singleDigit)* TenISBN_weights[isbnWeightsIndex];
            isbnWeightsIndex++;
        }
            
        if(math.mod(weightedSum, 11) == 0){
            return true;
        }
        return false;
    }
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
    public static string convert10DigitIsbnTo13Digit(String ISBN){
        List<String> separatedIsbnInDigits = ISBN.split('');
        separatedIsbnInDigits.add(0, '978');
        ISBN = String.join(separatedIsbnInDigits , '');
        
        String expectedCheckDigit = findTheCorrectLastDigitOfConverted10DigitIsbn(ISBN);
        separatedIsbnInDigits.remove(separatedIsbnInDigits.size() -1);
        separatedIsbnInDigits.add(expectedCheckDigit);
        
        return String.join(separatedIsbnInDigits, '');
    }
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  // This method assumes the 13 digit ISBN parameter has potentially the wrong format,i.e. contains no letter except X at the end
    public static string findTheCorrectLastDigitOfConverted10DigitIsbn(String ISBN){
        List<String> separatedIsbnInDigits = ISBN.split('');
        separatedIsbnInDigits.remove(separatedIsbnInDigits.size()-1);
        Integer lastDigit = 0;
        Integer isbnWeightsIndex = 0;
                
        for(String singleDigit: separatedIsbnInDigits){
            lastDigit  += Integer.valueOf(singleDigit)* ThirteenISBN_weights[isbnWeightsIndex];
            isbnWeightsIndex++;
        }
        lastDigit = math.mod(10 - math.mod(lastDigit, 10 ), 10);
        return String.valueOf(lastDigit);
    }
}