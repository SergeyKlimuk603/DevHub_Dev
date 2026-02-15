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
        const selectedId = event.detail.cardId;

        if (this.multiple) {
            this.internalItems = this.internalItems.map(item => {
                if ((item.cardId) === selectedId) {
                    return { ...item, selected: !item.selected };
                }
                return item;
            });
        } else {
            this.internalItems = this.internalItems.map(item => {
                return { ...item, selected: item.cardId === selectedId };
            });
        }

        this.dispatchEvent(new CustomEvent('change', {
            detail: {
                selectedValues: this.internalItems
                    .filter(i => i.selected)
                    .map(i => i.cardId)
            }
        }));
    }
}
