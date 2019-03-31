import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "name", "output", "checked", "edit"  ]
    checked_tags = []
    edit_url = ''
    connect(){
        var category_id = this.element.getElementsByTagName('select')[0].value
        if(this.hasCheckedTarget){
            this.checked_tags = this.checkedTargets.map(c => c.value)
        }
        this.fetch_tags(category_id)
        this.edit_url = this.editTarget.href
    }

    category(event) {
        var category_id = event.currentTarget.value;
        this.fetch_tags(category_id)
        this.editTarget.href = this.edit_url + '/' + category_id
    }

    fetch_tags(category_id){
        fetch(this.data.get('url') + category_id)
            .then(function(response){
                return response.json();
            }).then( tags => { this.render(tags) } )
    }

    render(tags){
        var checkboxes = '';
        for(let tag of tags){
            var checked = ''
            if(this.checked_tags.includes(tag.id.to_s())){
                checked = 'checked'
            }
            checkboxes += `<label> <input type='checkbox' name='product_tags[]' value='${tag.id}' ${checked} /> ${tag.name} </lable> `;
        }
        this.outputTarget.innerHTML = checkboxes;
    }
}
