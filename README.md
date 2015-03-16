DVNotifications
---

A clean and simple flat designed Notification Singleton used for good UX with respect to onboarding users to your iOS application or for your next version of your app. (Similar to Pinterests onboarding Notifications).

To queue up a message notification, include DVNotification.h, (optionally customise the color/label), and call 'showNotificationWithText:'

e.g.:

[DVNotification setNotificationBackgroundColour: [UIColor redColor]];

[DVNotification showNotificationWithText: @"Message 1"];

[DVNotification showNotificationWithText: @"Message 2"];

[DVNotification showNotificationWithText: @"Message 3"];

The messages will always be displayed on top of any current view, tapping anywhere on the screen will dismiss it.

[![](https://www.dropbox.com/s/ef7qelp84kxco1b/IMG_1550.PNG)](https://www.dropbox.com/s/ef7qelp84kxco1b/IMG_1550.PNG)
[![](https://www.dropbox.com/s/pruvew8wp143qki/IMG_1551.PNG)](https://www.dropbox.com/s/pruvew8wp143qki/IMG_1551.PNG)


TODO:
- Add timed dismissal.
- Turn this into a Cocoa Pod.
- Make it more customisable.
- Accomodate for iPad (Use Autolayout instead of Springs and Struts to handle different resolutions).

License
---

Copyright (c) 2015 David van Dugteren, http://vandeenz.com

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
