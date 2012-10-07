From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 07 Oct 2012 06:32:08 +0000
Subject: [acpi:next] include/acpi/acpixf.h:55:23: fatal error: acbuffer.h": No such file or directory
Message-Id: <20121007063208.GA24005@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Len,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git next
head:   558dc6f9ee2a6c686c80b9cdf3426858d2b8dbd1
commit: 558dc6f9ee2a6c686c80b9cdf3426858d2b8dbd1 [0/0] Merge branch 'upstream' into next
config: i386-alldefconfig

All error/warnings:

In file included from include/acpi/acpi.h:64:0,
                 from include/linux/acpi.h:39,
                 from arch/x86/pci/irq.c:17:
include/acpi/acpixf.h:55:23: fatal error: acbuffer.h": No such file or directory
compilation terminated.

vim +55 include/acpi/acpixf.h

50df4d8b (Bob Moore           2008-12-31 03:01:23 +0800  51) 
a1ce3928 (David Howells       2012-10-02 18:01:25 +0100  52) #include <acpi/acconfig.h>
a1ce3928 (David Howells       2012-10-02 18:01:25 +0100  53) #include <acpi/actypes.h>
a1ce3928 (David Howells       2012-10-02 18:01:25 +0100  54) #include <acpi/actbl.h>
558dc6f9 (Len Brown           2012-10-06 23:06:11 -0400 @55) #include <acbuffer.h">
^1da177e (Linus Torvalds      2005-04-16 15:20:36 -0700  56) 

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
