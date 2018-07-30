var vm = new Vue({
    el: '#app',
    data: {
        ponies_saving_bronycon: "Many",
        did_save_bronycon: false
    }
    methods: {
        saveBronyCon: function() {
            $.post("/api/save_bronycon");
            this.did_save_bronycon: = true;
            var x = parseInt(this.ponies_saving_bronycon);
            if (x && x != NaN) {
                x++;
                this.ponies_saving_bronycon = x.toString();
            }
        }
    }
});

$.getJSON("/api/how_many_saving_bronycon", function(response) {
    vm.ponies_saving_bronycon = response.ponies_saving_bronycon.toString();
});
