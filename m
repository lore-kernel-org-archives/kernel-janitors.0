From: Michael Veeck <veeck@informatik.uni-freiburg.de>
Date: Wed, 28 Jan 2004 14:34:36 +0000
Subject: [Kernel-janitors] new to kj and [PATCH] remove unneeded min/max-defs
Message-Id: <4017C87C.9020800@informatik.uni-freiburg.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------070406000902050302080805"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------070406000902050302080805
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi there!

As kj is suggested as a starting point for kernel hacking I looked 
through the TODO-list and found some easy stuff (at least I hope so).

Greping through the latest kernel tree (2.6.2-rc2) showed two min / max 
defines who don't need to be there and can be removed without compile 
errors.

So, attached is the patch against 2.6.2-rc2.

Is it wise to post this also on the 'normal' kernel list or is it too 
trivial for that?

Best regards
Michael Veeck

--------------070406000902050302080805
Content-Type: text/plain;
 name="patch_min_max"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch_min_max"

diff -Naur linux-2.6.2-rc2-old/drivers/scsi/ips.h linux-2.6.2-rc2-new/drivers/scsi/ips.h
--- linux-2.6.2-rc2-old/drivers/scsi/ips.h	2004-01-28 15:18:42.000000000 +0100
+++ linux-2.6.2-rc2-new/drivers/scsi/ips.h	2004-01-28 15:17:10.000000000 +0100
@@ -124,10 +124,6 @@
       #define MDELAY mdelay
    #endif
 
-   #ifndef min
-      #define min(x,y) ((x) < (y) ? x : y)
-   #endif
-
    #define pci_dma_hi32(a)         ((a >> 16) >> 16)
    #define pci_dma_lo32(a)         (a & 0xffffffff)
 
diff -Naur linux-2.6.2-rc2-old/drivers/telephony/ixj.h linux-2.6.2-rc2-new/drivers/telephony/ixj.h
--- linux-2.6.2-rc2-old/drivers/telephony/ixj.h	2004-01-09 08:00:12.000000000 +0100
+++ linux-2.6.2-rc2-new/drivers/telephony/ixj.h	2004-01-28 15:17:07.000000000 +0100
@@ -60,13 +60,6 @@
 #define TRUE 1
 #define FALSE 0
 
-#ifndef min
-#define min(a,b) (((a)<(b))?(a):(b))
-#endif
-#ifndef max
-#define max(a,b) (((a)>(b))?(a):(b))
-#endif
-
 /******************************************************************************
 *
 *  This structure when unioned with the structures below makes simple byte

--------------070406000902050302080805
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------070406000902050302080805--
