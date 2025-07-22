@isTest
private class HelloPipelineTest {
    @isTest
    static void testSayHello() {
        String result = HelloPipeline.sayHello('World');
        System.assertEquals('Hello, World!', result);
    }
}
