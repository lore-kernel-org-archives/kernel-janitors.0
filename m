From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Fri, 16 Jan 2004 22:29:56 +0000
Subject: Re: [Kernel-janitors] [Patch] - lmc_main.c - Linux 2.6.0
Message-Id: <20040116142956.0808d286.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 29 Nov 2003 12:11:43 -0500 Ron Gage <ron@rongage.org> wrote:

| > > This patch replaces the check_region call in lmc_probe with a
| > > request_region and release_region call.

@@ -1060,7 +1066,7 @@
          * Fix the two variables
          *
          */
-        if (!(check_region (pci_ioaddr, LMC_REG_RANGE)) &&
+        if (request_region (pci_ioaddr, LMC_REG_RANGE, "LMC_TEST") &&
             (vendor = CORRECT_VENDOR_ID) &&
             (device = CORRECT_DEV_ID) &&
             ((subvendor = PCI_VENDOR_LMC)  || (subdevice = PCI_VENDOR_LMC))){
@@ -1099,6 +1105,7 @@
             cards_found++;
             intcf++;
         }
+    release_region (pci_ioaddr, LMC_REG_RANGE);
     lmc_probe_next_card:
         pci_index++;
     }

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
We are looking for a little more than a mechanical change of
!check_region() to request_region()  [in most cases and in this
case].

The reason that check_region() is deprecated is that it is racy.
It could report that a region is available and then another driver
could immediately reserve that region, since check_region() doesn't
have any reservation capability.

Just changing check_region() to request_region()...release_region()
keeps that race in place and that's not what we need here.

Drivers need to be fixed to call request_region() one time for any
one region and to keep it until they are finished with it, then
call release_region().  Anything else is still racy and the driver
code might as well continue to use check_region() [for awhile].

In most cases it's going to take some study or knowledge of the driver
to make these changes.

--
~Randy
Everything is relative.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
