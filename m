From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 23 Mar 2005 14:48:09 +0000
Subject: [KJ] [PATCH] dma-mask : drivers/usb/host/ehci-hcd.c
Message-Id: <20050323144809.GJ9206@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="TN8pJM9vJMHHFgJc"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--TN8pJM9vJMHHFgJc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I know the range of code where this patch is applied is #if 0'd, but to
do all the job about DMA_MASK... I have send it.

Description: 
Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--TN8pJM9vJMHHFgJc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1-dma-mask-usb_host_ehci-hcd.c.diff"

diff -urpN -X /work/users/dontdiff a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
--- a/drivers/usb/host/ehci-hcd.c	2005-03-18 02:34:55.000000000 +0100
+++ b/drivers/usb/host/ehci-hcd.c	2005-03-22 11:51:23.000000000 +0100
@@ -550,7 +550,7 @@ static int ehci_start (struct usb_hcd *h
 		writel (0, &ehci->regs->segment);
 #if 0
 // this is deeply broken on almost all architectures
-		if (!pci_set_dma_mask (to_pci_dev(hcd->self.controller), 0xffffffffffffffffULL))
+		if (!pci_set_dma_mask (to_pci_dev(hcd->self.controller), DMA_64BIT_MASK))
 			ehci_info (ehci, "enabled 64bit PCI DMA\n");
 #endif
 	}

--TN8pJM9vJMHHFgJc
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--TN8pJM9vJMHHFgJc--
