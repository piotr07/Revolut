/**
 * The OppCalculatorCTO_Service class implements the OppCalculator_Interface to calculate opportunities
 * based on the role of the opportunity owner being Chief Technology Officer (CTO).
 * It sets the maximum discount for each opportunity based on the configured setting for the CTO role.
 *
 * @author Piotr Rodak
 * @date March 2024
 */
public with sharing class OppCalculatorCTO_Service implements OppCalculator_Interface {

    /**
     * The setting for the CTO role, obtained from Custom Metadata Type Opportunity_Calculator_Based_On_Role__mdt.
     */
    private Opportunity_Calculator_Based_On_Role__mdt roleSetting;

    /**
     * Constructs a new OppCalculatorCTO_Service instance.
     * Initializes the roleSetting variable by retrieving the configuration for the CTO role from Custom Metadata.
     */
    public OppCalculatorCTO_Service() {
        roleSetting = Opportunity_Calculator_Based_On_Role__mdt.getInstance('CTO');
    }

    /**
     * Calculates opportunities based on the configured setting for the CTO role.
     * Sets the maximum discount for each opportunity to the value specified in the role setting.
     *
     * @param opps A list of opportunities to be calculated.
     */
    public void calculateOpps(List<Opportunity> opps) {
        for (Opportunity opp: opps) {
            // Set the maximum discount for each opportunity based on the configured setting for the CTO role
            opp.Max_Discount__c = roleSetting.Max_Discount__c;
        }
    }
}
