/**
 * Copyright (c) 2019 Salesforce
 * @author chris.peterson@salesforce.com
 */

public with sharing class QuickCreateController {

    @AuraEnabled
    public static Opportunity create(Opportunity opp){
        System.debug(opp);
        if(!SObjectType.Opportunity.createable
            || !SObjectType.Opportunity.fields.Name.isCreateable()
            || !SObjectType.Opportunity.fields.Amount.isCreateable()
            || !SObjectType.Opportunity.fields.CloseDate.isCreateable()){
            throw new AuraHandledException('Error: insufficient access to create opportunity record');
        }
        // opp = (Opportunity) Security.stripInaccessible(AccessType.CREATABLE, new List<Opportunity>{opp}).getRecords()[0];
        insert opp;
        return opp;
    }
}