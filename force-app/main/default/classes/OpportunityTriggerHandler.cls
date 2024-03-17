/**
 * The OpportunityTriggerHandler class provides static methods to handle before insert and before update triggers on Opportunity objects.
 * It delegates the calculation of opportunities to the OppCalculator_Service class.
 *
 * @author Piotr Rodak
 * @date March 2024
 */
public with sharing class OpportunityTriggerHandler {

    /**
     * Handles the before insert trigger event.
     * Calculates opportunities using the OppCalculator_Service class.
     *
     * @param idToOpportunityNew A map containing the Ids of new opportunities and their corresponding Opportunity records.
     */
    public static void handleBeforeInsert(Map<Id, Opportunity> idToOpportunityNew) {
        OppCalculator_Service.calculateOpps(idToOpportunityNew.values());
    }

    /**
     * Handles the before update trigger event.
     * Calculates opportunities using the OppCalculator_Service class.
     *
     * @param idToOpportunityNew A map containing the Ids of updated opportunities and their corresponding updated Opportunity records.
     */
    public static void handleBeforeUpdate(Map<Id, Opportunity> idToOpportunityNew) {
        OppCalculator_Service.calculateOpps(idToOpportunityNew.values());
    }

}