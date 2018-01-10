From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 14:06:17 +0000
Subject: [PATCH 3/3] sgi-xpc: Adjust 27 checks for null pointers
Message-Id: <cdd5014f-12c1-a737-67b3-7acd104af5fb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cf88f891-5960-ff01-b8b5-b8194ceff4f1@users.sourceforge.net>
In-Reply-To: <cf88f891-5960-ff01-b8b5-b8194ceff4f1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin Holt <robinmholt@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 14:40:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/sgi-xp/xpc_main.c |  8 +++----
 drivers/misc/sgi-xp/xpc_uv.c   | 48 ++++++++++++++++++++----------------------
 2 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/drivers/misc/sgi-xp/xpc_main.c b/drivers/misc/sgi-xp/xpc_main.c
index c90a9ff30680..ad8b970e1429 100644
--- a/drivers/misc/sgi-xp/xpc_main.c
+++ b/drivers/misc/sgi-xp/xpc_main.c
@@ -383,7 +383,7 @@ xpc_kzalloc_cacheline_aligned(size_t size, gfp_t flags, void **base)
 {
 	/* see if kzalloc will give us cachline aligned memory by default */
 	*base = kzalloc(size, flags);
-	if (*base = NULL)
+	if (!*base)
 		return NULL;
 
 	if ((u64)*base = L1_CACHE_ALIGN((u64)*base))
@@ -393,7 +393,7 @@ xpc_kzalloc_cacheline_aligned(size_t size, gfp_t flags, void **base)
 
 	/* nope, we'll have to do it ourselves */
 	*base = kzalloc(size + L1_CACHE_BYTES, flags);
-	if (*base = NULL)
+	if (!*base)
 		return NULL;
 
 	return (void *)L1_CACHE_ALIGN((u64)*base);
@@ -415,7 +415,7 @@ xpc_setup_ch_structures(struct xpc_partition *part)
 	 * Allocate all of the channel structures as a contiguous chunk of
 	 * memory.
 	 */
-	DBUG_ON(part->channels != NULL);
+	DBUG_ON(part->channels);
 	part->channels = kzalloc(sizeof(struct xpc_channel) * XPC_MAX_NCHANNELS,
 				 GFP_KERNEL);
 	if (!part->channels)
@@ -427,7 +427,7 @@ xpc_setup_ch_structures(struct xpc_partition *part)
 	    xpc_kzalloc_cacheline_aligned(XPC_OPENCLOSE_ARGS_SIZE,
 					  GFP_KERNEL, &part->
 					  remote_openclose_args_base);
-	if (part->remote_openclose_args = NULL) {
+	if (!part->remote_openclose_args) {
 		dev_err(xpc_chan, "can't get memory for remote connect args\n");
 		ret = xpNoMemory;
 		goto out_1;
diff --git a/drivers/misc/sgi-xp/xpc_uv.c b/drivers/misc/sgi-xp/xpc_uv.c
index 8a8dfcbbe729..d085bc0b025e 100644
--- a/drivers/misc/sgi-xp/xpc_uv.c
+++ b/drivers/misc/sgi-xp/xpc_uv.c
@@ -91,8 +91,7 @@ xpc_teardown_partitions_uv(void)
 
 	for (partid = 0; partid < XP_MAX_NPARTITIONS_UV; partid++) {
 		part_uv = &xpc_partitions[partid].sn.uv;
-
-		if (part_uv->cached_activate_gru_mq_desc != NULL) {
+		if (part_uv->cached_activate_gru_mq_desc) {
 			mutex_lock(&part_uv->cached_activate_gru_mq_desc_mutex);
 			spin_lock_irqsave(&part_uv->flags_lock, irq_flags);
 			part_uv->flags &= ~XPC_P_CACHED_ACTIVATE_GRU_MQ_DESC_UV;
@@ -215,14 +214,14 @@ xpc_create_gru_mq_uv(unsigned int mq_size, int cpu, char *irq_name,
 	struct uv_IO_APIC_route_entry *mmr_value;
 	struct xpc_gru_mq_uv *mq = kmalloc(sizeof(*mq), GFP_KERNEL);
 
-	if (mq = NULL) {
+	if (!mq) {
 		ret = -ENOMEM;
 		goto out_0;
 	}
 
 	mq->gru_mq_desc = kzalloc(sizeof(struct gru_message_queue_desc),
 				  GFP_KERNEL);
-	if (mq->gru_mq_desc = NULL) {
+	if (!mq->gru_mq_desc) {
 		ret = -ENOMEM;
 		goto out_1;
 	}
@@ -237,7 +236,7 @@ xpc_create_gru_mq_uv(unsigned int mq_size, int cpu, char *irq_name,
 	page = __alloc_pages_node(nid,
 				      GFP_KERNEL | __GFP_ZERO | __GFP_THISNODE,
 				      pg_order);
-	if (page = NULL) {
+	if (!page) {
 		dev_err(xpc_part, "xpc_create_gru_mq_uv() failed to alloc %d "
 			"bytes of memory on nid=%d for GRU mq\n", mq_size, nid);
 		ret = -ENOMEM;
@@ -621,7 +620,7 @@ xpc_handle_activate_IRQ_uv(int irq, void *dev_id)
 
 	while (1) {
 		msg_hdr = gru_get_next_message(xpc_activate_mq_uv->gru_mq_desc);
-		if (msg_hdr = NULL)
+		if (!msg_hdr)
 			break;
 
 		partid = msg_hdr->partid;
@@ -684,9 +683,9 @@ xpc_send_activate_IRQ_uv(struct xpc_partition *part, void *msg, size_t msg_size,
 again:
 	if (!(part_uv->flags & XPC_P_CACHED_ACTIVATE_GRU_MQ_DESC_UV)) {
 		gru_mq_desc = part_uv->cached_activate_gru_mq_desc;
-		if (gru_mq_desc = NULL) {
+		if (!gru_mq_desc) {
 			gru_mq_desc = kmalloc(sizeof(*gru_mq_desc), GFP_KERNEL);
-			if (gru_mq_desc = NULL) {
+			if (!gru_mq_desc) {
 				ret = xpNoMemory;
 				goto done;
 			}
@@ -737,12 +736,12 @@ xpc_send_activate_IRQ_ch_uv(struct xpc_channel *ch, unsigned long *irq_flags,
 
 	ret = xpc_send_activate_IRQ_uv(part, msg, msg_size, msg_type);
 	if (unlikely(ret != xpSuccess)) {
-		if (irq_flags != NULL)
+		if (irq_flags)
 			spin_unlock_irqrestore(&ch->lock, *irq_flags);
 
 		XPC_DEACTIVATE_PARTITION(part, ret);
 
-		if (irq_flags != NULL)
+		if (irq_flags)
 			spin_lock_irqsave(&ch->lock, *irq_flags);
 	}
 }
@@ -961,9 +960,9 @@ xpc_get_fifo_entry_uv(struct xpc_fifo_head_uv *head)
 
 	spin_lock_irqsave(&head->lock, irq_flags);
 	first = head->first;
-	if (head->first != NULL) {
+	if (head->first) {
 		head->first = first->next;
-		if (head->first = NULL)
+		if (!head->first)
 			head->last = NULL;
 
 		head->n_entries--;
@@ -983,7 +982,7 @@ xpc_put_fifo_entry_uv(struct xpc_fifo_head_uv *head,
 
 	last->next = NULL;
 	spin_lock_irqsave(&head->lock, irq_flags);
-	if (head->last != NULL)
+	if (head->last)
 		head->last->next = last;
 	else
 		head->first = last;
@@ -1084,7 +1083,7 @@ xpc_allocate_send_msg_slot_uv(struct xpc_channel *ch)
 	for (nentries = ch->local_nentries; nentries > 0; nentries--) {
 		nbytes = nentries * sizeof(struct xpc_send_msg_slot_uv);
 		ch_uv->send_msg_slots = kzalloc(nbytes, GFP_KERNEL);
-		if (ch_uv->send_msg_slots = NULL)
+		if (!ch_uv->send_msg_slots)
 			continue;
 
 		for (entry = 0; entry < nentries; entry++) {
@@ -1118,7 +1117,7 @@ xpc_allocate_recv_msg_slot_uv(struct xpc_channel *ch)
 	for (nentries = ch->remote_nentries; nentries > 0; nentries--) {
 		nbytes = nentries * ch->entry_size;
 		ch_uv->recv_msg_slots = kzalloc(nbytes, GFP_KERNEL);
-		if (ch_uv->recv_msg_slots = NULL)
+		if (!ch_uv->recv_msg_slots)
 			continue;
 
 		for (entry = 0; entry < nentries; entry++) {
@@ -1152,7 +1151,7 @@ xpc_setup_msg_structures_uv(struct xpc_channel *ch)
 	ch_uv->cached_notify_gru_mq_desc = kmalloc(sizeof(struct
 						   gru_message_queue_desc),
 						   GFP_KERNEL);
-	if (ch_uv->cached_notify_gru_mq_desc = NULL)
+	if (!ch_uv->cached_notify_gru_mq_desc)
 		return xpNoMemory;
 
 	ret = xpc_allocate_send_msg_slot_uv(ch);
@@ -1263,7 +1262,7 @@ xpc_save_remote_msgqueue_pa_uv(struct xpc_channel *ch,
 {
 	struct xpc_channel_uv *ch_uv = &ch->sn.uv;
 
-	DBUG_ON(ch_uv->cached_notify_gru_mq_desc = NULL);
+	DBUG_ON(!ch_uv->cached_notify_gru_mq_desc);
 	return xpc_cache_remote_gru_mq_desc_uv(ch_uv->cached_notify_gru_mq_desc,
 					       gru_mq_desc_gpa);
 }
@@ -1327,7 +1326,7 @@ xpc_allocate_msg_slot_uv(struct xpc_channel *ch, u32 flags,
 
 	while (1) {
 		entry = xpc_get_fifo_entry_uv(&ch->sn.uv.msg_slot_free_list);
-		if (entry != NULL)
+		if (entry)
 			break;
 
 		if (flags & XPC_NOWAIT)
@@ -1361,8 +1360,7 @@ xpc_notify_sender_uv(struct xpc_channel *ch,
 {
 	xpc_notify_func func = msg_slot->func;
 
-	if (func != NULL && cmpxchg(&msg_slot->func, func, NULL) = func) {
-
+	if (func && cmpxchg(&msg_slot->func, func, NULL) = func) {
 		atomic_dec(&ch->n_to_notify);
 
 		dev_dbg(xpc_chan, "msg_slot->func() called, msg_slot=0x%p "
@@ -1389,7 +1387,7 @@ xpc_handle_notify_mq_ack_uv(struct xpc_channel *ch,
 	BUG_ON(msg_slot->msg_slot_number != msg->hdr.msg_slot_number);
 	msg_slot->msg_slot_number += ch->local_nentries;
 
-	if (msg_slot->func != NULL)
+	if (msg_slot->func)
 		xpc_notify_sender_uv(ch, msg_slot, xpMsgDelivered);
 
 	xpc_free_msg_slot_uv(ch, msg_slot);
@@ -1551,7 +1549,7 @@ xpc_send_payload_uv(struct xpc_channel *ch, u32 flags, void *payload,
 	if (ret != xpSuccess)
 		goto out_1;
 
-	if (func != NULL) {
+	if (func) {
 		atomic_inc(&ch->n_to_notify);
 
 		msg_slot->key = key;
@@ -1578,7 +1576,7 @@ xpc_send_payload_uv(struct xpc_channel *ch, u32 flags, void *payload,
 
 	XPC_DEACTIVATE_PARTITION(&xpc_partitions[ch->partid], ret);
 out_2:
-	if (func != NULL) {
+	if (func) {
 		/*
 		 * Try to NULL the msg_slot's func field. If we fail, then
 		 * xpc_notify_senders_of_disconnect_uv() beat us to it, in which
@@ -1624,7 +1622,7 @@ xpc_notify_senders_of_disconnect_uv(struct xpc_channel *ch)
 			break;
 
 		msg_slot = &ch->sn.uv.send_msg_slots[entry];
-		if (msg_slot->func != NULL)
+		if (msg_slot->func)
 			xpc_notify_sender_uv(ch, msg_slot, ch->reason);
 	}
 }
@@ -1641,7 +1639,7 @@ xpc_get_deliverable_payload_uv(struct xpc_channel *ch)
 
 	if (!(ch->flags & XPC_C_DISCONNECTING)) {
 		entry = xpc_get_fifo_entry_uv(&ch->sn.uv.recv_msg_list);
-		if (entry != NULL) {
+		if (entry) {
 			msg = container_of(entry, struct xpc_notify_mq_msg_uv,
 					   hdr.u.next);
 			payload = &msg->payload;
-- 
2.15.1

