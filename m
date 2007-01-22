From: Surya Prabhakar <surya.prabhakar@wipro.com>
Date: Mon, 22 Jan 2007 11:07:25 +0000
Subject: [KJ] newbie test patch
Message-Id: <1169463325.2202.11.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi GURU's,
   I did a git diff and pasted the patch here. I am not sure this is the
right way of doing it. Kindly guide me if wrong.

Also how do I add the sign off text automatically.
----------
changing pci_find_device to pci_get_device in drivers/pci/search.c

diff --git a/drivers/pci/search.c b/drivers/pci/search.c
index fab381e..30deb15 100644
--- a/drivers/pci/search.c
+++ b/drivers/pci/search.c
@@ -97,10 +97,11 @@ pci_find_slot(unsigned int bus, unsigned
 {
        struct pci_dev *dev = NULL;
 
-       while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) !NULL) {
+       while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) !NULL) {
                if (dev->bus->number = bus && dev->devfn = devfn)
                        return dev;
        }
+       pci_dev_put(dev);
        return NULL;
 }
 


surya.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
