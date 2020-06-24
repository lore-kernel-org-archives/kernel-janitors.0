From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 24 Jun 2020 19:23:25 +0000
Subject: [PATCH] firewire: nosy: Fix the amount of memory deallocated by some 'pci_free_consistent' calls
Message-Id: <20200624192325.940280-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stefanr@s5r6.in-berlin.de, krh@bitplanet.net, hch@infradead.org
Cc: linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'lynx->pci_device' is allocated with a size of RCV_BUFFER_SIZE. This is to
say (16 * 1024).

Pass the same size when it is freed.

Fixes: 286468210d83 ("firewire: new driver: nosy - IEEE 1394 traffic sniffer")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/firewire/nosy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firewire/nosy.c b/drivers/firewire/nosy.c
index 5fd6a60b6741..445c37f5251d 100644
--- a/drivers/firewire/nosy.c
+++ b/drivers/firewire/nosy.c
@@ -510,7 +510,7 @@ remove_card(struct pci_dev *dev)
 			    lynx->rcv_start_pcl, lynx->rcv_start_pcl_bus);
 	pci_free_consistent(lynx->pci_device, sizeof(struct pcl),
 			    lynx->rcv_pcl, lynx->rcv_pcl_bus);
-	pci_free_consistent(lynx->pci_device, PAGE_SIZE,
+	pci_free_consistent(lynx->pci_device, RCV_BUFFER_SIZE,
 			    lynx->rcv_buffer, lynx->rcv_buffer_bus);
 
 	iounmap(lynx->registers);
@@ -668,7 +668,7 @@ add_card(struct pci_dev *dev, const struct pci_device_id *unused)
 		pci_free_consistent(lynx->pci_device, sizeof(struct pcl),
 				lynx->rcv_pcl, lynx->rcv_pcl_bus);
 	if (lynx->rcv_buffer)
-		pci_free_consistent(lynx->pci_device, PAGE_SIZE,
+		pci_free_consistent(lynx->pci_device, RCV_BUFFER_SIZE,
 				lynx->rcv_buffer, lynx->rcv_buffer_bus);
 	iounmap(lynx->registers);
 
-- 
2.25.1
