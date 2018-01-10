From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 19:30:34 +0000
Subject: [PATCH 6/7] VMCI: Less function calls in qp_broker_create() after error detection
Message-Id: <f9f2c79c-fe48-ffa7-3e8f-23f9433a5b51@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2747f123-a95d-bc68-b858-0327dce3758b@users.sourceforge.net>
In-Reply-To: <2747f123-a95d-bc68-b858-0327dce3758b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Alexey Dobriyan <adobriyan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Ingo Molnar <mingo@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 19:39:45 +0100

The function "qp_host_free_queue" was called in two cases
by the function "qp_broker_create" during error handling even if
the passed data structure member contained a null pointer.

Adjust jump targets according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/vmw_vmci/vmci_queue_pair.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_vmci/vmci_queue_pair.c
index 5546274dec5d..9b7dcad38f3d 100644
--- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
+++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
@@ -1358,12 +1358,12 @@ static int qp_broker_create(struct vmci_handle handle,
 	entry->produce_q = qp_host_alloc_queue(guest_produce_size);
 	if (entry->produce_q = NULL) {
 		result = VMCI_ERROR_NO_MEM;
-		goto error;
+		goto free_entry;
 	}
 	entry->consume_q = qp_host_alloc_queue(guest_consume_size);
 	if (entry->consume_q = NULL) {
 		result = VMCI_ERROR_NO_MEM;
-		goto error;
+		goto free_produce_queue;
 	}
 
 	qp_init_queue_mutex(entry->produce_q, entry->consume_q);
@@ -1377,7 +1377,7 @@ static int qp_broker_create(struct vmci_handle handle,
 					   PAGE_SIZE, GFP_KERNEL);
 		if (entry->local_mem = NULL) {
 			result = VMCI_ERROR_NO_MEM;
-			goto error;
+			goto free_consume_queue;
 		}
 		entry->state = VMCIQPB_CREATED_MEM;
 		entry->produce_q->q_header = entry->local_mem;
@@ -1393,7 +1393,7 @@ static int qp_broker_create(struct vmci_handle handle,
 						      entry->produce_q,
 						      entry->consume_q);
 		if (result < VMCI_SUCCESS)
-			goto error;
+			goto free_consume_queue;
 
 		entry->state = VMCIQPB_CREATED_MEM;
 	} else {
@@ -1418,7 +1418,7 @@ static int qp_broker_create(struct vmci_handle handle,
 	if (result != VMCI_SUCCESS) {
 		pr_warn("Failed to add new resource (handle=0x%x:0x%x), error: %d",
 			handle.context, handle.resource, result);
-		goto error;
+		goto free_consume_queue;
 	}
 
 	entry->qp.handle = vmci_resource_handle(&entry->resource);
@@ -1433,9 +1433,11 @@ static int qp_broker_create(struct vmci_handle handle,
 
 	return VMCI_SUCCESS;
 
- error:
-	qp_host_free_queue(entry->produce_q, guest_produce_size);
+free_consume_queue:
 	qp_host_free_queue(entry->consume_q, guest_consume_size);
+free_produce_queue:
+	qp_host_free_queue(entry->produce_q, guest_produce_size);
+free_entry:
 	kfree(entry);
 	return result;
 }
-- 
2.15.1

