import { LightningElement, api } from 'lwc';

export default class SelectableCard extends LightningElement {

    // @api id;
    @api idValue;
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

        console.log('-----base: ', base);

        return base;
        // return 'card disabled';
    }

    handleClick() {
        if (this.disabled) return;

        console.log('-----11this.id: ', this.id);
        console.log('-----11this.idValue: ', this.idValue);
        this.dispatchEvent(new CustomEvent('select', {
            detail: { id: this.id, idValue: this.idValue }
        }));
    }
}
