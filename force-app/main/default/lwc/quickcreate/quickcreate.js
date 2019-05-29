import { LightningElement, api } from 'lwc';
import create from '@salesforce/apex/QuickCreateController.create';
import Opportunity from '@salesforce/schema/Opportunity';

export default class Quickcreate extends LightningElement {
    opp;
    error;

    constructor(){
        super();
        this.opp = {
            'sobjectType' : 'Opportunity',
            'StageName': 'Prospecting'
        };
    }

    handleFieldChange(event){
        let field = event.target.name;
        this.opp[field] = event.target.value;
    }

    saveRecord(event) {
        debugger;
        create({opp: this.opp})
            .then(result => {
                this.opp = result;
                console.log('Saved opportunity record', this.opp);
                event.target.disabled = true;
            })
            .catch(error => {
                this.error = error;
                console.error('Unexpeted error saving opp:',error);
            });
    }

}