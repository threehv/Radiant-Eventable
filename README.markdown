Event Feed
==========

This is a simple extension for [Radiant CMS](http://radiantcms.org/) that adds an "event feed" page to your administration section.  

Once installed (and the migrations run), it adds a new tab to your administration area (that becomes the default tab); this lists things that have happened to your site (in date order).  

By default, it hooks into Pages, Users, Snippets and Layouts, recording any changes to them. If you want to hook it into your models, it is as simple as: 

    class MyModel
      records_events
      ...
    end
  
Now, every create, update or delete of MyModel will create an EventFeedItem record (along with the current user if available).  

Dependencies
------------

The extension expects the [will_paginate](http://wiki.github.com/mislav/will_paginate) gem or plugin to be installed.  I'm pretty sure that this is the case with all Radiant installations.  

Stringify me
------------

The Radiant Page, Layout, Snippet and User classes do not define the `to_s` method.  Therefore, the extension defines one for them - the ToSExtension module returns the name or title field (depending upon which is present).   

Cleaning up
-----------

To prevent your database filling up with events, there is a rake task to clear out any events that have been there for 28 days or more.  Stick it on a nightly cron job and run `RAILS_ENV=production rake radiant:extensions:event_feed:clean_up`.  

Task list
---------

* Add tests (naughty naughty)
* Make the clean up rake task parameterised, so you can choose how long to keep your events for
* Write out the details of the change actually made after an update (the details field is there, it just needs populating with something sensible)

Disclaimers
-----------

I've been bad and not added any tests or features - this is because I'm lazy.  

This software is based on some sterling work by David Smalley and Caius Durling for [Brightbox](http://www.brightbox.co.uk/).  

Licence
-------

Copyright (c) 2009, [3hv Limited](http://www.3hv.co.uk)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

Written by Rahoul Baruah and released under the [MIT Licence](http://www.opensource.org/licenses/mit-license.php).  

