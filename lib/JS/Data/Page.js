Data = {};

Data.Page = function(total_entries, entries_per_page, current_page) {
    this._total_entries = total_entries || 0;
    this._entries_per_page = entries_per_page || 10;
    this._current_page = current_page || 1;
}
Data.Page.VERSION = "0.01";

var prototype = Data.Page.prototype;


prototype.total_entries = function(total_entries) {
        if ( total_entries ){
            this._total_entries = total_entries;
        }
        return this._total_entries;
}

prototype.entries_per_page = function(entries_per_page) {
        if ( entries_per_page ){
            this._entries_per_page = entries_per_page;
        }
        return this._entries_per_page;
}

prototype.current_page = function(current_page) {
        if ( current_page ){
            this._current_page = current_page;
        }
        return this._current_page;
}

prototype.entries_on_this_page = function() {
    if (this.total_entries() == 0) {
        return 0;
    } else {
        return this.last() - this.first() + 1;
    }
};

prototype.first_page = function() {
    return 1;
};

prototype.last_page = function() {
    var pages = this.total_entries() / this.entries_per_page();
//    diag('total_entries ', this.total_entries());
//    diag('entries_per_page ', this.entries_per_page());
//    diag('pages ', pages);
    var last_page;
    if (pages == Math.floor(pages)) {
        last_page = pages;
    } else {
        last_page = 1 + Math.floor(pages);
    }
    if (last_page < 1) {
        last_page = 1;
    }
    return last_page;
};

prototype.first = function() {
    if (this.total_entries() == 0) {
        return 0;
    } else {
        return ( ( this.current_page() - 1 ) * this.entries_per_page() ) + 1
    }
};

prototype.last = function() {
    if ( this.current_page() == this.last_page() ) {
        return this.total_entries();
    } else {
        return ( this.current_page() * this.entries_per_page() );
    }
};

prototype.previous_page = function() {
    if ( this.current_page() > 1 ) {
        return this.current_page() - 1;
    } else {
        return null;
    }
}

prototype.next_page = function() {
    if (this.current_page() < this.last_page()) {
        return this.current_page() + 1;
    } else {
        return null;
    }
}

prototype.splice = function(array) {
    var top;
    if (array.length > this.last()) {
        top = this.last();
    } else {
        top = array.length;
    }
    if (top == 0) {
        return [];
    }
    return array.slice(this.first() -1, top );
}

prototype.skipped = function(array) {
    var skipped = this.first() - 1;
    if (skipped < 0) {
        return 0;
    } else {
        return skipped;
    }
}

