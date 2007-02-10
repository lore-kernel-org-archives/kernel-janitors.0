From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 10 Feb 2007 16:36:57 +0000
Subject: [KJ] still some possible kmalloc/kzalloc cleanups in the latest tree
Message-Id: <Pine.LNX.4.64.0702101130520.4899@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  if someone is bored and wants something to do, it looks like there's
still some cleanup to be done in the latest git tree regarding
replacing kmalloc/memset calls with a single call to kzalloc:

http://fsdev.net/wiki/index.php?title=Memory_allocation&action=submit

  i just added a couple lines to that wiki page describing this,
including running the command:

  $ grep -Er -B10 "memset ?\(.*,0 ?," * | less

to find calls of the form "memset(...,0,...)" and getting the previous
10 lines to see if there's a kmalloc call shortly before then.  as
just one example of what pops up:

...
drivers/net/pcmcia/ibmtr_cs.c-    /* Create new token-ring device */
drivers/net/pcmcia/ibmtr_cs.c-    info = kmalloc(sizeof(*info), GFP_KERNEL);
drivers/net/pcmcia/ibmtr_cs.c-    if (!info) return -ENOMEM;
drivers/net/pcmcia/ibmtr_cs.c:    memset(info,0,sizeof(*info));
...

  personally, i thought i'd sent in patches to clean most of that, so
maybe they're still working their way thru the system but someone else
is welcome to take care of that.

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
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
