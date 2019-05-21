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
            throw new AuraHandledException('You can\'t create opportunities!');
        }
        insert opp; //insecure
//        insert Security.stripInaccessible(AccessType.CREATABLE, new List<Opportunity>{opp}).getRecords(); //secure
        return opp;
    }
}