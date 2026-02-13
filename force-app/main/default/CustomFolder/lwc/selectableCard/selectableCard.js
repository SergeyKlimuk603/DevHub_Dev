import { LightningElement, api } from 'lwc';

export default class SelectableCard extends LightningElement {

    @api id;
    @api title;
    @api subtitle;
    @api badge;
    @api features = [];
    @api iconName;
    @api selected = false;
    @api disabled = false;

    get cardClass() {
        let base = 'card';

        if (this.selected) {
            base += ' selected';
        }

        if (this.disabled) {
            base += ' disabled';
        }

        return base;
    }

    handleClick() {
        if (this.disabled) return;

        this.dispatchEvent(new CustomEvent('select', {
            detail: { id: this.id }
        }));
    }
}
