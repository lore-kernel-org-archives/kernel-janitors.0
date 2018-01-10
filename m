From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 19:27:13 +0000
Subject: [PATCH 3/7] VMCI: Update a word in five comment lines
Message-Id: <58131809-fc23-fb35-eb9f-14b5dc1c5152@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2747f123-a95d-bc68-b858-0327dce3758b@users.sourceforge.net>
In-Reply-To: <2747f123-a95d-bc68-b858-0327dce3758b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Alexey Dobriyan <adobriyan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Ingo Molnar <mingo@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>, trivial@kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 18:15:43 +0100

Adjust words in these descriptions.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/vmw_vmci/vmci_datagram.c   | 2 +-
 drivers/misc/vmw_vmci/vmci_doorbell.c   | 2 +-
 drivers/misc/vmw_vmci/vmci_queue_pair.c | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_datagram.c b/drivers/misc/vmw_vmci/vmci_datagram.c
index fbe145e2d125..88f39305b32e 100644
--- a/drivers/misc/vmw_vmci/vmci_datagram.c
+++ b/drivers/misc/vmw_vmci/vmci_datagram.c
@@ -438,7 +438,7 @@ EXPORT_SYMBOL_GPL(vmci_datagram_create_handle_priv);
  * @out_handle: vmci_handle that is populated as a result of this function.
  *
  * Creates a host context datagram endpoint and returns a handle to
- * it.  Same as vmci_datagram_create_handle_priv without the priviledge
+ * it.  Same as vmci_datagram_create_handle_priv without the privilege
  * flags argument.
  */
 int vmci_datagram_create_handle(u32 resource_id,
diff --git a/drivers/misc/vmw_vmci/vmci_doorbell.c b/drivers/misc/vmw_vmci/vmci_doorbell.c
index 46607ffc94db..c0f9aa2c0abc 100644
--- a/drivers/misc/vmw_vmci/vmci_doorbell.c
+++ b/drivers/misc/vmw_vmci/vmci_doorbell.c
@@ -571,7 +571,7 @@ EXPORT_SYMBOL_GPL(vmci_doorbell_destroy);
 /*
  * vmci_doorbell_notify() - Ring the doorbell (and hide in the bushes).
  * @dst:        The handlle identifying the doorbell resource
- * @priv_flags: Priviledge flags.
+ * @priv_flags: Privilege flags.
  *
  * Generates a notification on the doorbell identified by the
  * handle. For host side generation of notifications, the caller
diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_vmci/vmci_queue_pair.c
index 0339538c182d..381e25c69c1f 100644
--- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
+++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
@@ -2532,7 +2532,7 @@ static bool qp_wait_for_ready_queue(struct vmci_qp *qpair)
  * VMCI_ERROR_QUEUEPAIR_NOSPACE if no space was available to enqueue
  * data, VMCI_ERROR_INVALID_SIZE, if any queue pointer is outside the
  * queue (as defined by the queue size), VMCI_ERROR_INVALID_ARGS, if
- * an error occured when accessing the buffer,
+ * an error occurred when accessing the buffer,
  * VMCI_ERROR_QUEUEPAIR_NOTATTACHED, if the queue pair pages aren't
  * available.  Otherwise, the number of bytes written to the queue is
  * returned.  Updates the tail pointer of the produce queue.
@@ -2592,7 +2592,7 @@ static ssize_t qp_enqueue_locked(struct vmci_queue *produce_q,
  * VMCI_ERROR_QUEUEPAIR_NODATA if no data was available to dequeue.
  * VMCI_ERROR_INVALID_SIZE, if any queue pointer is outside the queue
  * (as defined by the queue size).
- * VMCI_ERROR_INVALID_ARGS, if an error occured when accessing the buffer.
+ * VMCI_ERROR_INVALID_ARGS, if an error occurred when accessing the buffer.
  * Otherwise the number of bytes dequeued is returned.
  * Side effects:
  * Updates the head pointer of the consume queue.
@@ -2656,7 +2656,7 @@ static ssize_t qp_dequeue_locked(struct vmci_queue *produce_q,
  * @consume_qsize:      Desired size of the consumer queue.
  * @peer:       ContextID of the peer.
  * @flags:      VMCI flags.
- * @priv_flags: VMCI priviledge flags.
+ * @priv_flags: VMCI privilege flags.
  *
  * This is the client interface for allocating the memory for a
  * vmci_qp structure and then attaching to the underlying
-- 
2.15.1

