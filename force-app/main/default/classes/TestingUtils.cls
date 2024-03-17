/**
 * The TestingUtils class provides utility methods for testing purposes.
 * It includes methods to generate unique IDs for SObject records.
 *
 * @author Piotr Rodak
 * @date March 2024
 */
public class TestingUtils {

    /**
     * The starting number used for generating unique IDs.
     */
    private static Integer startingNumber = 1;

    /**
     * Generates a unique ID for the specified SObject type.
     *
     * @param sObjectType The schema SObjectType for which the ID needs to be generated.
     * @return A string representing the generated unique ID.
     */
    public static String generateId(Schema.SObjectType sObjectType) {
        String result = String.valueOf(startingNumber++);
        return sObjectType.getDescribe().getKeyPrefix() + '0'.repeat(12 - result.length()) + result;
    }

    /**
     * Generates a unique ID for the specified SObject instance if it does not already have an ID.
     *
     * @param objectInstance The SObject instance for which the ID needs to be generated.
     * @return The updated SObject instance with a generated unique ID.
     */
    public static SObject generateId(SObject objectInstance) {
        if (objectInstance.Id == null) {
            objectInstance.Id = generateId(objectInstance.getSObjectType());
        }
        return objectInstance;
    }

    /**
     * Generates unique IDs for a list of SObject records if they do not already have IDs.
     *
     * @param records The list of SObject records for which IDs need to be generated.
     */
    public static void generateIds(List<SObject> records) {
        for (SObject record : records) {
            if (record.Id == null) {
                generateId(record);
            }
        }
    }
}
