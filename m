From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 14 May 2007 16:28:23 +0000
Subject: [KJ] weird Kconfig excerpt in Documentation/CodingStyle
Message-Id: <Pine.LNX.4.64.0705141227040.13741@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  is this snippet from Documentation/CodingStyle supposed to make any
sense?

...
For configuration options (arch/xxx/Kconfig, and all the Kconfig files),
somewhat different indentation is used.

Help text is indented with 2 spaces.

if CONFIG_EXPERIMENTAL
        tristate CONFIG_BOOM
        default n
        help
          Apply nitroglycerine inside the keyboard (DANGEROUS)
        bool CONFIG_CHEER
        depends on CONFIG_BOOM
        default y
        help
          Output nice messages when you explode
endif
...

  that just looks so wrong in so many ways.

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
