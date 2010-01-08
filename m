From: Darren Jenkins <darrenrjenkins@gmail.com>
Date: Fri, 08 Jan 2010 14:40:34 +0000
Subject: [PATCH] : hardware/mISDN/mISDNinfineon.c: Bail out of loop on error
Message-Id: <1262961634.32453.12.camel@ICE-BOX>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>, keil@isdn4linux.de
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


If setup_instance() fails we kfree() the card, and then use it in the next loop iteration.
So lets bail out of the loop instead.

Coverity CID: 13357

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com> 

diff --git drivers/isdn/hardware/mISDN/mISDNinfineon.c drivers/isdn/hardware/mISDN/mISDNinfineon.c
index 62441ba..36c6c61 100644
--- drivers/isdn/hardware/mISDN/mISDNinfineon.c
+++ drivers/isdn/hardware/mISDN/mISDNinfineon.c
@@ -1133,6 +1133,7 @@ inf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 			if (err) {
 				kfree(sc);
 				release_card(card);
+				break;
 			} else
 				card->sc[i - 1] = sc;
 		}


