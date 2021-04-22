@isTest
private class ExternalSearch_Test {
    @isTest
    static void testMethodOne() {
        HTTPMockFactory mock = new HTTPMockFactory(200, 'OK', 'I found it!', new Map<String, String>());
        Test.setMock(HttpCalloutMock.class, mock);
        String result;
        Test.startTest();
            result = ExternalSearch.googleIt('epic search');
        Test.stopTest();
        System.assertEquals('I found it!', result, 'Returned Result did not match.');
    }
}
