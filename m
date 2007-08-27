From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 27 Aug 2007 13:47:09 +0000
Subject: standard for documenting conditional preprocessor directives?
Message-Id: <Pine.LNX.4.64.0708270942001.2707@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  is there an understood standard for documenting conditional
preprocessor directives so you can more easily follow the logic in
lengthy code segments?

  consider:

    #ifdef SNAFU
    ... very long blah blah ...
    #else
    ... equally long woof woof ...
    #endif

  if you're perusing the code, and you hit the "#else" or "#endif",
it's almost impossible to tell what they correspond to, particularly
if they're mixed in with even more nested directives.  so what's the
best way to make this more readable?

  what about something like?

    #ifdef SNAFU
    ...
    #else /* !SNAFU */
    ...
    #endif /* !SNAFU */

  i contend that both of those new comments have value since, without
them, you wouldn't know what either the "#else" or "#endif"
represented.  but i'm willing to be disabused of that notion.

  thoughts?

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
