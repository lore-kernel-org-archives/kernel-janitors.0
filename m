From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 25 Jun 2020 19:15:54 +0000
Subject: [PATCH V2] firewire: nosy: Fix the amount of memory deallocated by some 'pci_free_consistent' calls
Message-Id: <20200625191554.941614-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200624192325.940280-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200624192325.940280-1-christophe.jaillet@wanadoo.fr>
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
v2: move the #define RCV_BUFFER_SIZE at the top of the file so that it is
    defined when used in 'remove_card()'
    Spotted by kernel test robot <lkp@intel.com>
---
 drivers/firewire/nosy.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firewire/nosy.c b/drivers/firewire/nosy.c
index 5fd6a60b6741..2fe34a2ce7cc 100644
--- a/drivers/firewire/nosy.c
+++ b/drivers/firewire/nosy.c
@@ -36,6 +36,8 @@
 
 static char driver_name[] = KBUILD_MODNAME;
 
+#define RCV_BUFFER_SIZE (16 * 1024)
+
 /* this is the physical layout of a PCL, its size is 128 bytes */
 struct pcl {
 	__le32 next;
@@ -510,7 +512,7 @@ remove_card(struct pci_dev *dev)
 			    lynx->rcv_start_pcl, lynx->rcv_start_pcl_bus);
 	pci_free_consistent(lynx->pci_device, sizeof(struct pcl),
 			    lynx->rcv_pcl, lynx->rcv_pcl_bus);
-	pci_free_consistent(lynx->pci_device, PAGE_SIZE,
+	pci_free_consistent(lynx->pci_device, RCV_BUFFER_SIZE,
 			    lynx->rcv_buffer, lynx->rcv_buffer_bus);
 
 	iounmap(lynx->registers);
@@ -518,8 +520,6 @@ remove_card(struct pci_dev *dev)
 	lynx_put(lynx);
 }
 
-#define RCV_BUFFER_SIZE (16 * 1024)
-
 static int
 add_card(struct pci_dev *dev, const struct pci_device_id *unused)
 {
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
