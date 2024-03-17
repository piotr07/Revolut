/**
 * The UserRepositoryImpl class implements the UserRepository_Interface to provide functionality for retrieving user data.
 * It uses a caching mechanism to optimize the retrieval of user information.
 *
 * @author Piotr Rodak
 * @date March 2024
 */
public with sharing class UserRepositoryImpl implements UserRepository_Interface {

    /**
     * A cache to store retrieved user records for optimization.
     */
    private Map<Id, User> userCache;

    /**
     * Constructs a new UserRepositoryImpl instance and initializes the userCache.
     */
    public UserRepositoryImpl() {
        userCache = new Map<Id, User>();
    }

    /**
     * Retrieves a user by the specified user ID.
     * Utilizes a cache to optimize retrieval by avoiding redundant queries.
     *
     * @param userId The ID of the user to retrieve.
     * @return The user corresponding to the specified ID.
     */
    public User getUserById(Id userId) {
        if (!userCache.containsKey(userId)) {
            User fetchedUser = [
                SELECT Id,
                        UserRole.DeveloperName
                FROM User
                WHERE Id = :userId
                LIMIT 1
            ];

            // Cache the fetched user
            userCache.put(userId, fetchedUser);
        }

        return userCache.get(userId);
    }
}
