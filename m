From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 01 Feb 2007 09:44:36 +0000
Subject: [KJ] the *right* way to do conditional compilation
Message-Id: <Pine.LNX.4.64.0702010435270.11868@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  a quick note:  most people on this list are already aware of how the
kernel kbuild structure does conditional compilation of source files
based on kernel configuration.  e.g., in net/atm/Makefile:

  ...
  obj-$(CONFIG_ATM) += atm.o
  ...

so the source file net/atm/atm.o won't be compiled unless the
config option ATM is selected.  so far, so good.

  the *wrong* way to do this is shown in that same directory.  in that
same Makefile:

  ...
  mpoa-objs       := mpc.o mpoa_caches.o mpoa_proc.o
  ...

but if you look at the source file mpoa_proc.c, you'll see that its
*entire* contents are surrounded by

  #ifdef CONFIG_PROC_FS
  ...
  #endif /* CONFIG_PROC_FS */

  that's just silly.  it would clearly(?) make more sense for the
Makefile entry to read:

  obj-$(CONFIG_PROC_FS) += mpoa_proc.o

or something to that effect, would it not?

  are there other examples of this?  i'm betting there are.

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://www.fsdev.dreamhosters.com/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
