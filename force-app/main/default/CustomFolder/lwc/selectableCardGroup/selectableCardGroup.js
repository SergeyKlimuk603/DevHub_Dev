import { LightningElement, api } from 'lwc';

export default class SelectableCardGroup extends LightningElement {

    _items = [];

    internalItems = [];

    @api
    get items() {
        return this._items;
    }
    set items(value) {
        this._items = value || [];

        // создаём новый массив (реактивность)
        this.internalItems = this._items.map(item => ({
            ...item,
            selected: item.selected || false
        }));
    }

    @api multiple = false;
    @api disabled = false;

    handleSelect(event) {
        // const selectedId = event.detail.id;
        const selectedId = event.detail.idValue;
        console.log('-----selectedId: ', selectedId);

        if (this.multiple) {
            console.log('-----multiple');
            this.internalItems = this.internalItems.map(item => {
                console.log('-----item.id: ', item.id);
                console.log('-----item.idValue: ', item.idValue);
                // if ((item.id + '-128') === selectedId) {
                if ((item.idValue) === selectedId) {
                    return { ...item, selected: !item.selected };
                }
                return item;
            });
        } else {
            this.internalItems = this.internalItems.map(item => {
                return { ...item, selected: item.id === selectedId };
            });
        }

        console.log('-----event.detail: ', event.detail);

        console.log('-----this.internalItems: ', JSON.parse(JSON.stringify(this.internalItems)));
        this.dispatchEvent(new CustomEvent('change', {
            detail: {
                selectedValues: this.internalItems
                    .filter(i => i.selected)
                    .map(i => i.id)
            }
        }));
    }
}
