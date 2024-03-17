/**
 * The UserRepository_Interface interface defines methods for accessing user data.
 * It provides a contract for classes implementing user repository functionality.
 *
 * @author Piotr Rodak
 * @date March 2024
 */
public interface UserRepository_Interface {
    User getUserById(Id userId);
}
