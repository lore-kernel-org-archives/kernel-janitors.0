From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 08 Feb 2007 17:08:45 +0000
Subject: [KJ] arch-dependent Kconfig file options?
Message-Id: <Pine.LNX.4.64.0702081201320.14147@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  is there a way to make the visibility of Kconfig file options
dependent on the underlying architecture?  as a specific example,
there are two archs (alpha and frv) that support debugging semaphores.
but that's not a general Kconfig-selectable setting -- those two
arches independently define those options:

  $ grep -r SEMAPHORE . | grep DEBUG

which seems wasteful.  why not just have that option in one place?
(lib/Kconfig.debug would be the obvious place, of course.)

  however, since that option applies only to a couple of arches, it
should be displayed only for those arches. is there a way to do this?

rday

p.s.  yes, i realize that it's not that big a deal here since it
involves only two architectures.  but it's the more general case i'm
curious about, when *other* architectures decide they want semaphore
debugging as well.

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
