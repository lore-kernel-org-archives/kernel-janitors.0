From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 12:30:08 +0000
Subject: [PATCH 4/4] pcmcia: pd6729: Combine substrings for six messages
Message-Id: <ad220bb8-63ef-fcdf-c39f-8da5ce7a242a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <07cd817c-3045-72d8-34e2-e81b73efc291@users.sourceforge.net>
In-Reply-To: <07cd817c-3045-72d8-34e2-e81b73efc291@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 13:50:52 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: quoted string split across lines

Thus fix the affected source code places.
Prefer usage of the macros "pr_err" and "pr_info" over
the interface "printk".

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pcmcia/pd6729.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/pcmcia/pd6729.c b/drivers/pcmcia/pd6729.c
index b3422119820a..841f413c0d03 100644
--- a/drivers/pcmcia/pd6729.c
+++ b/drivers/pcmcia/pd6729.c
@@ -183,8 +183,7 @@ static irqreturn_t pd6729_interrupt(int irq, void *dev)
 	while (1) {
 		loopcount++;
 		if (loopcount > 20) {
-			printk(KERN_ERR "pd6729: infinite eventloop "
-			       "in interrupt\n");
+			pr_err("infinite event loop in interrupt\n");
 			break;
 		}
 
@@ -348,8 +347,8 @@ static int pd6729_set_socket(struct pcmcia_socket *sock, socket_state_t *state)
 		break;
 	default:
 		dev_dbg(&sock->dev,
-			"pd6729_set_socket called with invalid VCC power "
-			"value: %i\n", state->Vcc);
+			"%s called with invalid VCC power value: %i\n",
+			__func__, state->Vcc);
 		return -EINVAL;
 	}
 
@@ -369,8 +368,9 @@ static int pd6729_set_socket(struct pcmcia_socket *sock, socket_state_t *state)
 		reg |= I365_VPP1_12V;
 		break;
 	default:
-		dev_dbg(&sock->dev, "pd6729: pd6729_set_socket called with "
-			"invalid VPP power value: %i\n", state->Vpp);
+		dev_dbg(&sock->dev,
+			"%s called with invalid VPP power value: %i\n",
+			__func__, state->Vpp);
 		return -EINVAL;
 	}
 
@@ -597,8 +597,7 @@ static u_int pd6729_isa_scan(void)
 	int i;
 
 	if (irq_mode = 1) {
-		printk(KERN_INFO "pd6729: PCI card interrupts, "
-		       "PCI status changes\n");
+		pr_info("PCI card interrupts, PCI status changes\n");
 		return 0;
 	}
 
@@ -641,15 +640,15 @@ static int pd6729_pci_probe(struct pci_dev *dev,
 	}
 
 	if (!pci_resource_start(dev, 0)) {
-		dev_warn(&dev->dev, "refusing to load the driver as the "
-			"io_base is NULL.\n");
+		dev_warn(&dev->dev,
+			 "refusing to load the driver as the io_base is NULL.\n");
 		ret = -ENOMEM;
 		goto err_out_disable;
 	}
 
-	dev_info(&dev->dev, "Cirrus PD6729 PCI to PCMCIA Bridge at 0x%llx "
-		"on irq %d\n",
-		(unsigned long long)pci_resource_start(dev, 0), dev->irq);
+	dev_info(&dev->dev,
+		 "Cirrus PD6729 PCI to PCMCIA Bridge at 0x%llx on irq %d\n",
+		 (unsigned long long)pci_resource_start(dev, 0), dev->irq);
 	/*
 	 * Since we have no memory BARs some firmware may not
 	 * have had PCI_COMMAND_MEMORY enabled, yet the device needs it.
-- 
2.13.0

