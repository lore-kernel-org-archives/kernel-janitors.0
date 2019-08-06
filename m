From: Adam Zerella <adam.zerella@gmail.com>
Date: Tue, 06 Aug 2019 13:04:47 +0000
Subject: [PATCH] pcmcia/i82092: Refactored dprintk macro for pr_debug.
Message-Id: <20190806130445.3785-1-adam.zerella@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

As pointed out in https://kernelnewbies.org/KernelJanitors/Todo
this patch replaces the outdated macro of DPRINTK for pr_debug

E: example patch (Testing to see if this format and type of fix is welcome)
To: Dominik Brodowski <linux@dominikbrodowski.net>
To: Thomas Gleixner <tglx@linutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Adam Zerella <adam.zerella@gmail.com>
To: linux-kernel@vger.kernel.org
Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
---
 drivers/pcmcia/i82092.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pcmcia/i82092.c b/drivers/pcmcia/i82092.c
index ec54a2aa5cb8..e1929520c20e 100644
--- a/drivers/pcmcia/i82092.c
+++ b/drivers/pcmcia/i82092.c
@@ -117,9 +117,9 @@ static int i82092aa_pci_probe(struct pci_dev *dev, const struct pci_device_id *i
 		
 		if (card_present(i)) {
 			sockets[i].card_state = 3;
-			dprintk(KERN_DEBUG "i82092aa: slot %i is occupied\n",i);
+			pr_debug("i82092aa: slot %i is occupied\n", i);
 		} else {
-			dprintk(KERN_DEBUG "i82092aa: slot %i is vacant\n",i);
+			pr_debug("i82092aa: slot %i is vacant\n", i);
 		}
 	}
 		
@@ -128,7 +128,7 @@ static int i82092aa_pci_probe(struct pci_dev *dev, const struct pci_device_id *i
 	pci_write_config_byte(dev, 0x50, configbyte); /* PCI Interrupt Routing Register */
 
 	/* Register the interrupt handler */
-	dprintk(KERN_DEBUG "Requesting interrupt %i \n",dev->irq);
+	pr_debug("Requesting interrupt %i\n", dev->irq);
 	if ((ret = request_irq(dev->irq, i82092aa_interrupt, IRQF_SHARED, "i82092aa", i82092aa_interrupt))) {
 		printk(KERN_ERR "i82092aa: Failed to register IRQ %d, aborting\n", dev->irq);
 		goto err_out_free_res;
-- 
2.20.1
