/**
 * Copyright (c) 2019 Salesforce
 * @author chris.peterson@salesforce.com
 */

public with sharing class QuickCreateController {

    @AuraEnabled
    public static Opportunity create(Opportunity opp){
        System.debug(opp);
        if(!SObjectType.Opportunity.createable){
            throw new AuraHandledException('You can\'t create opportunities!');
        }
        insert opp;
        return opp;
    }
}