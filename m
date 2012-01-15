From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 15 Jan 2012 11:30:24 +0000
Subject: [patch] target: make one-bit bitfields unsigned
Message-Id: <20120115113024.GE20463@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: Christoph Hellwig <hch@lst.de>, Andy Grover <agrover@redhat.com>, Joern Engel <joern@logfs.org>, Roland Dreier <roland@kernel.org>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

Signed bitfields are a problem because instead of being 1 or 0 like
you'd expect they are 0 and -1.  It doesn't cause a problem in this case
but sparse complains:

drivers/target/iscsi/iscsi_target_core.h:564:56: error: dubious one-bit
signed bitfield

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/target/iscsi/iscsi_target_core.h b/drivers/target/iscsi/iscsi_target_core.h
index f1a02da..ebf81fd 100644
--- a/drivers/target/iscsi/iscsi_target_core.h
+++ b/drivers/target/iscsi/iscsi_target_core.h
@@ -561,8 +561,8 @@ struct iscsi_conn {
 	struct hash_desc	conn_tx_hash;
 	/* Used for scheduling TX and RX connection kthreads */
 	cpumask_var_t		conn_cpumask;
-	int			conn_rx_reset_cpumask:1;
-	int			conn_tx_reset_cpumask:1;
+	unsigned int		conn_rx_reset_cpumask:1;
+	unsigned int		conn_tx_reset_cpumask:1;
 	/* list_head of struct iscsi_cmd for this connection */
 	struct list_head	conn_cmd_list;
 	struct list_head	immed_queue_list;
