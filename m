From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Feb 2018 18:34:53 +0000
Subject: [PATCH 2/2] firewire: nosy: Adjust eight checks for null pointers
Message-Id: <d6591d1e-c568-dfcd-d162-03b60ae528cb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c4e817a2-1554-2480-9469-9d06543b1eee@users.sourceforge.net>
In-Reply-To: <c4e817a2-1554-2480-9469-9d06543b1eee@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux1394-devel@lists.sourceforge.net, Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Feb 2018 19:20:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/firewire/nosy.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/firewire/nosy.c b/drivers/firewire/nosy.c
index 6192f0718bf2..0eaf79c625c6 100644
--- a/drivers/firewire/nosy.c
+++ b/drivers/firewire/nosy.c
@@ -128,7 +128,7 @@ static int
 packet_buffer_init(struct packet_buffer *buffer, size_t capacity)
 {
 	buffer->data = kmalloc(capacity, GFP_KERNEL);
-	if (buffer->data = NULL)
+	if (!buffer->data)
 		return -ENOMEM;
 	buffer->head = (struct packet *) buffer->data;
 	buffer->tail = (struct packet *) buffer->data;
@@ -287,11 +287,11 @@ nosy_open(struct inode *inode, struct file *file)
 			break;
 		}
 	mutex_unlock(&card_mutex);
-	if (lynx = NULL)
+	if (!lynx)
 		return -ENODEV;
 
 	client = kmalloc(sizeof *client, GFP_KERNEL);
-	if (client = NULL)
+	if (!client)
 		goto fail;
 
 	client->tcode_mask = ~0;
@@ -552,7 +552,7 @@ add_card(struct pci_dev *dev, const struct pci_device_id *unused)
 	pci_set_master(dev);
 
 	lynx = kzalloc(sizeof *lynx, GFP_KERNEL);
-	if (lynx = NULL) {
+	if (!lynx) {
 		ret = -ENOMEM;
 		goto fail_disable;
 	}
@@ -565,7 +565,7 @@ add_card(struct pci_dev *dev, const struct pci_device_id *unused)
 
 	lynx->registers = ioremap_nocache(pci_resource_start(dev, 0),
 					  PCILYNX_MAX_REGISTER);
-	if (lynx->registers = NULL) {
+	if (!lynx->registers) {
 		dev_err(&dev->dev, "Failed to map registers\n");
 		ret = -ENOMEM;
 		goto fail_deallocate_lynx;
@@ -577,9 +577,7 @@ add_card(struct pci_dev *dev, const struct pci_device_id *unused)
 				sizeof(struct pcl), &lynx->rcv_pcl_bus);
 	lynx->rcv_buffer = pci_alloc_consistent(lynx->pci_device,
 				RCV_BUFFER_SIZE, &lynx->rcv_buffer_bus);
-	if (lynx->rcv_start_pcl = NULL ||
-	    lynx->rcv_pcl = NULL ||
-	    lynx->rcv_buffer = NULL) {
+	if (!lynx->rcv_start_pcl || !lynx->rcv_pcl || !lynx->rcv_buffer) {
 		dev_err(&dev->dev, "Failed to allocate receive buffer\n");
 		ret = -ENOMEM;
 		goto fail_deallocate_buffers;
-- 
2.16.1

