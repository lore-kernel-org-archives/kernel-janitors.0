From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 03 Aug 2010 15:44:13 +0000
Subject: [PATCH 07/11] parisc: superio: do not use PCI resources before pci_enable_device()
Message-Id: <1280850253-6128-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Frans Pop <elendil@planet.nl>, Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org

IRQ and resource[] may not have correct values until
after PCI hotplug setup occurs at pci_enable_device() time.

The semantic match that finds this problem is as follows:

// <smpl>
@@
identifier x;
identifier request ~= "pci_request.*|pci_resource.*";
@@

(
* x->irq
|
* x->resource
|
* request(x, ...)
)
 ...
*pci_enable_device(x)
// </smpl>

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/parisc/superio.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/parisc/superio.c b/drivers/parisc/superio.c
index f7806d8..c8a36a2 100644
--- a/drivers/parisc/superio.c
+++ b/drivers/parisc/superio.c
@@ -169,8 +169,6 @@ superio_init(struct pci_dev *pcidev)
 	/* ...then properly fixup the USB to point at suckyio PIC */
 	sio->usb_pdev->irq = superio_fixup_irq(sio->usb_pdev);
 
-	printk(KERN_INFO PFX "Found NS87560 Legacy I/O device at %s (IRQ %i)\n",
-	       pci_name(pdev), pdev->irq);
 
 	pci_read_config_dword (pdev, SIO_SP1BAR, &sio->sp1_base);
 	sio->sp1_base &= ~1;
@@ -204,6 +202,9 @@ superio_init(struct pci_dev *pcidev)
 	ret = pci_enable_device(pdev);
 	BUG_ON(ret < 0);	/* not too much we can do about this... */
 
+	printk(KERN_INFO PFX "Found NS87560 Legacy I/O device at %s (IRQ %i)\n",
+	       pci_name(pdev), pdev->irq);
+
 	/*
 	 * Next project is programming the onboard interrupt controllers.
 	 * PDC hasn't done this for us, since it's using polled I/O.
-- 
1.7.0.4

