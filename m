From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 17 Jul 2007 21:22:56 +0000
Subject: should in-tree kernel source accommodate older kernel versions?
Message-Id: <Pine.LNX.4.64.0707171718450.18509@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  should kernel source that's in the current source tree still try to
accommodate older kernel versions?  as an example, this is from
drivers/scsi/gdth.c:

/* parameters for modprobe/insmod */
#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,11)
module_param_array(irq, int, NULL, 0);
module_param(disable, int, 0);
module_param(reserve_mode, int, 0);
module_param_array(reserve_list, int, NULL, 0);
module_param(reverse_scan, int, 0);
module_param(hdr_channel, int, 0);
module_param(max_ids, int, 0);
module_param(rescan, int, 0);
module_param(virt_ctr, int, 0);
module_param(shared_access, int, 0);
module_param(probe_eisa_isa, int, 0);
module_param(force_dma32, int, 0);
#else
MODULE_PARM(irq, "i");
MODULE_PARM(disable, "i");
MODULE_PARM(reserve_mode, "i");
... etc etc ...

  now, i can see the value in trying to maintain a single source file
(gdth.c) that's compatible with various versions of the kernel.  on
the other hand, this is source that has been accepted into the main
tree.  under those circumstances, it's *irrelevant* whether it's
compatible with older versions.

  it would seem that, if someone wants to maintain a multi-version
source file, they can handle that *outside* the source tree on their
own, and not load the tree with extraneous junk to make *their* job
easier.

  thoughts?

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
