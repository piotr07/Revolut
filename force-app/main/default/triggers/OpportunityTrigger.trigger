/**
 * Created by piotr on 16/03/2024.
 */

trigger OpportunityTrigger on Opportunity (before insert, before update) {
    private static Boolean isFirstRun = true;

    if (System__c.getInstance(UserInfo.getUserId()).Mute_All_Triggers__c
        || !isFirstRun
    ) {
        return;
    }

    isFirstRun = false;

    if (Trigger.isInsert) {
        if (Trigger.isBefore) {
            OpportunityTriggerHandler.handleBeforeInsert(Trigger.new);
        }
        if (Trigger.isAfter) {

        }
    }

    if (Trigger.isUpdate) {
        if (Trigger.isBefore) {
            OpportunityTriggerHandler.handleBeforeUpdate(Trigger.newMap);
        }
        if (Trigger.isAfter) {

        }
    }
}