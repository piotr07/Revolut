/**
 * The UserRepositoryImplMock class implements the UserRepository_Interface to provide mock functionality for testing purposes.
 * It simulates user data retrieval by returning predefined mock user records.
 *
 * Note: This class is intended for testing purposes only.
 *
 * @author Piotr Rodak
 * @date March 2024
 */
public with sharing class UserRepositoryImplMock implements UserRepository_Interface {

    /**
     * A cache to store predefined mock user records.
     */
    private Map<Id, User> userCache;

    /**
     * Constructs a new UserRepositoryImplMock instance and initializes the userCache.
     */
    public UserRepositoryImplMock() {
        userCache = new Map<Id, User>();
    }

    /**
     * Retrieves a user by the specified user ID.
     * Returns predefined mock user records if available; otherwise, simulates fetching user data.
     *
     * @param userId The ID of the user to retrieve.
     * @return The user corresponding to the specified ID.
     */
    public User getUserById(Id userId) {
        if (!userCache.containsKey(userId)) {
            // Simulate fetching user data
            User testUser = new User(
                    Id = userId,
                    FirstName = 'Mock',
                    LastName = 'User',
                    Email = 'mock@example.com'
            );
            // Cache the mock user record
            userCache.put(userId, testUser);
        }
        // Return user from cache
        return userCache.get(userId);
    }
}
