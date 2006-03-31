From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Fri, 31 Mar 2006 13:11:18 +0000
Subject: [KJ][Patch] fix kbuild warning in sisfb.o
Message-Id: <1143810678.7834.13.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40304819789117219=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============40304819789117219==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list

This one was a lot harder to find, but much easier to fix.

WARNING: drivers/video/sis/sisfb.o - Section mismatch: reference
to .init.data: from .data between 'sisfb_driver' (at offset 0xf8) and
'sisfb_ops'


This is caused by the 'pci_driver struct' in sis_main.c having a pointer
to a 'pci_device_id struct' in 'sis_main.h' that is marked as
__devinitdata.

The patch below just removes the __devinitdata annotation from the
'pci_device_id struct', which seems like the best solution here.



Note: This driver also contains a lot of 

#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)

which is in the TODO list
- Code that depends on LINUX_VERSION_CODE & KERNEL_VERSION < 2.6 can be
  deleted in most cases. (Mostly/all? done)

So I might follow with a patch that removes it.


Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-git13/drivers/video/sis/sis_main.h.orig	2006-03-31 23:33:50.000000000 +1100
+++ linux-2.6.16-git13/drivers/video/sis/sis_main.h	2006-03-31 23:34:05.000000000 +1100
@@ -125,7 +125,7 @@ static struct sisfb_chip_info {
 	{ XGI_40,     SIS_315_VGA, 1, HW_CURSOR_AREA_SIZE_315 * 4, SIS_CRT2_WENABLE_315, "XGI V3XT/V5/V8" },
 };
 
-static struct pci_device_id __devinitdata sisfb_pci_table[] = {
+static struct pci_device_id sisfb_pci_table[] = {
 #ifdef CONFIG_FB_SIS_300
 	{ PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_300,     PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
 	{ PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_540_VGA, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 1},



--===============40304819789117219==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40304819789117219==--
