/**
 * The User_Service class provides methods to interact with user data.
 * It encapsulates the functionality related to retrieving user information.
 *
 * @author Piotr Rodak
 * @date March 2024
 */
public with sharing class User_Service {

    /**
     * The repository responsible for accessing user data.
     */
    private UserRepository_Interface userRepository;

    /**
     * Constructs a new User_Service instance with the specified user repository.
     *
     * @param userRepository The user repository implementation to be used by the service.
     */
    public User_Service(UserRepository_Interface userRepository) {
        this.userRepository = userRepository;
    }

    /**
     * Retrieves a user by the specified user ID.
     *
     * @param userId The ID of the user to retrieve.
     * @return The user corresponding to the specified ID.
     */
    public User getUserById(Id userId) {
        return userRepository.getUserById(userId);
    }
}