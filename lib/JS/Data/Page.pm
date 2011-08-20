package JS::Data::Page;
use strict;
use warnings;
our VERSION = '0.02';

=head1 NAME

Data.Page - Autogenerate useful information for pagination

=head1 SYNOPSIS

  var p = new Data.Page(
      120, // total entries
      10,  // entries per page
      1    // current page
  );

  // get pagination info
  p.total_entries()        // 120
  p.entries_per_page()     // 10
  p.current_page()         // 1
  p.entries_on_this_page() // 10
  p.first_page()           // 1
  p.last_page()            // 12
  p.first()                // 1
  p.last()                 // 10
  p.previous_page()        // undefined
  p.next_page()            // 2

  // get items that are included in this page
  var items = [ 'item1' .. 'item99' ];
  items = p.splice( items );  // [ 'item1' .. 'item10' ]

=head1 DESCRIPTION

By giving minimum parameters, this module auto-calculates all
the neccessary information needed to display pagination, which
we see (and program) alot in a search result page.

Especially useful for client-side AJAX applications.

=head2 Constructor

  var page = new Data.Page(
      99,  // total entries
      15,  // entries displayed per page
      2    // current page number
  ); 

Or, you can set those parameter later:

  var page = new Data.Page();
  page.total_entries( 99 );
  page.entries_per_page( 15 );
  page.current_page( 2 );

=head2 Methods

=head3 total_entries()

  page.total_entries( 130 );  // setter
  page.total_entries();       // getter

Sets/gets the total number of entries in your result set. Ignored if passed a negative value.

=head3 entries_per_page() 

  page.entries_per_page( 10 );  // setter
  page.entries_per_page();      // getter

Sets/gets the total number of entries displayed per page. Ignored if passed a negative value.

=head3 current_page()

  page.current_page( 10 );  // setter
  page.current_page();      // getter

Sets/gets the total number of entries displayed per page. Ignored if passed a negative value.

=head3 entries_on_this_page()

  page.entries_on_this_page();  // 10

  // might be different on last page
  page.current_page( page.last_page() );
  page.entries_on_this_page();  // 7

Gets the number of items displayed in current page. It's usually same as
page.entries_per_page(), but might differ on the last page.

=head3 last_page()

  page.last_page();  // 5

Gets the last page number. It's also the  "total page count".

=head3 first_page()

  page.first_page(); // 1

Gets the first page number, which will always return 1. Counter-part for
page.last_page() method.

=head3 first()

  page.first();  // 21

Gets the item number of the first item in current page.

=head3 last()

  page.last();  // 30

Gets the item number of the last item in current page.

=head3 previous_page()

  page.previous_page();  // 1

Gets the page number of the previous page. Returns "undefined" if called at first page.

=head3 next_page()

  page.next_page();  // 2

Gets the page number of the next page. Returns "undefined" if called at last page.

=head3 splice()

  var items = [ 'item1' .. 'item99' ];
  items = p.splice( items );  // [ 'item1' .. 'item10' ]

By passing an array with items/records for all pages, it will return an array
containing only the items for the current page.

=head3 skipped()

  var page = new Data.Page( 50, 10, 3 ); // we're at page 3
  page.skipped();  // 20 

Returns how many items are skipped as for the current page.

=head1 SEE ALSO

Perl CPAN - Data::Page module
L<http://search.cpan.org/dist/Data-Page/>

=head1 AUTHOR

Leon Brocard <F<acme@astray.com>>
Toshimasa Ishibashi <F<iandeth99@ybb.ne.jp>>

Translated from Perl to JavaScript by Leon but with help from Toshimasa's
previous translation.

=head1 COPYRIGHT

Copyright (c) 2011 Leon Brocard and Toshimasa Ishibashi. All rights reserved.
This module is free software; you can redistribute it and/or modify it
under the terms of the Artistic license. Or whatever license I choose,
which I will do instead of keeping this documentation like it is.

=cut

1;