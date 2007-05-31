From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 31 May 2007 11:10:10 +0000
Subject: [KJ] is "register_chrdev" actually going away some day?
Message-Id: <Pine.LNX.4.64.0705310706020.20380@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  according to LDD3, p. 57, the old-style mechanism for registering a
char device, register_chrdev, "will likely go away in a future
kernel."

  it will?  there's some 60 invocations of it in the drivers/
directory and i would have thought that, since it works just fine, no
one's going to worry about it.

  but if the plan is to actually some day remove it entirely, it
should have a schedule and someone might consider starting to replace
those calls.

  but if no one really cares about it, then those calls can be left as
is.  does anyone know if that interface is really planned for removal
some day?

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
