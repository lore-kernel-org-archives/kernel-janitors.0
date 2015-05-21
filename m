From: Mike Shuey <shuey@purdue.edu>
Date: Thu, 21 May 2015 19:50:34 +0000
Subject: [PATCH v4 11/13] staging: lnet: o2iblnd: checkpatch.pl fixes
Message-Id: <1432237849-53947-12-git-send-email-shuey@purdue.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
In-Reply-To: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oleg.drokin@intel.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, lustre-deve@lists.lustre.org, Mike Shuey <shuey@purdue.edu>

Clean up most checkpatch.pl warnings (primarily line length warnings).

Signed-off-by: Mike Shuey <shuey@purdue.edu>
---
 .../staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c    |   25 ++-
 .../staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h    |  204 +++++++++++---------
 .../staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c |  184 +++++++++++-------
 .../lustre/lnet/klnds/o2iblnd/o2iblnd_modparams.c  |   55 ++++--
 4 files changed, 277 insertions(+), 191 deletions(-)

diff --git a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
index a57c5c3..acfa465 100644
--- a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
+++ b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
@@ -1166,10 +1166,11 @@ void kiblnd_map_rx_descs(kib_conn_t *conn)
 		rx->rx_conn = conn;
 		rx->rx_msg = (kib_msg_t *)(((char *)page_address(pg)) + pg_off);
 
-		rx->rx_msgaddr = kiblnd_dma_map_single(conn->ibc_hdev->ibh_ibdev,
-						       rx->rx_msg,
-						       IBLND_MSG_SIZE,
-						       DMA_FROM_DEVICE);
+		rx->rx_msgaddr = kiblnd_dma_map_single(
+						conn->ibc_hdev->ibh_ibdev,
+						rx->rx_msg,
+						IBLND_MSG_SIZE,
+						DMA_FROM_DEVICE);
 		LASSERT(!kiblnd_dma_mapping_error(conn->ibc_hdev->ibh_ibdev,
 						   rx->rx_msgaddr));
 		KIBLND_UNMAP_ADDR_SET(rx, rx_msgunmap, rx->rx_msgaddr);
@@ -1387,7 +1388,7 @@ static int kiblnd_create_fmr_pool(kib_fmr_poolset_t *fps,
 		.max_pages_per_fmr = LNET_MAX_PAYLOAD/PAGE_SIZE,
 		.page_shift        = PAGE_SHIFT,
 		.access            = (IB_ACCESS_LOCAL_WRITE |
-		                      IB_ACCESS_REMOTE_WRITE),
+				      IB_ACCESS_REMOTE_WRITE),
 		.pool_size         = fps->fps_pool_size,
 		.dirty_watermark   = fps->fps_flush_trigger,
 		.flush_function    = NULL,
@@ -1753,7 +1754,8 @@ struct list_head *kiblnd_pool_alloc_node(kib_poolset_t *ps)
 	if (ps->ps_increasing) {
 		/* another thread is allocating a new pool */
 		spin_unlock(&ps->ps_lock);
-		CDEBUG(D_NET, "Another thread is allocating new %s pool, waiting for her to complete\n",
+		CDEBUG(D_NET,
+		       "Another thread is allocating new %s pool, waiting for her to complete\n",
 		       ps->ps_name);
 		schedule();
 		goto again;
@@ -2354,7 +2356,8 @@ static int kiblnd_hdev_setup_mrs(kib_hca_dev_t *hdev)
 
 	if (hdev->ibh_mr_shift < 32 || hdev->ibh_nmrs > 1024) {
 		/* it's 4T..., assume we will re-code at that time */
-		CERROR("Can't support memory size: x%#llx with MR size: x%#llx\n",
+		CERROR(
+		       "Can't support memory size: x%#llx with MR size: x%#llx\n",
 		       mm_size, mr_size);
 		return -EINVAL;
 	}
@@ -2376,7 +2379,8 @@ static int kiblnd_hdev_setup_mrs(kib_hca_dev_t *hdev)
 
 		mr = ib_reg_phys_mr(hdev->ibh_pd, &ipb, 1, acflags, &iova);
 		if (IS_ERR(mr)) {
-			CERROR("Failed ib_reg_phys_mr addr %#llx size %#llx : %ld\n",
+			CERROR(
+			       "Failed ib_reg_phys_mr addr %#llx size %#llx : %ld\n",
 			       ipb.addr, ipb.size, PTR_ERR(mr));
 			kiblnd_hdev_cleanup_mrs(hdev);
 			return PTR_ERR(mr);
@@ -2389,7 +2393,8 @@ static int kiblnd_hdev_setup_mrs(kib_hca_dev_t *hdev)
 
 out:
 	if (hdev->ibh_mr_size != ~0ULL || hdev->ibh_nmrs != 1)
-		LCONSOLE_INFO("Register global MR array, MR size: %#llx, array size: %d\n",
+		LCONSOLE_INFO(
+			      "Register global MR array, MR size: %#llx, array size: %d\n",
 			      hdev->ibh_mr_size, hdev->ibh_nmrs);
 	return 0;
 }
@@ -2758,7 +2763,7 @@ void kiblnd_shutdown(lnet_ni_t *ni)
 		i = 2;
 		while (atomic_read(&net->ibn_npeers) != 0) {
 			i++;
-			CDEBUG(((i & (-i)) = i) ? D_WARNING : D_NET, /* 2**n? */
+			CDEBUG(((i & (-i)) = i) ? D_WARNING : D_NET,/* 2**n? */
 			       "%s: waiting for %d peers to disconnect\n",
 			       libcfs_nid2str(ni->ni_nid),
 			       atomic_read(&net->ibn_npeers));
diff --git a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h
index 7f52c69..976665b 100644
--- a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h
+++ b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h
@@ -48,7 +48,7 @@
 #include <linux/uio.h>
 #include <linux/uaccess.h>
 
-#include <asm/io.h>
+#include <linux/io.h>
 
 #include <linux/fs.h>
 #include <linux/file.h>
@@ -118,17 +118,23 @@ typedef struct {
 extern kib_tunables_t  kiblnd_tunables;
 
 #define IBLND_MSG_QUEUE_SIZE_V1   8 /* V1 only : # messages/RDMAs in-flight */
-#define IBLND_CREDIT_HIGHWATER_V1 7 /* V1 only : when eagerly to return credits */
+#define IBLND_CREDIT_HIGHWATER_V1 7 /* V1 only : when eagerly to return
+				     * credits */
 
 #define IBLND_CREDITS_DEFAULT     8 /* default # of peer credits */
-#define IBLND_CREDITS_MAX	  ((typeof(((kib_msg_t*) 0)->ibm_credits)) - 1)  /* Max # of peer credits */
 
-#define IBLND_MSG_QUEUE_SIZE(v)    ((v) = IBLND_MSG_VERSION_1 ? \
-				     IBLND_MSG_QUEUE_SIZE_V1 :   \
-				     *kiblnd_tunables.kib_peertxcredits) /* # messages/RDMAs in-flight */
+/* Max # of peer credits */
+#define IBLND_CREDITS_MAX	  ((typeof(((kib_msg_t *) 0)->ibm_credits)) - 1)
+
+/* # messages/RDMAs in-flight */
+#define IBLND_MSG_QUEUE_SIZE(v)   ((v) = IBLND_MSG_VERSION_1 ? \
+				   IBLND_MSG_QUEUE_SIZE_V1 :    \
+				   *kiblnd_tunables.kib_peertxcredits)
+
+/* when eagerly to return credits */
 #define IBLND_CREDITS_HIGHWATER(v) ((v) = IBLND_MSG_VERSION_1 ? \
-				     IBLND_CREDIT_HIGHWATER_V1 : \
-				     *kiblnd_tunables.kib_peercredits_hiw) /* when eagerly to return credits */
+				    IBLND_CREDIT_HIGHWATER_V1 :  \
+				    *kiblnd_tunables.kib_peercredits_hiw)
 
 #define kiblnd_rdma_create_id(cb, dev, ps, qpt) rdma_create_id(cb, dev, ps, qpt)
 
@@ -144,20 +150,23 @@ kiblnd_concurrent_sends_v1(void)
 	return *kiblnd_tunables.kib_concurrent_sends;
 }
 
-#define IBLND_CONCURRENT_SENDS(v)  ((v) = IBLND_MSG_VERSION_1 ? \
-				     kiblnd_concurrent_sends_v1() : \
-				     *kiblnd_tunables.kib_concurrent_sends)
+#define IBLND_CONCURRENT_SENDS(v) ((v) = IBLND_MSG_VERSION_1 ?           \
+				   kiblnd_concurrent_sends_v1() :         \
+				   *kiblnd_tunables.kib_concurrent_sends)
 /* 2 OOB shall suffice for 1 keepalive and 1 returning credits */
 #define IBLND_OOB_CAPABLE(v)       ((v) != IBLND_MSG_VERSION_1)
 #define IBLND_OOB_MSGS(v)	   (IBLND_OOB_CAPABLE(v) ? 2 : 0)
 
-#define IBLND_MSG_SIZE	      (4<<10)		 /* max size of queued messages (inc hdr) */
-#define IBLND_MAX_RDMA_FRAGS	 LNET_MAX_IOV	   /* max # of fragments supported */
-#define IBLND_CFG_RDMA_FRAGS       (*kiblnd_tunables.kib_map_on_demand != 0 ? \
-				    *kiblnd_tunables.kib_map_on_demand :      \
-				     IBLND_MAX_RDMA_FRAGS)  /* max # of fragments configured by user */
+#define IBLND_MSG_SIZE (4<<10) /* max size of queued messages (inc hdr) */
+#define IBLND_MAX_RDMA_FRAGS LNET_MAX_IOV /* max # of fragments supported */
+
+/* max # of fragments configured by user */
+#define IBLND_CFG_RDMA_FRAGS (*kiblnd_tunables.kib_map_on_demand != 0 ? \
+			      *kiblnd_tunables.kib_map_on_demand :      \
+			      IBLND_MAX_RDMA_FRAGS)
 #define IBLND_RDMA_FRAGS(v)	((v) = IBLND_MSG_VERSION_1 ? \
-				     IBLND_MAX_RDMA_FRAGS : IBLND_CFG_RDMA_FRAGS)
+				     IBLND_MAX_RDMA_FRAGS :   \
+				     IBLND_CFG_RDMA_FRAGS)
 
 /************************/
 /* derived constants... */
@@ -172,14 +181,16 @@ kiblnd_concurrent_sends_v1(void)
 #define IBLND_TX_MSGS()	    (*kiblnd_tunables.kib_ntx)
 
 /* RX messages (per connection) */
-#define IBLND_RX_MSGS(v)	    (IBLND_MSG_QUEUE_SIZE(v) * 2 + IBLND_OOB_MSGS(v))
-#define IBLND_RX_MSG_BYTES(v)       (IBLND_RX_MSGS(v) * IBLND_MSG_SIZE)
-#define IBLND_RX_MSG_PAGES(v)      ((IBLND_RX_MSG_BYTES(v) + PAGE_SIZE - 1) / PAGE_SIZE)
+#define IBLND_RX_MSGS(v)      (IBLND_MSG_QUEUE_SIZE(v) * 2 + IBLND_OOB_MSGS(v))
+#define IBLND_RX_MSG_BYTES(v) (IBLND_RX_MSGS(v) * IBLND_MSG_SIZE)
+#define IBLND_RX_MSG_PAGES(v) ((IBLND_RX_MSG_BYTES(v) + PAGE_SIZE - 1) / \
+			       PAGE_SIZE)
 
 /* WRs and CQEs (per connection) */
-#define IBLND_RECV_WRS(v)	    IBLND_RX_MSGS(v)
-#define IBLND_SEND_WRS(v)	  ((IBLND_RDMA_FRAGS(v) + 1) * IBLND_CONCURRENT_SENDS(v))
-#define IBLND_CQ_ENTRIES(v)	 (IBLND_RECV_WRS(v) + IBLND_SEND_WRS(v))
+#define IBLND_RECV_WRS(v)   IBLND_RX_MSGS(v)
+#define IBLND_SEND_WRS(v)   ((IBLND_RDMA_FRAGS(v) + 1) *            \
+			     IBLND_CONCURRENT_SENDS(v))
+#define IBLND_CQ_ENTRIES(v) (IBLND_RECV_WRS(v) + IBLND_SEND_WRS(v))
 
 struct kib_hca_dev;
 
@@ -520,7 +531,9 @@ typedef struct kib_rx                         /* receive message */
 	enum ib_wc_status      rx_status;     /* completion status */
 	kib_msg_t              *rx_msg;       /* message buffer (host vaddr) */
 	__u64                  rx_msgaddr;    /* message buffer (I/O addr) */
-	DECLARE_PCI_UNMAP_ADDR (rx_msgunmap); /* for dma_unmap_single() */
+
+	DECLARE_PCI_UNMAP_ADDR(rx_msgunmap);  /* for dma_unmap_single() */
+
 	struct ib_recv_wr      rx_wrq;        /* receive work item... */
 	struct ib_sge          rx_sge;        /* ...and its memory */
 } kib_rx_t;
@@ -547,7 +560,9 @@ typedef struct kib_tx                         /* transmit message */
 					       * completion */
 	kib_msg_t              *tx_msg;       /* message buffer (host vaddr) */
 	__u64                  tx_msgaddr;    /* message buffer (I/O addr) */
-	DECLARE_PCI_UNMAP_ADDR (tx_msgunmap); /* for dma_unmap_single() */
+
+	DECLARE_PCI_UNMAP_ADDR(tx_msgunmap);  /* for dma_unmap_single() */
+
 	int                    tx_nwrq;       /* # send work items */
 	struct ib_send_wr      *tx_wrq;       /* send work items... */
 	struct ib_sge          *tx_sge;       /* ...and their memory */
@@ -648,14 +663,14 @@ extern void kiblnd_hdev_destroy(kib_hca_dev_t *hdev);
 static inline void
 kiblnd_hdev_addref_locked(kib_hca_dev_t *hdev)
 {
-	LASSERT (atomic_read(&hdev->ibh_ref) > 0);
+	LASSERT(atomic_read(&hdev->ibh_ref) > 0);
 	atomic_inc(&hdev->ibh_ref);
 }
 
 static inline void
 kiblnd_hdev_decref(kib_hca_dev_t *hdev)
 {
-	LASSERT (atomic_read(&hdev->ibh_ref) > 0);
+	LASSERT(atomic_read(&hdev->ibh_ref) > 0);
 	if (atomic_dec_and_test(&hdev->ibh_ref))
 		kiblnd_hdev_destroy(hdev);
 }
@@ -698,44 +713,44 @@ do {									\
 	}								\
 } while (0)
 
-#define kiblnd_peer_addref(peer)				\
-do {							    \
-	CDEBUG(D_NET, "peer[%p] -> %s (%d)++\n",		\
-	       (peer), libcfs_nid2str((peer)->ibp_nid),	 \
-	       atomic_read (&(peer)->ibp_refcount));	\
-	atomic_inc(&(peer)->ibp_refcount);		  \
+#define kiblnd_peer_addref(peer)                                        \
+do {                                                                    \
+	CDEBUG(D_NET, "peer[%p] -> %s (%d)++\n",                        \
+	       (peer), libcfs_nid2str((peer)->ibp_nid),                 \
+	       atomic_read(&(peer)->ibp_refcount));                     \
+	atomic_inc(&(peer)->ibp_refcount);                              \
 } while (0)
 
-#define kiblnd_peer_decref(peer)				\
-do {							    \
-	CDEBUG(D_NET, "peer[%p] -> %s (%d)--\n",		\
-	       (peer), libcfs_nid2str((peer)->ibp_nid),	 \
-	       atomic_read (&(peer)->ibp_refcount));	\
-	LASSERT_ATOMIC_POS(&(peer)->ibp_refcount);	      \
-	if (atomic_dec_and_test(&(peer)->ibp_refcount))     \
-		kiblnd_destroy_peer(peer);		      \
+#define kiblnd_peer_decref(peer)                                        \
+do {                                                                    \
+	CDEBUG(D_NET, "peer[%p] -> %s (%d)--\n",                        \
+	       (peer), libcfs_nid2str((peer)->ibp_nid),                 \
+	       atomic_read(&(peer)->ibp_refcount));                     \
+	LASSERT_ATOMIC_POS(&(peer)->ibp_refcount);                      \
+	if (atomic_dec_and_test(&(peer)->ibp_refcount))                 \
+		kiblnd_destroy_peer(peer);                              \
 } while (0)
 
 static inline struct list_head *
-kiblnd_nid2peerlist (lnet_nid_t nid)
+kiblnd_nid2peerlist(lnet_nid_t nid)
 {
 	unsigned int hash  		((unsigned int)nid) % kiblnd_data.kib_peer_hash_size;
 
-	return (&kiblnd_data.kib_peers [hash]);
+	return &kiblnd_data.kib_peers[hash];
 }
 
 static inline int
-kiblnd_peer_active (kib_peer_t *peer)
+kiblnd_peer_active(kib_peer_t *peer)
 {
 	/* Am I in the peer hash table? */
 	return (!list_empty(&peer->ibp_list));
 }
 
 static inline kib_conn_t *
-kiblnd_get_conn_locked (kib_peer_t *peer)
+kiblnd_get_conn_locked(kib_peer_t *peer)
 {
-	LASSERT (!list_empty(&peer->ibp_conns));
+	LASSERT(!list_empty(&peer->ibp_conns));
 
 	/* just return the first connection */
 	return list_entry(peer->ibp_conns.next, kib_conn_t, ibc_list);
@@ -752,7 +767,7 @@ kiblnd_send_keepalive(kib_conn_t *conn)
 static inline int
 kiblnd_need_noop(kib_conn_t *conn)
 {
-	LASSERT (conn->ibc_state >= IBLND_CONN_ESTABLISHED);
+	LASSERT(conn->ibc_state >= IBLND_CONN_ESTABLISHED);
 
 	if (conn->ibc_outstanding_credits <
 	    IBLND_CREDITS_HIGHWATER(conn->ibc_version) &&
@@ -789,7 +804,7 @@ kiblnd_abort_receives(kib_conn_t *conn)
 }
 
 static inline const char *
-kiblnd_queue2str (kib_conn_t *conn, struct list_head *q)
+kiblnd_queue2str(kib_conn_t *conn, struct list_head *q)
 {
 	if (q = &conn->ibc_tx_queue)
 		return "tx_queue";
@@ -816,43 +831,43 @@ kiblnd_queue2str (kib_conn_t *conn, struct list_head *q)
 #define IBLND_WID_MASK  3UL
 
 static inline __u64
-kiblnd_ptr2wreqid (void *ptr, int type)
+kiblnd_ptr2wreqid(void *ptr, int type)
 {
 	unsigned long lptr = (unsigned long)ptr;
 
-	LASSERT ((lptr & IBLND_WID_MASK) = 0);
-	LASSERT ((type & ~IBLND_WID_MASK) = 0);
+	LASSERT((lptr & IBLND_WID_MASK) = 0);
+	LASSERT((type & ~IBLND_WID_MASK) = 0);
 	return (__u64)(lptr | type);
 }
 
 static inline void *
-kiblnd_wreqid2ptr (__u64 wreqid)
+kiblnd_wreqid2ptr(__u64 wreqid)
 {
 	return (void *)(((unsigned long)wreqid) & ~IBLND_WID_MASK);
 }
 
 static inline int
-kiblnd_wreqid2type (__u64 wreqid)
+kiblnd_wreqid2type(__u64 wreqid)
 {
 	return (wreqid & IBLND_WID_MASK);
 }
 
 static inline void
-kiblnd_set_conn_state (kib_conn_t *conn, int state)
+kiblnd_set_conn_state(kib_conn_t *conn, int state)
 {
 	conn->ibc_state = state;
 	mb();
 }
 
 static inline void
-kiblnd_init_msg (kib_msg_t *msg, int type, int body_nob)
+kiblnd_init_msg(kib_msg_t *msg, int type, int body_nob)
 {
 	msg->ibm_type = type;
 	msg->ibm_nob  = offsetof(kib_msg_t, ibm_u) + body_nob;
 }
 
 static inline int
-kiblnd_rd_size (kib_rdma_desc_t *rd)
+kiblnd_rd_size(kib_rdma_desc_t *rd)
 {
 	int   i;
 	int   size;
@@ -888,7 +903,7 @@ kiblnd_rd_consume_frag(kib_rdma_desc_t *rd, int index, __u32 nob)
 		rd->rd_frags[index].rf_addr += nob;
 		rd->rd_frags[index].rf_nob  -= nob;
 	} else {
-		index ++;
+		index++;
 	}
 
 	return index;
@@ -897,8 +912,8 @@ kiblnd_rd_consume_frag(kib_rdma_desc_t *rd, int index, __u32 nob)
 static inline int
 kiblnd_rd_msg_size(kib_rdma_desc_t *rd, int msgtype, int n)
 {
-	LASSERT (msgtype = IBLND_MSG_GET_REQ ||
-		 msgtype = IBLND_MSG_PUT_ACK);
+	LASSERT(msgtype = IBLND_MSG_GET_REQ ||
+		msgtype = IBLND_MSG_PUT_ACK);
 
 	return msgtype = IBLND_MSG_GET_REQ ?
 	       offsetof(kib_get_msg_t, ibgm_rd.rd_frags[n]) :
@@ -980,67 +995,68 @@ int  kiblnd_fmr_pool_map(kib_fmr_poolset_t *fps, __u64 *pages,
 void kiblnd_fmr_pool_unmap(kib_fmr_t *fmr, int status);
 
 int  kiblnd_pmr_pool_map(kib_pmr_poolset_t *pps, kib_hca_dev_t *hdev,
-			 kib_rdma_desc_t *rd, __u64 *iova, kib_phys_mr_t **pp_pmr);
+			 kib_rdma_desc_t *rd, __u64 *iova,
+			 kib_phys_mr_t **pp_pmr);
 void kiblnd_pmr_pool_unmap(kib_phys_mr_t *pmr);
 
-int  kiblnd_startup (lnet_ni_t *ni);
-void kiblnd_shutdown (lnet_ni_t *ni);
-int  kiblnd_ctl (lnet_ni_t *ni, unsigned int cmd, void *arg);
-void kiblnd_query (struct lnet_ni *ni, lnet_nid_t nid, unsigned long *when);
+int  kiblnd_startup(lnet_ni_t *ni);
+void kiblnd_shutdown(lnet_ni_t *ni);
+int  kiblnd_ctl(lnet_ni_t *ni, unsigned int cmd, void *arg);
+void kiblnd_query(struct lnet_ni *ni, lnet_nid_t nid, unsigned long *when);
 
 int  kiblnd_tunables_init(void);
 void kiblnd_tunables_fini(void);
 
-int  kiblnd_connd (void *arg);
+int  kiblnd_connd(void *arg);
 int  kiblnd_scheduler(void *arg);
 int  kiblnd_thread_start(int (*fn)(void *arg), void *arg, char *name);
-int  kiblnd_failover_thread (void *arg);
+int  kiblnd_failover_thread(void *arg);
 
 int  kiblnd_alloc_pages(kib_pages_t **pp, int cpt, int npages);
-void kiblnd_free_pages (kib_pages_t *p);
+void kiblnd_free_pages(kib_pages_t *p);
 
 int  kiblnd_cm_callback(struct rdma_cm_id *cmid,
 			struct rdma_cm_event *event);
 int  kiblnd_translate_mtu(int value);
 
 int  kiblnd_dev_failover(kib_dev_t *dev);
-int  kiblnd_create_peer (lnet_ni_t *ni, kib_peer_t **peerp, lnet_nid_t nid);
-void kiblnd_destroy_peer (kib_peer_t *peer);
-void kiblnd_destroy_dev (kib_dev_t *dev);
-void kiblnd_unlink_peer_locked (kib_peer_t *peer);
-void kiblnd_peer_alive (kib_peer_t *peer);
-kib_peer_t *kiblnd_find_peer_locked (lnet_nid_t nid);
-void kiblnd_peer_connect_failed (kib_peer_t *peer, int active, int error);
-int  kiblnd_close_stale_conns_locked (kib_peer_t *peer,
-				      int version, __u64 incarnation);
-int  kiblnd_close_peer_conns_locked (kib_peer_t *peer, int why);
+int  kiblnd_create_peer(lnet_ni_t *ni, kib_peer_t **peerp, lnet_nid_t nid);
+void kiblnd_destroy_peer(kib_peer_t *peer);
+void kiblnd_destroy_dev(kib_dev_t *dev);
+void kiblnd_unlink_peer_locked(kib_peer_t *peer);
+void kiblnd_peer_alive(kib_peer_t *peer);
+kib_peer_t *kiblnd_find_peer_locked(lnet_nid_t nid);
+void kiblnd_peer_connect_failed(kib_peer_t *peer, int active, int error);
+int  kiblnd_close_stale_conns_locked(kib_peer_t *peer,
+				     int version, __u64 incarnation);
+int  kiblnd_close_peer_conns_locked(kib_peer_t *peer, int why);
 
 void kiblnd_connreq_done(kib_conn_t *conn, int status);
-kib_conn_t *kiblnd_create_conn (kib_peer_t *peer, struct rdma_cm_id *cmid,
-				int state, int version);
-void kiblnd_destroy_conn (kib_conn_t *conn);
-void kiblnd_close_conn (kib_conn_t *conn, int error);
-void kiblnd_close_conn_locked (kib_conn_t *conn, int error);
-
-int  kiblnd_init_rdma (kib_conn_t *conn, kib_tx_t *tx, int type,
-		       int nob, kib_rdma_desc_t *dstrd, __u64 dstcookie);
-
-void kiblnd_launch_tx (lnet_ni_t *ni, kib_tx_t *tx, lnet_nid_t nid);
-void kiblnd_queue_tx_locked (kib_tx_t *tx, kib_conn_t *conn);
-void kiblnd_queue_tx (kib_tx_t *tx, kib_conn_t *conn);
-void kiblnd_init_tx_msg (lnet_ni_t *ni, kib_tx_t *tx, int type, int body_nob);
-void kiblnd_txlist_done (lnet_ni_t *ni, struct list_head *txlist,
+kib_conn_t *kiblnd_create_conn(kib_peer_t *peer, struct rdma_cm_id *cmid,
+			       int state, int version);
+void kiblnd_destroy_conn(kib_conn_t *conn);
+void kiblnd_close_conn(kib_conn_t *conn, int error);
+void kiblnd_close_conn_locked(kib_conn_t *conn, int error);
+
+int  kiblnd_init_rdma(kib_conn_t *conn, kib_tx_t *tx, int type,
+		      int nob, kib_rdma_desc_t *dstrd, __u64 dstcookie);
+
+void kiblnd_launch_tx(lnet_ni_t *ni, kib_tx_t *tx, lnet_nid_t nid);
+void kiblnd_queue_tx_locked(kib_tx_t *tx, kib_conn_t *conn);
+void kiblnd_queue_tx(kib_tx_t *tx, kib_conn_t *conn);
+void kiblnd_init_tx_msg(lnet_ni_t *ni, kib_tx_t *tx, int type, int body_nob);
+void kiblnd_txlist_done(lnet_ni_t *ni, struct list_head *txlist,
 			 int status);
-void kiblnd_check_sends (kib_conn_t *conn);
+void kiblnd_check_sends(kib_conn_t *conn);
 
 void kiblnd_qp_event(struct ib_event *event, void *arg);
 void kiblnd_cq_event(struct ib_event *event, void *arg);
 void kiblnd_cq_completion(struct ib_cq *cq, void *arg);
 
-void kiblnd_pack_msg (lnet_ni_t *ni, kib_msg_t *msg, int version,
+void kiblnd_pack_msg(lnet_ni_t *ni, kib_msg_t *msg, int version,
 		      int credits, lnet_nid_t dstnid, __u64 dststamp);
 int  kiblnd_unpack_msg(kib_msg_t *msg, int nob);
-int  kiblnd_post_rx (kib_rx_t *rx, int credit);
+int  kiblnd_post_rx(kib_rx_t *rx, int credit);
 
 int  kiblnd_send(lnet_ni_t *ni, void *private, lnet_msg_t *lntmsg);
 int  kiblnd_recv(lnet_ni_t *ni, void *private, lnet_msg_t *lntmsg, int delayed,
diff --git a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c
index 477aa8b..250c5fa 100644
--- a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c
+++ b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c
@@ -50,9 +50,9 @@ kiblnd_tx_done(lnet_ni_t *ni, kib_tx_t *tx)
 
 	LASSERT(net != NULL);
 	LASSERT(!in_interrupt());
-	LASSERT(!tx->tx_queued);	       /* mustn't be queued for sending */
-	LASSERT(tx->tx_sending = 0);	  /* mustn't be awaiting sent callback */
-	LASSERT(!tx->tx_waiting);	      /* mustn't be awaiting peer response */
+	LASSERT(!tx->tx_queued);      /* mustn't be queued for sending */
+	LASSERT(tx->tx_sending = 0); /* mustn't be awaiting sent callback */
+	LASSERT(!tx->tx_waiting);     /* mustn't be awaiting peer response */
 	LASSERT(tx->tx_pool != NULL);
 
 	kiblnd_unmap_tx(ni, tx);
@@ -410,7 +410,8 @@ kiblnd_handle_rx(kib_rx_t *rx)
 		tx->tx_nwrq = 0;		/* overwrite PUT_REQ */
 
 		rc2 = kiblnd_init_rdma(conn, tx, IBLND_MSG_PUT_DONE,
-				       kiblnd_rd_size(&msg->ibm_u.putack.ibpam_rd),
+				       kiblnd_rd_size(
+					       &msg->ibm_u.putack.ibpam_rd),
 				       &msg->ibm_u.putack.ibpam_rd,
 				       msg->ibm_u.putack.ibpam_dst_cookie);
 		if (rc2 < 0)
@@ -1003,7 +1004,8 @@ kiblnd_tx_complete(kib_tx_t *tx, int status)
 
 	if (failed) {
 		if (conn->ibc_state = IBLND_CONN_ESTABLISHED)
-			CNETERR("Tx -> %s cookie %#llx sending %d waiting %d: failed %d\n",
+			CNETERR(
+				"Tx -> %s cookie %#llx sending %d waiting %d: failed %d\n",
 				libcfs_nid2str(conn->ibc_peer->ibp_nid),
 				tx->tx_cookie, tx->tx_sending, tx->tx_waiting,
 				status);
@@ -1114,7 +1116,8 @@ kiblnd_init_rdma(kib_conn_t *conn, kib_tx_t *tx, int type,
 		}
 
 		if (tx->tx_nwrq = IBLND_RDMA_FRAGS(conn->ibc_version)) {
-			CERROR("RDMA too fragmented for %s (%d): %d/%d src %d/%d dst frags\n",
+			CERROR(
+			       "RDMA too fragmented for %s (%d): %d/%d src %d/%d dst frags\n",
 			       libcfs_nid2str(conn->ibc_peer->ibp_nid),
 			       IBLND_RDMA_FRAGS(conn->ibc_version),
 			       srcidx, srcrd->rd_nfrags,
@@ -1154,7 +1157,7 @@ kiblnd_init_rdma(kib_conn_t *conn, kib_tx_t *tx, int type,
 		sge++;
 	}
 
-	if (rc < 0)			     /* no RDMA if completing with failure */
+	if (rc < 0) /* no RDMA if completing with failure */
 		tx->tx_nwrq = 0;
 
 	ibmsg->ibm_u.completion.ibcm_status = rc;
@@ -1170,8 +1173,8 @@ kiblnd_queue_tx_locked(kib_tx_t *tx, kib_conn_t *conn)
 {
 	struct list_head *q;
 
-	LASSERT(tx->tx_nwrq > 0);	      /* work items set up */
-	LASSERT(!tx->tx_queued);	       /* not queued for sending already */
+	LASSERT(tx->tx_nwrq > 0); /* work items set up */
+	LASSERT(!tx->tx_queued);  /* not queued for sending already */
 	LASSERT(conn->ibc_state >= IBLND_CONN_ESTABLISHED);
 
 	tx->tx_queued = 1;
@@ -1343,8 +1346,10 @@ kiblnd_launch_tx(lnet_ni_t *ni, kib_tx_t *tx, lnet_nid_t nid)
 	/* If I get here, I've committed to send, so I complete the tx with
 	 * failure on any problems */
 
-	LASSERT(tx = NULL || tx->tx_conn = NULL); /* only set when assigned a conn */
-	LASSERT(tx = NULL || tx->tx_nwrq > 0);     /* work items have been set up */
+	LASSERT(tx = NULL || tx->tx_conn = NULL); /* only set when assigned
+						     * a conn */
+	LASSERT(tx = NULL || tx->tx_nwrq > 0);     /* work items have been set
+						     * up */
 
 	/* First time, just use a read lock since I expect to find my peer
 	 * connected */
@@ -1496,7 +1501,9 @@ kiblnd_send(lnet_ni_t *ni, void *private, lnet_msg_t *lntmsg)
 			break;		  /* send IMMEDIATE */
 
 		/* is the REPLY message too small for RDMA? */
-		nob = offsetof(kib_msg_t, ibm_u.immediate.ibim_payload[lntmsg->msg_md->md_length]);
+		nob = offsetof(kib_msg_t,
+			       ibm_u.immediate.ibim_payload[
+				       lntmsg->msg_md->md_length]);
 		if (nob <= IBLND_MSG_SIZE)
 			break;		  /* send IMMEDIATE */
 
@@ -1542,15 +1549,17 @@ kiblnd_send(lnet_ni_t *ni, void *private, lnet_msg_t *lntmsg)
 			return -EIO;
 		}
 
-		tx->tx_lntmsg[0] = lntmsg;      /* finalise lntmsg[0,1] on completion */
-		tx->tx_waiting = 1;	     /* waiting for GET_DONE */
+		tx->tx_lntmsg[0] = lntmsg; /* finalise lntmsg[0,1] on
+					    * completion */
+		tx->tx_waiting = 1; /* waiting for GET_DONE */
 		kiblnd_launch_tx(ni, tx, target.nid);
 		return 0;
 
 	case LNET_MSG_REPLY:
 	case LNET_MSG_PUT:
 		/* Is the payload small enough not to need RDMA? */
-		nob = offsetof(kib_msg_t, ibm_u.immediate.ibim_payload[payload_nob]);
+		nob = offsetof(kib_msg_t,
+			       ibm_u.immediate.ibim_payload[payload_nob]);
 		if (nob <= IBLND_MSG_SIZE)
 			break;		  /* send IMMEDIATE */
 
@@ -1580,10 +1589,11 @@ kiblnd_send(lnet_ni_t *ni, void *private, lnet_msg_t *lntmsg)
 		ibmsg = tx->tx_msg;
 		ibmsg->ibm_u.putreq.ibprm_hdr = *hdr;
 		ibmsg->ibm_u.putreq.ibprm_cookie = tx->tx_cookie;
-		kiblnd_init_tx_msg(ni, tx, IBLND_MSG_PUT_REQ, sizeof(kib_putreq_msg_t));
+		kiblnd_init_tx_msg(ni, tx, IBLND_MSG_PUT_REQ,
+				   sizeof(kib_putreq_msg_t));
 
-		tx->tx_lntmsg[0] = lntmsg;      /* finalise lntmsg on completion */
-		tx->tx_waiting = 1;	     /* waiting for PUT_{ACK,NAK} */
+		tx->tx_lntmsg[0] = lntmsg; /* finalise lntmsg on completion */
+		tx->tx_waiting = 1; /* waiting for PUT_{ACK,NAK} */
 		kiblnd_launch_tx(ni, tx, target.nid);
 		return 0;
 	}
@@ -1605,19 +1615,21 @@ kiblnd_send(lnet_ni_t *ni, void *private, lnet_msg_t *lntmsg)
 
 	if (payload_kiov != NULL)
 		lnet_copy_kiov2flat(IBLND_MSG_SIZE, ibmsg,
-				    offsetof(kib_msg_t, ibm_u.immediate.ibim_payload),
+				    offsetof(kib_msg_t,
+					     ibm_u.immediate.ibim_payload),
 				    payload_niov, payload_kiov,
 				    payload_offset, payload_nob);
 	else
 		lnet_copy_iov2flat(IBLND_MSG_SIZE, ibmsg,
-				   offsetof(kib_msg_t, ibm_u.immediate.ibim_payload),
+				   offsetof(kib_msg_t,
+					    ibm_u.immediate.ibim_payload),
 				   payload_niov, payload_iov,
 				   payload_offset, payload_nob);
 
 	nob = offsetof(kib_immediate_msg_t, ibim_payload[payload_nob]);
 	kiblnd_init_tx_msg(ni, tx, IBLND_MSG_IMMEDIATE, nob);
 
-	tx->tx_lntmsg[0] = lntmsg;	      /* finalise lntmsg on completion */
+	tx->tx_lntmsg[0] = lntmsg; /* finalise lntmsg on completion */
 	kiblnd_launch_tx(ni, tx, target.nid);
 	return 0;
 }
@@ -1711,7 +1723,8 @@ kiblnd_recv(lnet_ni_t *ni, void *private, lnet_msg_t *lntmsg, int delayed,
 		nob = offsetof(kib_msg_t, ibm_u.immediate.ibim_payload[rlen]);
 		if (nob > rx->rx_nob) {
 			CERROR("Immediate message from %s too big: %d(%d)\n",
-				libcfs_nid2str(rxmsg->ibm_u.immediate.ibim_hdr.src_nid),
+				libcfs_nid2str(
+				      rxmsg->ibm_u.immediate.ibim_hdr.src_nid),
 				nob, rx->rx_nob);
 			rc = -EPROTO;
 			break;
@@ -1719,22 +1732,25 @@ kiblnd_recv(lnet_ni_t *ni, void *private, lnet_msg_t *lntmsg, int delayed,
 
 		if (kiov != NULL)
 			lnet_copy_flat2kiov(niov, kiov, offset,
-					    IBLND_MSG_SIZE, rxmsg,
-					    offsetof(kib_msg_t, ibm_u.immediate.ibim_payload),
-					    mlen);
+				    IBLND_MSG_SIZE, rxmsg,
+				    offsetof(kib_msg_t,
+					     ibm_u.immediate.ibim_payload),
+				    mlen);
 		else
 			lnet_copy_flat2iov(niov, iov, offset,
-					   IBLND_MSG_SIZE, rxmsg,
-					   offsetof(kib_msg_t, ibm_u.immediate.ibim_payload),
-					   mlen);
+				   IBLND_MSG_SIZE, rxmsg,
+				   offsetof(kib_msg_t,
+					    ibm_u.immediate.ibim_payload),
+				   mlen);
 		lnet_finalize(ni, lntmsg, 0);
 		break;
 
 	case IBLND_MSG_PUT_REQ:
 		if (mlen = 0) {
 			lnet_finalize(ni, lntmsg, 0);
-			kiblnd_send_completion(rx->rx_conn, IBLND_MSG_PUT_NAK, 0,
-					       rxmsg->ibm_u.putreq.ibprm_cookie);
+			kiblnd_send_completion(rx->rx_conn, IBLND_MSG_PUT_NAK,
+					0,
+					rxmsg->ibm_u.putreq.ibprm_cookie);
 			break;
 		}
 
@@ -1761,19 +1777,22 @@ kiblnd_recv(lnet_ni_t *ni, void *private, lnet_msg_t *lntmsg, int delayed,
 			       libcfs_nid2str(conn->ibc_peer->ibp_nid), rc);
 			kiblnd_tx_done(ni, tx);
 			/* tell peer it's over */
-			kiblnd_send_completion(rx->rx_conn, IBLND_MSG_PUT_NAK, rc,
-					       rxmsg->ibm_u.putreq.ibprm_cookie);
+			kiblnd_send_completion(rx->rx_conn, IBLND_MSG_PUT_NAK,
+					rc,
+					rxmsg->ibm_u.putreq.ibprm_cookie);
 			break;
 		}
 
-		nob = offsetof(kib_putack_msg_t, ibpam_rd.rd_frags[tx->tx_nfrags]);
-		txmsg->ibm_u.putack.ibpam_src_cookie = rxmsg->ibm_u.putreq.ibprm_cookie;
+		nob = offsetof(kib_putack_msg_t,
+			       ibpam_rd.rd_frags[tx->tx_nfrags]);
+		txmsg->ibm_u.putack.ibpam_src_cookie +				rxmsg->ibm_u.putreq.ibprm_cookie;
 		txmsg->ibm_u.putack.ibpam_dst_cookie = tx->tx_cookie;
 
 		kiblnd_init_tx_msg(ni, tx, IBLND_MSG_PUT_ACK, nob);
 
-		tx->tx_lntmsg[0] = lntmsg;      /* finalise lntmsg on completion */
-		tx->tx_waiting = 1;	     /* waiting for PUT_DONE */
+		tx->tx_lntmsg[0] = lntmsg; /* finalise lntmsg on completion */
+		tx->tx_waiting = 1; /* waiting for PUT_DONE */
 		kiblnd_queue_tx(tx, conn);
 
 		/* reposted buffer reserved for PUT_DONE */
@@ -1883,8 +1902,10 @@ kiblnd_close_conn_locked(kib_conn_t *conn, int error)
 		       libcfs_nid2str(peer->ibp_nid), error,
 		       list_empty(&conn->ibc_tx_queue) ? "" : "(sending)",
 		       list_empty(&conn->ibc_tx_noops) ? "" : "(sending_noops)",
-		       list_empty(&conn->ibc_tx_queue_rsrvd) ? "" : "(sending_rsrvd)",
-		       list_empty(&conn->ibc_tx_queue_nocred) ? "" : "(sending_nocred)",
+		       list_empty(&conn->ibc_tx_queue_rsrvd) ? "" :
+			       "(sending_rsrvd)",
+		       list_empty(&conn->ibc_tx_queue_nocred) ? "" :
+			       "(sending_nocred)",
 		       list_empty(&conn->ibc_active_txs) ? "" : "(waiting)");
 	}
 
@@ -2191,6 +2212,7 @@ kiblnd_passive_connect(struct rdma_cm_id *cmid, void *priv, int priv_nob)
 	unsigned long flags;
 	int rc;
 	struct sockaddr_in *peer_addr;
+
 	LASSERT(!in_interrupt());
 
 	/* cmid inherits 'context' from the corresponding listener id */
@@ -2206,6 +2228,7 @@ kiblnd_passive_connect(struct rdma_cm_id *cmid, void *priv, int priv_nob)
 	if (*kiblnd_tunables.kib_require_priv_port &&
 	    ntohs(peer_addr->sin_port) >= PROT_SOCK) {
 		__u32 ip = ntohl(peer_addr->sin_addr.s_addr);
+
 		CERROR("Peer's port (%pI4h:%hu) is not privileged\n",
 		       &ip, ntohs(peer_addr->sin_port));
 		goto failed;
@@ -2280,8 +2303,10 @@ kiblnd_passive_connect(struct rdma_cm_id *cmid, void *priv, int priv_nob)
 
 	if (reqmsg->ibm_u.connparams.ibcp_queue_depth ! 	    IBLND_MSG_QUEUE_SIZE(version)) {
-		CERROR("Can't accept %s: incompatible queue depth %d (%d wanted)\n",
-		       libcfs_nid2str(nid), reqmsg->ibm_u.connparams.ibcp_queue_depth,
+		CERROR(
+		       "Can't accept %s: incompatible queue depth %d (%d wanted)\n",
+		       libcfs_nid2str(nid),
+		       reqmsg->ibm_u.connparams.ibcp_queue_depth,
 		       IBLND_MSG_QUEUE_SIZE(version));
 
 		if (version = IBLND_MSG_VERSION)
@@ -2292,7 +2317,8 @@ kiblnd_passive_connect(struct rdma_cm_id *cmid, void *priv, int priv_nob)
 
 	if (reqmsg->ibm_u.connparams.ibcp_max_frags ! 	    IBLND_RDMA_FRAGS(version)) {
-		CERROR("Can't accept %s(version %x): incompatible max_frags %d (%d wanted)\n",
+		CERROR(
+		       "Can't accept %s(version %x): incompatible max_frags %d (%d wanted)\n",
 		       libcfs_nid2str(nid), version,
 		       reqmsg->ibm_u.connparams.ibcp_max_frags,
 		       IBLND_RDMA_FRAGS(version));
@@ -2394,17 +2420,19 @@ kiblnd_passive_connect(struct rdma_cm_id *cmid, void *priv, int priv_nob)
 	conn->ibc_incarnation      = reqmsg->ibm_srcstamp;
 	conn->ibc_credits          = IBLND_MSG_QUEUE_SIZE(version);
 	conn->ibc_reserved_credits = IBLND_MSG_QUEUE_SIZE(version);
-	LASSERT(conn->ibc_credits + conn->ibc_reserved_credits + IBLND_OOB_MSGS(version)
-		 <= IBLND_RX_MSGS(version));
+	LASSERT(conn->ibc_credits + conn->ibc_reserved_credits +
+		IBLND_OOB_MSGS(version)
+		<= IBLND_RX_MSGS(version));
 
 	ackmsg = &conn->ibc_connvars->cv_msg;
 	memset(ackmsg, 0, sizeof(*ackmsg));
 
 	kiblnd_init_msg(ackmsg, IBLND_MSG_CONNACK,
 			sizeof(ackmsg->ibm_u.connparams));
-	ackmsg->ibm_u.connparams.ibcp_queue_depth  = IBLND_MSG_QUEUE_SIZE(version);
+	ackmsg->ibm_u.connparams.ibcp_queue_depth  +						IBLND_MSG_QUEUE_SIZE(version);
 	ackmsg->ibm_u.connparams.ibcp_max_msg_size = IBLND_MSG_SIZE;
-	ackmsg->ibm_u.connparams.ibcp_max_frags    = IBLND_RDMA_FRAGS(version);
+	ackmsg->ibm_u.connparams.ibcp_max_frags = IBLND_RDMA_FRAGS(version);
 
 	kiblnd_pack_msg(ni, ackmsg, version, 0, nid, reqmsg->ibm_srcstamp);
 
@@ -2498,10 +2526,12 @@ kiblnd_reconnect(kib_conn_t *conn, int version,
 		break;
 	}
 
-	CNETERR("%s: retrying (%s), %x, %x, queue_dep: %d, max_frag: %d, msg_size: %d\n",
+	CNETERR(
+		"%s: retrying (%s), %x, %x, queue_dep: %d, max_frag: %d, msg_size: %d\n",
 		libcfs_nid2str(peer->ibp_nid),
 		reason, IBLND_MSG_VERSION, version,
-		cp != NULL ? cp->ibcp_queue_depth  : IBLND_MSG_QUEUE_SIZE(version),
+		cp != NULL ? cp->ibcp_queue_depth  :
+			     IBLND_MSG_QUEUE_SIZE(version),
 		cp != NULL ? cp->ibcp_max_frags    : IBLND_RDMA_FRAGS(version),
 		cp != NULL ? cp->ibcp_max_msg_size : IBLND_MSG_SIZE);
 
@@ -2573,14 +2603,16 @@ kiblnd_rejected(kib_conn_t *conn, int reason, void *priv, int priv_nob)
 
 			if (rej->ibr_magic != IBLND_MSG_MAGIC &&
 			    rej->ibr_magic != LNET_PROTO_MAGIC) {
-				CERROR("%s rejected: consumer defined fatal error\n",
+				CERROR(
+				       "%s rejected: consumer defined fatal error\n",
 				       libcfs_nid2str(peer->ibp_nid));
 				break;
 			}
 
 			if (rej->ibr_version != IBLND_MSG_VERSION &&
 			    rej->ibr_version != IBLND_MSG_VERSION_1) {
-				CERROR("%s rejected: o2iblnd version %x error\n",
+				CERROR(
+				       "%s rejected: o2iblnd version %x error\n",
 				       libcfs_nid2str(peer->ibp_nid),
 				       rej->ibr_version);
 				break;
@@ -2588,11 +2620,14 @@ kiblnd_rejected(kib_conn_t *conn, int reason, void *priv, int priv_nob)
 
 			if (rej->ibr_why     = IBLND_REJECT_FATAL &&
 			    rej->ibr_version = IBLND_MSG_VERSION_1) {
-				CDEBUG(D_NET, "rejected by old version peer %s: %x\n",
-				       libcfs_nid2str(peer->ibp_nid), rej->ibr_version);
+				CDEBUG(D_NET,
+				       "rejected by old version peer %s: %x\n",
+				       libcfs_nid2str(peer->ibp_nid),
+				       rej->ibr_version);
 
 				if (conn->ibc_version != IBLND_MSG_VERSION_1)
-					rej->ibr_why = IBLND_REJECT_CONN_UNCOMPAT;
+					rej->ibr_why +						IBLND_REJECT_CONN_UNCOMPAT;
 			}
 
 			switch (rej->ibr_why) {
@@ -2604,7 +2639,8 @@ kiblnd_rejected(kib_conn_t *conn, int reason, void *priv, int priv_nob)
 				break;
 
 			case IBLND_REJECT_MSG_QUEUE_SIZE:
-				CERROR("%s rejected: incompatible message queue depth %d, %d\n",
+				CERROR(
+				       "%s rejected: incompatible message queue depth %d, %d\n",
 				       libcfs_nid2str(peer->ibp_nid),
 				       cp != NULL ? cp->ibcp_queue_depth :
 				       IBLND_MSG_QUEUE_SIZE(rej->ibr_version),
@@ -2612,7 +2648,8 @@ kiblnd_rejected(kib_conn_t *conn, int reason, void *priv, int priv_nob)
 				break;
 
 			case IBLND_REJECT_RDMA_FRAGS:
-				CERROR("%s rejected: incompatible # of RDMA fragments %d, %d\n",
+				CERROR(
+				       "%s rejected: incompatible # of RDMA fragments %d, %d\n",
 				       libcfs_nid2str(peer->ibp_nid),
 				       cp != NULL ? cp->ibcp_max_frags :
 				       IBLND_RDMA_FRAGS(rej->ibr_version),
@@ -2674,7 +2711,8 @@ kiblnd_check_connreply(kib_conn_t *conn, void *priv, int priv_nob)
 	}
 
 	if (ver != msg->ibm_version) {
-		CERROR("%s replied version %x is different with requested version %x\n",
+		CERROR(
+		       "%s replied version %x is different with requested version %x\n",
 		       libcfs_nid2str(peer->ibp_nid), msg->ibm_version, ver);
 		rc = -EPROTO;
 		goto failed;
@@ -2718,7 +2756,8 @@ kiblnd_check_connreply(kib_conn_t *conn, void *priv, int priv_nob)
 	read_unlock_irqrestore(&kiblnd_data.kib_global_lock, flags);
 
 	if (rc != 0) {
-		CERROR("Bad connection reply from %s, rc = %d, version: %x max_frags: %d\n",
+		CERROR(
+		       "Bad connection reply from %s, rc = %d, version: %x max_frags: %d\n",
 		       libcfs_nid2str(peer->ibp_nid), rc,
 		       msg->ibm_version, msg->ibm_u.connparams.ibcp_max_frags);
 		goto failed;
@@ -2727,7 +2766,8 @@ kiblnd_check_connreply(kib_conn_t *conn, void *priv, int priv_nob)
 	conn->ibc_incarnation = msg->ibm_srcstamp;
 	conn->ibc_credits  	conn->ibc_reserved_credits = IBLND_MSG_QUEUE_SIZE(ver);
-	LASSERT(conn->ibc_credits + conn->ibc_reserved_credits + IBLND_OOB_MSGS(ver)
+	LASSERT(conn->ibc_credits + conn->ibc_reserved_credits +
+		IBLND_OOB_MSGS(ver)
 		 <= IBLND_RX_MSGS(ver));
 
 	kiblnd_connreq_done(conn, 0);
@@ -2764,7 +2804,8 @@ kiblnd_active_connect(struct rdma_cm_id *cmid)
 
 	read_unlock_irqrestore(&kiblnd_data.kib_global_lock, flags);
 
-	conn = kiblnd_create_conn(peer, cmid, IBLND_CONN_ACTIVE_CONNECT, version);
+	conn = kiblnd_create_conn(peer, cmid, IBLND_CONN_ACTIVE_CONNECT,
+				  version);
 	if (conn = NULL) {
 		kiblnd_peer_connect_failed(peer, 1, -ENOMEM);
 		kiblnd_peer_decref(peer); /* lose cmid's ref */
@@ -3054,7 +3095,8 @@ kiblnd_check_conns(int idx)
 			}
 
 			if (timedout) {
-				CERROR("Timed out RDMA with %s (%lu): c: %u, oc: %u, rc: %u\n",
+				CERROR(
+				       "Timed out RDMA with %s (%lu): c: %u, oc: %u, rc: %u\n",
 				       libcfs_nid2str(peer->ibp_nid),
 				       cfs_duration_sec(cfs_time_current() -
 							peer->ibp_last_alive),
@@ -3133,8 +3175,7 @@ kiblnd_connd(void *arg)
 		dropped_lock = 0;
 
 		if (!list_empty(&kiblnd_data.kib_connd_zombies)) {
-			conn = list_entry(kiblnd_data. \
-					      kib_connd_zombies.next,
+			conn = list_entry(kiblnd_data.kib_connd_zombies.next,
 					      kib_conn_t, ibc_list);
 			list_del(&conn->ibc_list);
 
@@ -3169,7 +3210,8 @@ kiblnd_connd(void *arg)
 			const int p = 1;
 			int chunk = kiblnd_data.kib_peer_hash_size;
 
-			spin_unlock_irqrestore(&kiblnd_data.kib_connd_lock, flags);
+			spin_unlock_irqrestore(&kiblnd_data.kib_connd_lock,
+					       flags);
 			dropped_lock = 1;
 
 			/* Time to check for RDMA timeouts on a few more
@@ -3325,7 +3367,8 @@ kiblnd_scheduler(void *arg)
 
 	rc = cfs_cpt_bind(lnet_cpt_table(), sched->ibs_cpt);
 	if (rc != 0) {
-		CWARN("Failed to bind on CPT %d, please verify whether all CPUs are healthy and reload modules if necessary, otherwise your system might under risk of low performance\n",
+		CWARN(
+		      "Failed to bind on CPT %d, please verify whether all CPUs are healthy and reload modules if necessary, otherwise your system might under risk of low performance\n",
 		      sched->ibs_cpt);
 	}
 
@@ -3358,8 +3401,11 @@ kiblnd_scheduler(void *arg)
 				rc = ib_req_notify_cq(conn->ibc_cq,
 						      IB_CQ_NEXT_COMP);
 				if (rc < 0) {
-					CWARN("%s: ib_req_notify_cq failed: %d, closing connection\n",
-					      libcfs_nid2str(conn->ibc_peer->ibp_nid), rc);
+					CWARN(
+					      "%s: ib_req_notify_cq failed: %d, closing connection\n",
+					      libcfs_nid2str(
+						      conn->ibc_peer->ibp_nid),
+					      rc);
 					kiblnd_close_conn(conn, -EIO);
 					kiblnd_conn_decref(conn);
 					spin_lock_irqsave(&sched->ibs_lock,
@@ -3371,7 +3417,8 @@ kiblnd_scheduler(void *arg)
 			}
 
 			if (rc < 0) {
-				CWARN("%s: ib_poll_cq failed: %d, closing connection\n",
+				CWARN(
+				      "%s: ib_poll_cq failed: %d, closing connection\n",
 				      libcfs_nid2str(conn->ibc_peer->ibp_nid),
 				      rc);
 				kiblnd_close_conn(conn, -EIO);
@@ -3403,7 +3450,7 @@ kiblnd_scheduler(void *arg)
 				spin_lock_irqsave(&sched->ibs_lock, flags);
 			}
 
-			kiblnd_conn_decref(conn); /* ...drop my ref from above */
+			kiblnd_conn_decref(conn);/* ...drop my ref from above */
 			did_something = 1;
 		}
 
@@ -3474,7 +3521,8 @@ kiblnd_failover_thread(void *arg)
 
 			/* failed to failover, retry later */
 			dev->ibd_next_failover -				cfs_time_shift(min(dev->ibd_failed_failover, 10));
+				cfs_time_shift(min(dev->ibd_failed_failover,
+						   10));
 			if (kiblnd_dev_can_failover(dev)) {
 				list_add_tail(&dev->ibd_fail_list,
 					      &kiblnd_data.kib_failed_devs);
diff --git a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_modparams.c b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_modparams.c
index b0e0036..90f32ca 100644
--- a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_modparams.c
+++ b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_modparams.c
@@ -192,38 +192,55 @@ kiblnd_tunables_init(void)
 		*kiblnd_tunables.kib_peertxcredits = IBLND_CREDITS_MAX;
 
 	if (*kiblnd_tunables.kib_peertxcredits > *kiblnd_tunables.kib_credits)
-		*kiblnd_tunables.kib_peertxcredits = *kiblnd_tunables.kib_credits;
+		*kiblnd_tunables.kib_peertxcredits +				*kiblnd_tunables.kib_credits;
 
-	if (*kiblnd_tunables.kib_peercredits_hiw < *kiblnd_tunables.kib_peertxcredits / 2)
-		*kiblnd_tunables.kib_peercredits_hiw = *kiblnd_tunables.kib_peertxcredits / 2;
+	if (*kiblnd_tunables.kib_peercredits_hiw <
+	    *kiblnd_tunables.kib_peertxcredits / 2)
+		*kiblnd_tunables.kib_peercredits_hiw +				*kiblnd_tunables.kib_peertxcredits / 2;
 
-	if (*kiblnd_tunables.kib_peercredits_hiw >= *kiblnd_tunables.kib_peertxcredits)
-		*kiblnd_tunables.kib_peercredits_hiw = *kiblnd_tunables.kib_peertxcredits - 1;
+	if (*kiblnd_tunables.kib_peercredits_hiw >+	    *kiblnd_tunables.kib_peertxcredits)
+		*kiblnd_tunables.kib_peercredits_hiw +				*kiblnd_tunables.kib_peertxcredits - 1;
 
 	if (*kiblnd_tunables.kib_map_on_demand < 0 ||
 	    *kiblnd_tunables.kib_map_on_demand > IBLND_MAX_RDMA_FRAGS)
-		*kiblnd_tunables.kib_map_on_demand = 0; /* disable map-on-demand */
+		/* disable map-on-demand */
+		*kiblnd_tunables.kib_map_on_demand = 0;
 
 	if (*kiblnd_tunables.kib_map_on_demand = 1)
-		*kiblnd_tunables.kib_map_on_demand = 2; /* don't make sense to create map if only one fragment */
+		/* don't make sense to create map if only one fragment */
+		*kiblnd_tunables.kib_map_on_demand = 2;
 
 	if (*kiblnd_tunables.kib_concurrent_sends = 0) {
 		if (*kiblnd_tunables.kib_map_on_demand > 0 &&
-		    *kiblnd_tunables.kib_map_on_demand <= IBLND_MAX_RDMA_FRAGS / 8)
-			*kiblnd_tunables.kib_concurrent_sends = (*kiblnd_tunables.kib_peertxcredits) * 2;
+		    *kiblnd_tunables.kib_map_on_demand <+		    IBLND_MAX_RDMA_FRAGS / 8)
+			*kiblnd_tunables.kib_concurrent_sends +				(*kiblnd_tunables.kib_peertxcredits) * 2;
 		else
-			*kiblnd_tunables.kib_concurrent_sends = (*kiblnd_tunables.kib_peertxcredits);
+			*kiblnd_tunables.kib_concurrent_sends +				(*kiblnd_tunables.kib_peertxcredits);
 	}
 
-	if (*kiblnd_tunables.kib_concurrent_sends > *kiblnd_tunables.kib_peertxcredits * 2)
-		*kiblnd_tunables.kib_concurrent_sends = *kiblnd_tunables.kib_peertxcredits * 2;
-
-	if (*kiblnd_tunables.kib_concurrent_sends < *kiblnd_tunables.kib_peertxcredits / 2)
-		*kiblnd_tunables.kib_concurrent_sends = *kiblnd_tunables.kib_peertxcredits / 2;
-
-	if (*kiblnd_tunables.kib_concurrent_sends < *kiblnd_tunables.kib_peertxcredits) {
-		CWARN("Concurrent sends %d is lower than message queue size: %d, performance may drop slightly.\n",
-		      *kiblnd_tunables.kib_concurrent_sends, *kiblnd_tunables.kib_peertxcredits);
+	if (*kiblnd_tunables.kib_concurrent_sends >
+	    *kiblnd_tunables.kib_peertxcredits * 2)
+		*kiblnd_tunables.kib_concurrent_sends +				*kiblnd_tunables.kib_peertxcredits * 2;
+
+	if (*kiblnd_tunables.kib_concurrent_sends <
+	    *kiblnd_tunables.kib_peertxcredits / 2)
+		*kiblnd_tunables.kib_concurrent_sends +				*kiblnd_tunables.kib_peertxcredits / 2;
+
+	if (*kiblnd_tunables.kib_concurrent_sends <
+	    *kiblnd_tunables.kib_peertxcredits) {
+		CWARN(
+		      "Concurrent sends %d is lower than message queue size: %d, performance may drop slightly.\n",
+		      *kiblnd_tunables.kib_concurrent_sends,
+		      *kiblnd_tunables.kib_peertxcredits);
 	}
 
 	return 0;
-- 
1.7.1

