= Event Feed

This is a simple extension that adds an "event feed" page to your administration section.  

Once installed (and the migrations run), it adds a new tab to your administration area (that becomes the default tab); this lists things that have happened to your site (in date order).  

By default, it hooks into Pages, Users, Snippets and Layouts, recording any changes to them. If you want to hook it into your models, it is as simple as: 

    class MyModel
      records_events
      ...
    end
  
Now, every create, update or delete of MyModel will create an EventFeedItem record (along with the current user if available).  

I've been bad and not added any tests or features - this is because I'm lazy.  

Copyright (c) 2009, 3hv Limited

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
