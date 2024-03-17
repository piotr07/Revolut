/**
 * The OppCalculator_Service class provides methods to calculate opportunities based on user roles.
 * @author Piotr Rodak
 * @date March 2024
 */
public with sharing class OppCalculator_Service {
    // I know that calculating max discount would be calculated in another way (for example via record-triggered flow)
    // but I prepared that solution to demonstrate trigger best practices, using repository pattern and single responsibility principle
    // I didn't want to focus on complex business logic.

    /**
     * A map that associates user role developer names with their respective calculator implementation classes.
     */
    private static final Map<String, Type> userTypeToCalculatorImpl = new Map<String, Type> {
        'CTO' => OppCalculatorCTO_Service.class,
        'Sales_Associate' => OppCalculatorSalesAssoc_Service.class,
        'Sales_Manager' => OppCalculatorManager_Service.class
    };

    /**
     * Calculates opportunities based on the user roles of the opportunity owners.
     *
     * @param opps A list of opportunities to be calculated.
     */
    public static void calculateOpps(List<Opportunity> opps) {
        Map<String, List<Opportunity>> oppOwnerRoleDeveloperNameToOpps = getOppOwnerRoleDeveloperNameToOpps(opps);

        for (String oppOwnerDeveloperName : oppOwnerRoleDeveloperNameToOpps.keySet()) {
            OppCalculator_Interface oppCalculator = (OppCalculator_Interface) userTypeToCalculatorImpl.get(
                oppOwnerDeveloperName
            )?.newInstance();

            if (oppCalculator == null) {
                return;
            }

            oppCalculator.calculateOpps(oppOwnerRoleDeveloperNameToOpps.get(oppOwnerDeveloperName));
        }
    }

    /**
     * Creates a map that associates opportunity owner role developer names with lists of opportunities.
     *
     * @param opps A list of opportunities.
     * @return A map where keys are opportunity owner role developer names and values are lists of opportunities.
     */
    private static Map<String, List<Opportunity>> getOppOwnerRoleDeveloperNameToOpps(List<Opportunity> opps) {
        Map<String, List<Opportunity>> oppOwnerRoleDeveloperNameToOpps = new Map<String, List<Opportunity>>();
        UserRepository_Interface userRepository = new UserRepositoryImpl();
        User_Service userService = new User_Service(userRepository);

        for (Opportunity opp : opps) {
            String userRoleDeveloperName = userService.getUserById(opp.OwnerId).UserRole.DeveloperName;
            if (oppOwnerRoleDeveloperNameToOpps.containsKey(userRoleDeveloperName)) {
                List<Opportunity> opportunities = oppOwnerRoleDeveloperNameToOpps.get(userRoleDeveloperName);
                opportunities.add(opp);
            } else {
                oppOwnerRoleDeveloperNameToOpps.put(userRoleDeveloperName, new List<Opportunity>{ opp });
            }
        }

        return oppOwnerRoleDeveloperNameToOpps;
    }
}