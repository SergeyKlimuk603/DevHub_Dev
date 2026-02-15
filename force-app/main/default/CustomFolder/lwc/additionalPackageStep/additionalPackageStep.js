import { LightningElement, track } from 'lwc';

export default class AdditionalPackageStep extends LightningElement {

    @track selectedValues = [];

    packageOptions = [
        {
            cardId: 'fraud_plus',
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
            cardId: 'purchase_protection',
            title: 'Purchase_Protection',
            subtitle: 'Extended warranty and price protection on purchases',
            iconName: 'utility:shopping_bag',
            features: [
                'Extended warranty up to 2 years',
                'Price protection guarantee',
                'Damage & theft coverage',
                'Return protection',
                'Purchase dispute assistance'
            ]
        },
        {
            cardId: 'fraud_plus1',
            title: 'Fraud_Protection_Plus1',
            subtitle: 'Advanced security monitoring and identity theft protection',
            badge: 'Most Popular',
            iconName: 'utility:lock',
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
    }

    get selectedValuesString() {
        return this.selectedValues.join(', ');
    }
}
