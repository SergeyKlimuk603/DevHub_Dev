import { LightningElement, track } from 'lwc';

export default class AdditionalPackageStep extends LightningElement {

    @track selectedValues = [];

    packageOptions = [
        {
            id: 'fraud_plus',
            idValue: 'fraud_plus',
            title: 'Fraud_Protection_Plus',
            subtitle: 'Advanced security monitoring and identity theft protection',
            badge: 'Most Popular',
            iconName: 'utility:shield',
            features: [
                'Real-time fraud alerts',
                'Identity theft insurance up to $1M',
                'Credit monitoring & alerts',
                'Dark web surveillance',
                'Lost wallet assistance'
            ]
        },
        {
            id: 'purchase_protection',
            idValue: 'purchase_protection',
            title: 'Purchase_Protection',
            subtitle: 'Extended warranty and price protection on purchases',
            iconName: 'utility:lock',
            features: [
                'Extended warranty up to 2 years',
                'Price protection guarantee',
                'Damage & theft coverage',
                'Return protection',
                'Purchase dispute assistance'
            ]
        },
        {
            id: 'fraud_plus1',
            idValue: 'fraud_plus1',
            title: 'Fraud_Protection_Plus1',
            subtitle: 'Advanced security monitoring and identity theft protection',
            badge: 'Most Popular',
            iconName: 'utility:shopping_bag',
            features: [
                'Real-time fraud alerts',
                'Identity theft insurance up to $1M',
                'Credit monitoring & alerts',
                'Dark web surveillance',
                'Lost wallet assistance'
            ]
        }
    ];

    handleChange(event) {
        this.selectedValues = event.detail.selectedValues;
        console.log('-----selectedValues: ', JSON.parse(JSON.stringify(this.selectedValues)));
    }

    get selectedValuesString() {
        return this.selectedValues.join(', ');
    }
}
