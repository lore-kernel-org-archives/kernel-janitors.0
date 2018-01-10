From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 19:32:08 +0000
Subject: [PATCH 7/7] VMCI: Adjust 32 checks for null pointers
Message-Id: <b35e5bdf-5469-7643-ad68-ad4783376fe6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2747f123-a95d-bc68-b858-0327dce3758b@users.sourceforge.net>
In-Reply-To: <2747f123-a95d-bc68-b858-0327dce3758b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Alexey Dobriyan <adobriyan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Ingo Molnar <mingo@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 20:04:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/vmw_vmci/vmci_context.c    | 20 ++++++++++----------
 drivers/misc/vmw_vmci/vmci_datagram.c   |  8 ++++----
 drivers/misc/vmw_vmci/vmci_doorbell.c   |  2 +-
 drivers/misc/vmw_vmci/vmci_guest.c      |  2 +-
 drivers/misc/vmw_vmci/vmci_host.c       |  2 +-
 drivers/misc/vmw_vmci/vmci_queue_pair.c | 26 ++++++++++++--------------
 6 files changed, 29 insertions(+), 31 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_context.c b/drivers/misc/vmw_vmci/vmci_context.c
index c7085ff76327..055e4491093c 100644
--- a/drivers/misc/vmw_vmci/vmci_context.c
+++ b/drivers/misc/vmw_vmci/vmci_context.c
@@ -212,7 +212,7 @@ static int ctx_fire_notification(u32 context_id, u32 priv_flags)
 	 * scanning through all contexts.
 	 */
 	subscriber_array = vmci_handle_arr_create(0);
-	if (subscriber_array = NULL)
+	if (!subscriber_array)
 		return VMCI_ERROR_NO_MEM;
 
 	/*
@@ -279,7 +279,7 @@ int vmci_ctx_pending_datagrams(u32 cid, u32 *pending)
 	struct vmci_ctx *context;
 
 	context = vmci_ctx_get(cid);
-	if (context = NULL)
+	if (!context)
 		return VMCI_ERROR_INVALID_ARGS;
 
 	spin_lock(&context->lock);
@@ -316,7 +316,7 @@ int vmci_ctx_enqueue_datagram(u32 cid, struct vmci_datagram *dg)
 
 	/* Allocate guest call entry and add it to the target VM's queue. */
 	dq_entry = kmalloc(sizeof(*dq_entry), GFP_KERNEL);
-	if (dq_entry = NULL) {
+	if (!dq_entry) {
 		vmci_ctx_put(context);
 		return VMCI_ERROR_NO_MEM;
 	}
@@ -860,7 +860,7 @@ int vmci_ctx_rcv_notifications_get(u32 context_id,
 	int result = VMCI_SUCCESS;
 
 	context = vmci_ctx_get(context_id);
-	if (context = NULL)
+	if (!context)
 		return VMCI_ERROR_NOT_FOUND;
 
 	spin_lock(&context->lock);
@@ -944,7 +944,7 @@ int vmci_ctx_dbell_create(u32 context_id, struct vmci_handle handle)
 		return VMCI_ERROR_INVALID_ARGS;
 
 	context = vmci_ctx_get(context_id);
-	if (context = NULL)
+	if (!context)
 		return VMCI_ERROR_NOT_FOUND;
 
 	spin_lock(&context->lock);
@@ -974,7 +974,7 @@ int vmci_ctx_dbell_destroy(u32 context_id, struct vmci_handle handle)
 		return VMCI_ERROR_INVALID_ARGS;
 
 	context = vmci_ctx_get(context_id);
-	if (context = NULL)
+	if (!context)
 		return VMCI_ERROR_NOT_FOUND;
 
 	spin_lock(&context->lock);
@@ -1002,7 +1002,7 @@ int vmci_ctx_dbell_destroy_all(u32 context_id)
 		return VMCI_ERROR_INVALID_ARGS;
 
 	context = vmci_ctx_get(context_id);
-	if (context = NULL)
+	if (!context)
 		return VMCI_ERROR_NOT_FOUND;
 
 	spin_lock(&context->lock);
@@ -1121,7 +1121,7 @@ int vmci_ctx_qp_create(struct vmci_ctx *context, struct vmci_handle handle)
 {
 	int result;
 
-	if (context = NULL || vmci_handle_is_invalid(handle))
+	if (!context || vmci_handle_is_invalid(handle))
 		return VMCI_ERROR_INVALID_ARGS;
 
 	if (!vmci_handle_arr_has_entry(context->queue_pair_array, handle)) {
@@ -1143,7 +1143,7 @@ int vmci_ctx_qp_destroy(struct vmci_ctx *context, struct vmci_handle handle)
 {
 	struct vmci_handle hndl;
 
-	if (context = NULL || vmci_handle_is_invalid(handle))
+	if (!context || vmci_handle_is_invalid(handle))
 		return VMCI_ERROR_INVALID_ARGS;
 
 	hndl = vmci_handle_arr_remove_entry(context->queue_pair_array, handle);
@@ -1158,7 +1158,7 @@ int vmci_ctx_qp_destroy(struct vmci_ctx *context, struct vmci_handle handle)
  */
 bool vmci_ctx_qp_exists(struct vmci_ctx *context, struct vmci_handle handle)
 {
-	if (context = NULL || vmci_handle_is_invalid(handle))
+	if (!context || vmci_handle_is_invalid(handle))
 		return false;
 
 	return vmci_handle_arr_has_entry(context->queue_pair_array, handle);
diff --git a/drivers/misc/vmw_vmci/vmci_datagram.c b/drivers/misc/vmw_vmci/vmci_datagram.c
index 88f39305b32e..e3f97fc72565 100644
--- a/drivers/misc/vmw_vmci/vmci_datagram.c
+++ b/drivers/misc/vmw_vmci/vmci_datagram.c
@@ -275,7 +275,7 @@ static int dg_dispatch_as_host(u32 context_id, struct vmci_datagram *dg)
 
 		/* We make a copy to enqueue. */
 		new_dg = kmemdup(dg, dg_size, GFP_KERNEL);
-		if (new_dg = NULL)
+		if (!new_dg)
 			return VMCI_ERROR_NO_MEM;
 
 		retval = vmci_ctx_enqueue_datagram(dg->dst.context, new_dg);
@@ -413,10 +413,10 @@ int vmci_datagram_create_handle_priv(u32 resource_id,
 				     void *client_data,
 				     struct vmci_handle *out_handle)
 {
-	if (out_handle = NULL)
+	if (!out_handle)
 		return VMCI_ERROR_INVALID_ARGS;
 
-	if (recv_cb = NULL) {
+	if (!recv_cb) {
 		pr_devel("Client callback needed when creating datagram\n");
 		return VMCI_ERROR_INVALID_ARGS;
 	}
@@ -492,7 +492,7 @@ EXPORT_SYMBOL_GPL(vmci_datagram_destroy_handle);
  */
 int vmci_datagram_send(struct vmci_datagram *msg)
 {
-	if (msg = NULL)
+	if (!msg)
 		return VMCI_ERROR_INVALID_ARGS;
 
 	return vmci_datagram_dispatch(VMCI_INVALID_ID, msg, false);
diff --git a/drivers/misc/vmw_vmci/vmci_doorbell.c b/drivers/misc/vmw_vmci/vmci_doorbell.c
index c0f9aa2c0abc..aacf6ab52c20 100644
--- a/drivers/misc/vmw_vmci/vmci_doorbell.c
+++ b/drivers/misc/vmw_vmci/vmci_doorbell.c
@@ -92,7 +92,7 @@ static u32 last_notify_idx_released = PAGE_SIZE;
  */
 int vmci_dbell_get_priv_flags(struct vmci_handle handle, u32 *priv_flags)
 {
-	if (priv_flags = NULL || handle.context = VMCI_INVALID_ID)
+	if (!priv_flags || handle.context = VMCI_INVALID_ID)
 		return VMCI_ERROR_INVALID_ARGS;
 
 	if (handle.context = VMCI_HOST_CONTEXT_ID) {
diff --git a/drivers/misc/vmw_vmci/vmci_guest.c b/drivers/misc/vmw_vmci/vmci_guest.c
index ba18e727c401..6ea3dd9de644 100644
--- a/drivers/misc/vmw_vmci/vmci_guest.c
+++ b/drivers/misc/vmw_vmci/vmci_guest.c
@@ -100,7 +100,7 @@ int vmci_send_datagram(struct vmci_datagram *dg)
 	int result;
 
 	/* Check args. */
-	if (dg = NULL)
+	if (!dg)
 		return VMCI_ERROR_INVALID_ARGS;
 
 	/*
diff --git a/drivers/misc/vmw_vmci/vmci_host.c b/drivers/misc/vmw_vmci/vmci_host.c
index 14da8210fd34..903d877415cd 100644
--- a/drivers/misc/vmw_vmci/vmci_host.c
+++ b/drivers/misc/vmw_vmci/vmci_host.c
@@ -125,7 +125,7 @@ static int vmci_host_open(struct inode *inode, struct file *filp)
 	struct vmci_host_dev *vmci_host_dev;
 
 	vmci_host_dev = kzalloc(sizeof(*vmci_host_dev), GFP_KERNEL);
-	if (vmci_host_dev = NULL)
+	if (!vmci_host_dev)
 		return -ENOMEM;
 
 	vmci_host_dev->ct_type = VMCIOBJ_NOT_SET;
diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_vmci/vmci_queue_pair.c
index 9b7dcad38f3d..fd86e97cc966 100644
--- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
+++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
@@ -755,15 +755,15 @@ static int qp_host_map_queues(struct vmci_queue *produce_q,
 		if (produce_q->q_header != consume_q->q_header)
 			return VMCI_ERROR_QUEUEPAIR_MISMATCH;
 
-		if (produce_q->kernel_if->u.h.header_page = NULL ||
-		    *produce_q->kernel_if->u.h.header_page = NULL)
+		if (!produce_q->kernel_if->u.h.header_page ||
+		    !*produce_q->kernel_if->u.h.header_page)
 			return VMCI_ERROR_UNAVAILABLE;
 
 		headers[0] = *produce_q->kernel_if->u.h.header_page;
 		headers[1] = *consume_q->kernel_if->u.h.header_page;
 
 		produce_q->q_header = vmap(headers, 2, VM_MAP, PAGE_KERNEL);
-		if (produce_q->q_header != NULL) {
+		if (produce_q->q_header) {
 			consume_q->q_header  			    (struct vmci_queue_header *)((u8 *)
 							 produce_q->q_header +
@@ -1356,12 +1356,12 @@ static int qp_broker_create(struct vmci_handle handle,
 	entry->wakeup_cb = wakeup_cb;
 	entry->client_data = client_data;
 	entry->produce_q = qp_host_alloc_queue(guest_produce_size);
-	if (entry->produce_q = NULL) {
+	if (!entry->produce_q) {
 		result = VMCI_ERROR_NO_MEM;
 		goto free_entry;
 	}
 	entry->consume_q = qp_host_alloc_queue(guest_consume_size);
-	if (entry->consume_q = NULL) {
+	if (!entry->consume_q) {
 		result = VMCI_ERROR_NO_MEM;
 		goto free_produce_queue;
 	}
@@ -1375,7 +1375,7 @@ static int qp_broker_create(struct vmci_handle handle,
 
 		entry->local_mem = kcalloc(QPE_NUM_PAGES(entry->qp),
 					   PAGE_SIZE, GFP_KERNEL);
-		if (entry->local_mem = NULL) {
+		if (!entry->local_mem) {
 			result = VMCI_ERROR_NO_MEM;
 			goto free_consume_queue;
 		}
@@ -1408,7 +1408,7 @@ static int qp_broker_create(struct vmci_handle handle,
 	}
 
 	qp_list_add_entry(&qp_broker_list, &entry->qp);
-	if (ent != NULL)
+	if (ent)
 		*ent = entry;
 
 	/* Add to resource obj */
@@ -1626,7 +1626,7 @@ static int qp_broker_attach(struct qp_broker_entry *entry,
 		if (entry->state != VMCIQPB_CREATED_NO_MEM)
 			return VMCI_ERROR_INVALID_ARGS;
 
-		if (page_store != NULL) {
+		if (page_store) {
 			/*
 			 * Patch up host state to point to guest
 			 * supplied memory. The VMX already
@@ -1682,7 +1682,7 @@ static int qp_broker_attach(struct qp_broker_entry *entry,
 	if (!is_local)
 		vmci_ctx_qp_create(context, entry->qp.handle);
 
-	if (ent != NULL)
+	if (ent)
 		*ent = entry;
 
 	return VMCI_SUCCESS;
@@ -2282,8 +2282,7 @@ static int qp_save_headers(struct qp_broker_entry *entry)
 {
 	int result;
 
-	if (entry->produce_q->saved_header != NULL &&
-	    entry->consume_q->saved_header != NULL) {
+	if (entry->produce_q->saved_header && entry->consume_q->saved_header) {
 		/*
 		 *  If the headers have already been saved, we don't need to do
 		 *  it again, and we don't want to map in the headers
@@ -2293,8 +2292,7 @@ static int qp_save_headers(struct qp_broker_entry *entry)
 		return VMCI_SUCCESS;
 	}
 
-	if (NULL = entry->produce_q->q_header ||
-	    NULL = entry->consume_q->q_header) {
+	if (!entry->produce_q->q_header || !entry->consume_q->q_header) {
 		result = qp_host_map_queues(entry->produce_q, entry->consume_q);
 		if (result < VMCI_SUCCESS)
 			return result;
@@ -2448,7 +2446,7 @@ static int qp_map_queue_headers(struct vmci_queue *produce_q,
 {
 	int result;
 
-	if (NULL = produce_q->q_header || NULL = consume_q->q_header) {
+	if (!produce_q->q_header || !consume_q->q_header) {
 		result = qp_host_map_queues(produce_q, consume_q);
 		if (result < VMCI_SUCCESS)
 			return (produce_q->saved_header &&
-- 
2.15.1

