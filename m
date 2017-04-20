From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Apr 2017 20:28:12 +0000
Subject: [PATCH 2/2] firewire: ohci: Adjust 15 checks for null pointers
Message-Id: <595c593e-8a24-24da-0731-e317bbf91d56@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139a329-f084-c4f3-d9af-19ad15445017@users.sourceforge.net>
In-Reply-To: <1139a329-f084-c4f3-d9af-19ad15445017@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux1394-devel@lists.sourceforge.net, Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Apr 2017 22:10:29 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/firewire/ohci.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index 30be5dbd5b09..165600c74b7c 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -1305,7 +1305,7 @@ static int at_context_queue_packet(struct context *ctx,
 	int z, tcode;
 
 	d = context_get_descriptors(ctx, 4, &d_bus);
-	if (d = NULL) {
+	if (!d) {
 		packet->ack = RCODE_SEND_ERROR;
 		return -1;
 	}
@@ -1450,7 +1450,7 @@ static int handle_at_packet(struct context *context,
 
 	driver_data = (struct driver_data *) &d[3];
 	packet = driver_data->packet;
-	if (packet = NULL)
+	if (!packet)
 		/* This packet was cancelled, just continue. */
 		return 1;
 
@@ -2027,7 +2027,7 @@ static void bus_reset_work(struct work_struct *work)
 	 * next_config_rom pointer so a new update can take place.
 	 */
 
-	if (ohci->next_config_rom != NULL) {
+	if (ohci->next_config_rom) {
 		if (ohci->next_config_rom != ohci->config_rom) {
 			free_rom      = ohci->config_rom;
 			free_rom_bus  = ohci->config_rom_bus;
@@ -2394,7 +2394,7 @@ static int ohci_enable(struct fw_card *card,
 			dma_alloc_coherent(ohci->card.device, CONFIG_ROM_SIZE,
 					   &ohci->next_config_rom_bus,
 					   GFP_KERNEL);
-		if (ohci->next_config_rom = NULL)
+		if (!ohci->next_config_rom)
 			return -ENOMEM;
 
 		copy_config_rom(ohci->next_config_rom, config_rom, length);
@@ -2488,7 +2488,7 @@ static int ohci_set_config_rom(struct fw_card *card,
 	next_config_rom  		dma_alloc_coherent(ohci->card.device, CONFIG_ROM_SIZE,
 				   &next_config_rom_bus, GFP_KERNEL);
-	if (next_config_rom = NULL)
+	if (!next_config_rom)
 		return -ENOMEM;
 
 	spin_lock_irq(&ohci->lock);
@@ -2504,7 +2504,7 @@ static int ohci_set_config_rom(struct fw_card *card,
 	 * let this routine free the unused DMA allocation.
 	 */
 
-	if (ohci->next_config_rom = NULL) {
+	if (!ohci->next_config_rom) {
 		ohci->next_config_rom = next_config_rom;
 		ohci->next_config_rom_bus = next_config_rom_bus;
 		next_config_rom = NULL;
@@ -2520,7 +2520,7 @@ static int ohci_set_config_rom(struct fw_card *card,
 	spin_unlock_irq(&ohci->lock);
 
 	/* If we didn't use the DMA allocation, delete it. */
-	if (next_config_rom != NULL)
+	if (next_config_rom)
 		dma_free_coherent(ohci->card.device, CONFIG_ROM_SIZE,
 				  next_config_rom, next_config_rom_bus);
 
@@ -3001,7 +3001,7 @@ static struct fw_iso_context *ohci_allocate_iso_context(struct fw_card *card,
 	memset(ctx, 0, sizeof(*ctx));
 	ctx->header_length = 0;
 	ctx->header = (void *) __get_free_page(GFP_KERNEL);
-	if (ctx->header = NULL) {
+	if (!ctx->header) {
 		ret = -ENOMEM;
 		goto out;
 	}
@@ -3235,7 +3235,7 @@ static int queue_iso_transmit(struct iso_context *ctx,
 	header_z = DIV_ROUND_UP(p->header_length, sizeof(*d));
 
 	d = context_get_descriptors(&ctx->context, z + header_z, &d_bus);
-	if (d = NULL)
+	if (!d)
 		return -ENOMEM;
 
 	if (!p->skip) {
@@ -3333,7 +3333,7 @@ static int queue_iso_packet_per_buffer(struct iso_context *ctx,
 		z = DIV_ROUND_UP(payload_per_buffer + offset, PAGE_SIZE) + 1;
 		d = context_get_descriptors(&ctx->context,
 				z + header_z, &d_bus);
-		if (d = NULL)
+		if (!d)
 			return -ENOMEM;
 
 		d->control      = cpu_to_le16(DESCRIPTOR_STATUS |
@@ -3405,7 +3405,7 @@ static int queue_iso_buffer_fill(struct iso_context *ctx,
 
 	for (i = 0; i < z; i++) {
 		d = context_get_descriptors(&ctx->context, 1, &d_bus);
-		if (d = NULL)
+		if (!d)
 			return -ENOMEM;
 
 		d->control = cpu_to_le16(DESCRIPTOR_INPUT_MORE |
@@ -3572,7 +3572,7 @@ static int pci_probe(struct pci_dev *dev,
 	}
 
 	ohci = kzalloc(sizeof(*ohci), GFP_KERNEL);
-	if (ohci = NULL) {
+	if (!ohci) {
 		err = -ENOMEM;
 		goto fail;
 	}
@@ -3610,7 +3610,7 @@ static int pci_probe(struct pci_dev *dev,
 	}
 
 	ohci->registers = pci_iomap(dev, 0, OHCI1394_REGISTER_SIZE);
-	if (ohci->registers = NULL) {
+	if (!ohci->registers) {
 		ohci_err(ohci, "failed to remap registers\n");
 		err = -ENXIO;
 		goto fail_iomem;
@@ -3686,7 +3686,7 @@ static int pci_probe(struct pci_dev *dev,
 	ohci->it_context_list = kcalloc(ohci->n_it,
 					sizeof(*ohci->it_context_list),
 					GFP_KERNEL);
-	if (ohci->it_context_list = NULL || ohci->ir_context_list = NULL) {
+	if (!ohci->it_context_list || !ohci->ir_context_list) {
 		err = -ENOMEM;
 		goto fail_contexts;
 	}
-- 
2.12.2

