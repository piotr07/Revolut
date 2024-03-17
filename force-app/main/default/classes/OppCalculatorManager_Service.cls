/**
 * The OppCalculatorManager_Service class implements the OppCalculator_Interface to calculate opportunities
 * based on the role of the opportunity owner being Manager.
 * It sets the maximum discount for each opportunity based on the configured setting for the Manager role.
 *
 * @author Piotr Rodak
 * @date March 2024
 */
public with sharing class OppCalculatorManager_Service implements OppCalculator_Interface {

    /**
     * The setting for the Manager role, obtained from Custom Metadata Type Opportunity_Calculator_Based_On_Role__mdt.
     */
    private Opportunity_Calculator_Based_On_Role__mdt roleSetting;

    /**
     * Constructs a new OppCalculatorManager_Service instance.
     * Initializes the roleSetting variable by retrieving the configuration for the Manager role from Custom Metadata.
     */
    public OppCalculatorManager_Service() {
        roleSetting = Opportunity_Calculator_Based_On_Role__mdt.getInstance('Manager');
    }

    /**
     * Calculates opportunities based on the configured setting for the Manager role.
     * Sets the maximum discount for each opportunity to the value specified in the role setting.
     *
     * @param opps A list of opportunities to be calculated.
     */
    public void calculateOpps(List<Opportunity> opps) {
        for (Opportunity opp: opps) {
            opp.Max_Discount__c = roleSetting.Max_Discount__c;
        }
    }
}
