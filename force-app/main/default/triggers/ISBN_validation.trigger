trigger ISBN_validation on Book__c (before insert, before update) {
    ISBNValidator.checkAndUpdatebookIsbn(trigger.new);
}