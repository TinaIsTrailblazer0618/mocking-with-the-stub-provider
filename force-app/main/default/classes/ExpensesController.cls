public with sharing class ExpensesController {

    static Map<String, Schema.SObjectField> fieldDescribeTokens = 
        Schema.SObjectType.Expense__c.fields.getMap();

    @AuraEnabled
    public static List<Expense__c> getExpenses() {
        // Check to make sure all fields are accessible to this user
        List<String> fieldsToCheck = new List<String> {
            'Id', 'Name', 'Amount__c', 'Client__c', 'Date__c',
            'Reimbursed__c', 'CreatedDate'
        };

        for (String field : fieldsToCheck) {
            if (!fieldDescribeTokens.get(field).getDescribe().isAccessible()) {
                throw new System.NoAccessException();
            }
        }

        // After performing isAccessible() checking, if OK, they're cool, let 'em through
        return [SELECT Id, Name, Amount__c, Client__c, Date__c,
                        Reimbursed__c, CreatedDate 
                FROM Expense__c];       
    } 

    @AuraEnabled
    public static Expense__c saveExpense(Expense__c expense) {
        // Check to make sure all fields are updateable to this user
        String fieldUpdated = 'Reimbursed__c';
        
        if (!fieldDescribeTokens.get(fieldUpdated).getDescribe().isUpdateable()) {
            throw new System.NoAccessException();
        }
        System.debug('expense record: ' + expense);

        // After performing isUpdateable() checking,
        upsert expense;
        return expense;
    }

}