/**
 * The User_Service_TEST class provides unit tests for the User_Service class.
 *
 * @author Piotr Rodak
 * @date March 2024
 */
@IsTest
private class User_Service_TEST {

    /**
     * Test method to verify the behavior of the getUserById method.
     */
    @IsTest
    static void getUserById_TEST() {
        // Given
        UserRepository_Interface mockUserRepository = new UserRepositoryImplMock();
        User_Service userService = new User_Service(mockUserRepository);

        // When
        User fetchedUser = userService.getUserById(TestingUtils.generateId(User.SObjectType));

        // Then
        Assert.areEqual(0, Limits.getQueries(), 'No query should be used for testing UserRepositoryImplMock');
        Assert.areEqual('mock@example.com', fetchedUser.Email, 'Emails should be the same');
    }
}
