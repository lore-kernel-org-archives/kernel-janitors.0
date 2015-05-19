From: Mike Shuey <shuey@purdue.edu>
Date: Tue, 19 May 2015 14:14:36 +0000
Subject: [PATCH v3 5/8] staging: lustre: lnet: o2iblnd: code cleanup - align whitespace
Message-Id: <1432044879-28923-6-git-send-email-shuey@purdue.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432044879-28923-1-git-send-email-shuey@purdue.edu>
In-Reply-To: <1432044879-28923-1-git-send-email-shuey@purdue.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oleg.drokin@intel.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, Mike Shuey <shuey@purdue.edu>

Unify variable declarations to use a single whitespace.  Also line up
declarations and comments in o2iblnd.h.

Signed-off-by: Mike Shuey <shuey@purdue.edu>
---
 .../staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c    |  458 +++++++-------
 .../staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h    |  680 ++++++++++----------
 .../staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c |  484 +++++++-------
 .../lustre/lnet/klnds/o2iblnd/o2iblnd_modparams.c  |   48 +-
 4 files changed, 841 insertions(+), 829 deletions(-)

diff --git a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
index 3bad441..a57c5c3 100644
--- a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
+++ b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
@@ -42,21 +42,21 @@
 #include <asm/div64.h>
 
 static lnd_t the_o2iblnd = {
-	.lnd_type       = O2IBLND,
-	.lnd_startup    = kiblnd_startup,
-	.lnd_shutdown   = kiblnd_shutdown,
-	.lnd_ctl	= kiblnd_ctl,
-	.lnd_query      = kiblnd_query,
-	.lnd_send       = kiblnd_send,
-	.lnd_recv       = kiblnd_recv,
+	.lnd_type     = O2IBLND,
+	.lnd_startup  = kiblnd_startup,
+	.lnd_shutdown = kiblnd_shutdown,
+	.lnd_ctl      = kiblnd_ctl,
+	.lnd_query    = kiblnd_query,
+	.lnd_send     = kiblnd_send,
+	.lnd_recv     = kiblnd_recv,
 };
 
-kib_data_t	      kiblnd_data;
+kib_data_t kiblnd_data;
 
 static __u32 kiblnd_cksum(void *ptr, int nob)
 {
-	char  *c  = ptr;
-	__u32  sum = 0;
+	char *c = ptr;
+	__u32 sum = 0;
 
 	while (nob-- > 0)
 		sum = ((sum << 1) | (sum >> 31)) + *c++;
@@ -138,10 +138,10 @@ static int kiblnd_msgtype2size(int type)
 
 static int kiblnd_unpack_rd(kib_msg_t *msg, int flip)
 {
-	kib_rdma_desc_t   *rd;
-	int		nob;
-	int		n;
-	int		i;
+	kib_rdma_desc_t *rd;
+	int nob;
+	int n;
+	int i;
 
 	LASSERT(msg->ibm_type = IBLND_MSG_GET_REQ ||
 		 msg->ibm_type = IBLND_MSG_PUT_ACK);
@@ -210,10 +210,10 @@ void kiblnd_pack_msg(lnet_ni_t *ni, kib_msg_t *msg, int version,
 int kiblnd_unpack_msg(kib_msg_t *msg, int nob)
 {
 	const int hdr_size = offsetof(kib_msg_t, ibm_u);
-	__u32     msg_cksum;
-	__u16     version;
-	int       msg_nob;
-	int       flip;
+	__u32 msg_cksum;
+	__u16 version;
+	int msg_nob;
+	int flip;
 
 	/* 6 bytes are enough to have received magic + version */
 	if (nob < 6) {
@@ -320,10 +320,10 @@ int kiblnd_unpack_msg(kib_msg_t *msg, int nob)
 
 int kiblnd_create_peer(lnet_ni_t *ni, kib_peer_t **peerp, lnet_nid_t nid)
 {
-	kib_peer_t	*peer;
-	kib_net_t	*net = ni->ni_data;
-	int		cpt = lnet_cpt_of_nid(nid);
-	unsigned long   flags;
+	kib_peer_t *peer;
+	kib_net_t *net = ni->ni_data;
+	int cpt = lnet_cpt_of_nid(nid);
+	unsigned long flags;
 
 	LASSERT(net != NULL);
 	LASSERT(nid != LNET_NID_ANY);
@@ -385,9 +385,9 @@ kib_peer_t *kiblnd_find_peer_locked(lnet_nid_t nid)
 {
 	/* the caller is responsible for accounting the additional reference
 	 * that this creates */
-	struct list_head       *peer_list = kiblnd_nid2peerlist(nid);
-	struct list_head       *tmp;
-	kib_peer_t       *peer;
+	struct list_head *peer_list = kiblnd_nid2peerlist(nid);
+	struct list_head *tmp;
+	kib_peer_t *peer;
 
 	list_for_each(tmp, peer_list) {
 
@@ -422,10 +422,10 @@ void kiblnd_unlink_peer_locked(kib_peer_t *peer)
 static int kiblnd_get_peer_info(lnet_ni_t *ni, int index,
 				lnet_nid_t *nidp, int *count)
 {
-	kib_peer_t	    *peer;
-	struct list_head	    *ptmp;
-	int		    i;
-	unsigned long	  flags;
+	kib_peer_t *peer;
+	struct list_head *ptmp;
+	int i;
+	unsigned long flags;
 
 	read_lock_irqsave(&kiblnd_data.kib_global_lock, flags);
 
@@ -459,9 +459,9 @@ static int kiblnd_get_peer_info(lnet_ni_t *ni, int index,
 
 static void kiblnd_del_peer_locked(kib_peer_t *peer)
 {
-	struct list_head	   *ctmp;
-	struct list_head	   *cnxt;
-	kib_conn_t	   *conn;
+	struct list_head *ctmp;
+	struct list_head *cnxt;
+	kib_conn_t *conn;
 
 	if (list_empty(&peer->ibp_conns)) {
 		kiblnd_unlink_peer_locked(peer);
@@ -480,14 +480,14 @@ static void kiblnd_del_peer_locked(kib_peer_t *peer)
 static int kiblnd_del_peer(lnet_ni_t *ni, lnet_nid_t nid)
 {
 	LIST_HEAD(zombies);
-	struct list_head	    *ptmp;
-	struct list_head	    *pnxt;
-	kib_peer_t	    *peer;
-	int		    lo;
-	int		    hi;
-	int		    i;
-	unsigned long	  flags;
-	int		    rc = -ENOENT;
+	struct list_head *ptmp;
+	struct list_head *pnxt;
+	kib_peer_t *peer;
+	int lo;
+	int hi;
+	int i;
+	unsigned long flags;
+	int rc = -ENOENT;
 
 	write_lock_irqsave(&kiblnd_data.kib_global_lock, flags);
 
@@ -532,12 +532,12 @@ static int kiblnd_del_peer(lnet_ni_t *ni, lnet_nid_t nid)
 
 static kib_conn_t *kiblnd_get_conn_by_idx(lnet_ni_t *ni, int index)
 {
-	kib_peer_t	    *peer;
-	struct list_head	    *ptmp;
-	kib_conn_t	    *conn;
-	struct list_head	    *ctmp;
-	int		    i;
-	unsigned long	  flags;
+	kib_peer_t *peer;
+	struct list_head *ptmp;
+	kib_conn_t *conn;
+	struct list_head *ctmp;
+	int i;
+	unsigned long flags;
 
 	read_lock_irqsave(&kiblnd_data.kib_global_lock, flags);
 
@@ -593,7 +593,7 @@ int kiblnd_translate_mtu(int value)
 
 static void kiblnd_setup_mtu_locked(struct rdma_cm_id *cmid)
 {
-	int	   mtu;
+	int mtu;
 
 	/* XXX There is no path record for iWARP, set by netdev->change_mtu? */
 	if (cmid->route.path_rec = NULL)
@@ -607,11 +607,11 @@ static void kiblnd_setup_mtu_locked(struct rdma_cm_id *cmid)
 
 static int kiblnd_get_completion_vector(kib_conn_t *conn, int cpt)
 {
-	cpumask_t	*mask;
-	int		vectors;
-	int		off;
-	int		i;
-	lnet_nid_t	nid = conn->ibc_peer->ibp_nid;
+	cpumask_t *mask;
+	int vectors;
+	int off;
+	int i;
+	lnet_nid_t nid = conn->ibc_peer->ibp_nid;
 
 	vectors = conn->ibc_cmid->device->num_comp_vectors;
 	if (vectors <= 1)
@@ -642,17 +642,17 @@ kib_conn_t *kiblnd_create_conn(kib_peer_t *peer, struct rdma_cm_id *cmid,
 	 * she must dispose of 'cmid'.  (Actually I'd block forever if I tried
 	 * to destroy 'cmid' here since I'm called from the CM which still has
 	 * its ref on 'cmid'). */
-	rwlock_t		*glock = &kiblnd_data.kib_global_lock;
-	kib_net_t	      *net = peer->ibp_ni->ni_data;
-	kib_dev_t	      *dev;
+	rwlock_t *glock = &kiblnd_data.kib_global_lock;
+	kib_net_t *net = peer->ibp_ni->ni_data;
+	kib_dev_t *dev;
 	struct ib_qp_init_attr *init_qp_attr;
-	struct kib_sched_info	*sched;
-	kib_conn_t		*conn;
-	struct ib_cq		*cq;
-	unsigned long		flags;
-	int			cpt;
-	int			rc;
-	int			i;
+	struct kib_sched_info *sched;
+	kib_conn_t *conn;
+	struct ib_cq *cq;
+	unsigned long flags;
+	int cpt;
+	int rc;
+	int i;
 
 	LASSERT(net != NULL);
 	LASSERT(!in_interrupt());
@@ -837,8 +837,8 @@ kib_conn_t *kiblnd_create_conn(kib_peer_t *peer, struct rdma_cm_id *cmid,
 void kiblnd_destroy_conn(kib_conn_t *conn)
 {
 	struct rdma_cm_id *cmid = conn->ibc_cmid;
-	kib_peer_t	*peer = conn->ibc_peer;
-	int		rc;
+	kib_peer_t *peer = conn->ibc_peer;
+	int rc;
 
 	LASSERT(!in_interrupt());
 	LASSERT(atomic_read(&conn->ibc_refcount) = 0);
@@ -904,10 +904,10 @@ void kiblnd_destroy_conn(kib_conn_t *conn)
 
 int kiblnd_close_peer_conns_locked(kib_peer_t *peer, int why)
 {
-	kib_conn_t	     *conn;
-	struct list_head	     *ctmp;
-	struct list_head	     *cnxt;
-	int		     count = 0;
+	kib_conn_t *conn;
+	struct list_head *ctmp;
+	struct list_head *cnxt;
+	int count = 0;
 
 	list_for_each_safe(ctmp, cnxt, &peer->ibp_conns) {
 		conn = list_entry(ctmp, kib_conn_t, ibc_list);
@@ -926,10 +926,10 @@ int kiblnd_close_peer_conns_locked(kib_peer_t *peer, int why)
 int kiblnd_close_stale_conns_locked(kib_peer_t *peer,
 				     int version, __u64 incarnation)
 {
-	kib_conn_t	     *conn;
-	struct list_head	     *ctmp;
-	struct list_head	     *cnxt;
-	int		     count = 0;
+	kib_conn_t *conn;
+	struct list_head *ctmp;
+	struct list_head *cnxt;
+	int count = 0;
 
 	list_for_each_safe(ctmp, cnxt, &peer->ibp_conns) {
 		conn = list_entry(ctmp, kib_conn_t, ibc_list);
@@ -953,14 +953,14 @@ int kiblnd_close_stale_conns_locked(kib_peer_t *peer,
 
 static int kiblnd_close_matching_conns(lnet_ni_t *ni, lnet_nid_t nid)
 {
-	kib_peer_t	     *peer;
-	struct list_head	     *ptmp;
-	struct list_head	     *pnxt;
-	int		     lo;
-	int		     hi;
-	int		     i;
-	unsigned long	   flags;
-	int		     count = 0;
+	kib_peer_t *peer;
+	struct list_head *ptmp;
+	struct list_head *pnxt;
+	int lo;
+	int hi;
+	int i;
+	unsigned long flags;
+	int count = 0;
 
 	write_lock_irqsave(&kiblnd_data.kib_global_lock, flags);
 
@@ -1001,17 +1001,17 @@ static int kiblnd_close_matching_conns(lnet_ni_t *ni, lnet_nid_t nid)
 int kiblnd_ctl(lnet_ni_t *ni, unsigned int cmd, void *arg)
 {
 	struct libcfs_ioctl_data *data = arg;
-	int		       rc = -EINVAL;
+	int rc = -EINVAL;
 
 	switch (cmd) {
 	case IOC_LIBCFS_GET_PEER: {
-		lnet_nid_t   nid = 0;
-		int	  count = 0;
+		lnet_nid_t nid = 0;
+		int count = 0;
 
 		rc = kiblnd_get_peer_info(ni, data->ioc_count,
 					  &nid, &count);
-		data->ioc_nid    = nid;
-		data->ioc_count  = count;
+		data->ioc_nid   = nid;
+		data->ioc_count = count;
 		break;
 	}
 
@@ -1053,11 +1053,11 @@ int kiblnd_ctl(lnet_ni_t *ni, unsigned int cmd, void *arg)
 
 void kiblnd_query(lnet_ni_t *ni, lnet_nid_t nid, unsigned long *when)
 {
-	unsigned long	last_alive = 0;
-	unsigned long	now = cfs_time_current();
-	rwlock_t	*glock = &kiblnd_data.kib_global_lock;
-	kib_peer_t	*peer;
-	unsigned long	flags;
+	unsigned long last_alive = 0;
+	unsigned long now = cfs_time_current();
+	rwlock_t *glock = &kiblnd_data.kib_global_lock;
+	kib_peer_t *peer;
+	unsigned long flags;
 
 	read_lock_irqsave(glock, flags);
 
@@ -1086,8 +1086,8 @@ void kiblnd_query(lnet_ni_t *ni, lnet_nid_t nid, unsigned long *when)
 
 void kiblnd_free_pages(kib_pages_t *p)
 {
-	int	npages = p->ibp_npages;
-	int	i;
+	int npages = p->ibp_npages;
+	int i;
 
 	for (i = 0; i < npages; i++) {
 		if (p->ibp_pages[i] != NULL)
@@ -1099,8 +1099,8 @@ void kiblnd_free_pages(kib_pages_t *p)
 
 int kiblnd_alloc_pages(kib_pages_t **pp, int cpt, int npages)
 {
-	kib_pages_t	*p;
-	int		i;
+	kib_pages_t *p;
+	int i;
 
 	LIBCFS_CPT_ALLOC(p, lnet_cpt_table(), cpt,
 			 offsetof(kib_pages_t, ibp_pages[npages]));
@@ -1130,7 +1130,7 @@ int kiblnd_alloc_pages(kib_pages_t **pp, int cpt, int npages)
 void kiblnd_unmap_rx_descs(kib_conn_t *conn)
 {
 	kib_rx_t *rx;
-	int       i;
+	int i;
 
 	LASSERT(conn->ibc_rxs != NULL);
 	LASSERT(conn->ibc_hdev != NULL);
@@ -1153,14 +1153,13 @@ void kiblnd_unmap_rx_descs(kib_conn_t *conn)
 
 void kiblnd_map_rx_descs(kib_conn_t *conn)
 {
-	kib_rx_t       *rx;
-	struct page    *pg;
-	int	     pg_off;
-	int	     ipg;
-	int	     i;
+	kib_rx_t *rx;
+	struct page *pg;
+	int pg_off;
+	int ipg;
+	int i;
 
-	for (pg_off = ipg = i = 0;
-	     i < IBLND_RX_MSGS(conn->ibc_version); i++) {
+	for (pg_off = ipg = i = 0; i < IBLND_RX_MSGS(conn->ibc_version); i++) {
 		pg = conn->ibc_rx_pages->ibp_pages[ipg];
 		rx = &conn->ibc_rxs[i];
 
@@ -1192,9 +1191,9 @@ void kiblnd_map_rx_descs(kib_conn_t *conn)
 
 static void kiblnd_unmap_tx_pool(kib_tx_pool_t *tpo)
 {
-	kib_hca_dev_t  *hdev = tpo->tpo_hdev;
-	kib_tx_t       *tx;
-	int	     i;
+	kib_hca_dev_t *hdev = tpo->tpo_hdev;
+	kib_tx_t *tx;
+	int i;
 
 	LASSERT(tpo->tpo_pool.po_allocated = 0);
 
@@ -1216,8 +1215,8 @@ static void kiblnd_unmap_tx_pool(kib_tx_pool_t *tpo)
 static kib_hca_dev_t *kiblnd_current_hdev(kib_dev_t *dev)
 {
 	kib_hca_dev_t *hdev;
-	unsigned long  flags;
-	int	    i = 0;
+	unsigned long flags;
+	int i = 0;
 
 	read_lock_irqsave(&kiblnd_data.kib_global_lock, flags);
 	while (dev->ibd_failover) {
@@ -1240,15 +1239,15 @@ static kib_hca_dev_t *kiblnd_current_hdev(kib_dev_t *dev)
 
 static void kiblnd_map_tx_pool(kib_tx_pool_t *tpo)
 {
-	kib_pages_t    *txpgs = tpo->tpo_tx_pages;
-	kib_pool_t     *pool  = &tpo->tpo_pool;
-	kib_net_t      *net   = pool->po_owner->ps_net;
-	kib_dev_t      *dev;
-	struct page    *page;
-	kib_tx_t       *tx;
-	int	     page_offset;
-	int	     ipage;
-	int	     i;
+	kib_pages_t *txpgs = tpo->tpo_tx_pages;
+	kib_pool_t *pool = &tpo->tpo_pool;
+	kib_net_t *net = pool->po_owner->ps_net;
+	kib_dev_t *dev;
+	struct page *page;
+	kib_tx_t *tx;
+	int page_offset;
+	int ipage;
+	int i;
 
 	LASSERT(net != NULL);
 
@@ -1291,7 +1290,7 @@ static void kiblnd_map_tx_pool(kib_tx_pool_t *tpo)
 
 struct ib_mr *kiblnd_find_dma_mr(kib_hca_dev_t *hdev, __u64 addr, __u64 size)
 {
-	__u64   index;
+	__u64 index;
 
 	LASSERT(hdev->ibh_mrs[0] != NULL);
 
@@ -1311,7 +1310,7 @@ struct ib_mr *kiblnd_find_rd_dma_mr(kib_hca_dev_t *hdev, kib_rdma_desc_t *rd)
 {
 	struct ib_mr *prev_mr;
 	struct ib_mr *mr;
-	int	   i;
+	int i;
 
 	LASSERT(hdev->ibh_mrs[0] != NULL);
 
@@ -1382,18 +1381,18 @@ static int kiblnd_create_fmr_pool(kib_fmr_poolset_t *fps,
 				  kib_fmr_pool_t **pp_fpo)
 {
 	/* FMR pool for RDMA */
-	kib_dev_t	       *dev = fps->fps_net->ibn_dev;
-	kib_fmr_pool_t	  *fpo;
+	kib_dev_t *dev = fps->fps_net->ibn_dev;
+	kib_fmr_pool_t *fpo;
 	struct ib_fmr_pool_param param = {
 		.max_pages_per_fmr = LNET_MAX_PAYLOAD/PAGE_SIZE,
-		.page_shift	= PAGE_SHIFT,
-		.access	    = (IB_ACCESS_LOCAL_WRITE |
-				      IB_ACCESS_REMOTE_WRITE),
-		.pool_size	   = fps->fps_pool_size,
+		.page_shift        = PAGE_SHIFT,
+		.access            = (IB_ACCESS_LOCAL_WRITE |
+		                      IB_ACCESS_REMOTE_WRITE),
+		.pool_size         = fps->fps_pool_size,
 		.dirty_watermark   = fps->fps_flush_trigger,
 		.flush_function    = NULL,
-		.flush_arg	 = NULL,
-		.cache	     = !!*kiblnd_tunables.kib_fmr_cache};
+		.flush_arg         = NULL,
+		.cache             = !!*kiblnd_tunables.kib_fmr_cache};
 	int rc;
 
 	LIBCFS_CPT_ALLOC(fpo, lnet_cpt_table(), fps->fps_cpt, sizeof(*fpo));
@@ -1454,7 +1453,7 @@ static int kiblnd_init_fmr_poolset(kib_fmr_poolset_t *fps, int cpt,
 				   int flush_trigger)
 {
 	kib_fmr_pool_t *fpo;
-	int	     rc;
+	int rc;
 
 	memset(fps, 0, sizeof(kib_fmr_poolset_t));
 
@@ -1485,11 +1484,11 @@ static int kiblnd_fmr_pool_is_idle(kib_fmr_pool_t *fpo, unsigned long now)
 void kiblnd_fmr_pool_unmap(kib_fmr_t *fmr, int status)
 {
 	LIST_HEAD(zombies);
-	kib_fmr_pool_t    *fpo = fmr->fmr_pool;
+	kib_fmr_pool_t *fpo = fmr->fmr_pool;
 	kib_fmr_poolset_t *fps = fpo->fpo_owner;
-	unsigned long	 now = cfs_time_current();
-	kib_fmr_pool_t    *tmp;
-	int		rc;
+	unsigned long now = cfs_time_current();
+	kib_fmr_pool_t *tmp;
+	int rc;
 
 	rc = ib_fmr_pool_unmap(fmr->fmr_pfmr);
 	LASSERT(rc = 0);
@@ -1525,9 +1524,9 @@ int kiblnd_fmr_pool_map(kib_fmr_poolset_t *fps, __u64 *pages, int npages,
 			__u64 iov, kib_fmr_t *fmr)
 {
 	struct ib_pool_fmr *pfmr;
-	kib_fmr_pool_t     *fpo;
-	__u64	       version;
-	int		 rc;
+	kib_fmr_pool_t *fpo;
+	__u64 version;
+	int rc;
 
  again:
 	spin_lock(&fps->fps_lock);
@@ -1658,13 +1657,13 @@ static int kiblnd_init_poolset(kib_poolset_t *ps, int cpt,
 			       kib_ps_node_init_t nd_init,
 			       kib_ps_node_fini_t nd_fini)
 {
-	kib_pool_t	*pool;
-	int		rc;
+	kib_pool_t *pool;
+	int rc;
 
 	memset(ps, 0, sizeof(kib_poolset_t));
 
-	ps->ps_cpt	    = cpt;
-	ps->ps_net	  = net;
+	ps->ps_cpt          = cpt;
+	ps->ps_net          = net;
 	ps->ps_pool_create  = po_create;
 	ps->ps_pool_destroy = po_destroy;
 	ps->ps_node_init    = nd_init;
@@ -1698,9 +1697,9 @@ static int kiblnd_pool_is_idle(kib_pool_t *pool, unsigned long now)
 void kiblnd_pool_free_node(kib_pool_t *pool, struct list_head *node)
 {
 	LIST_HEAD(zombies);
-	kib_poolset_t  *ps = pool->po_owner;
-	kib_pool_t     *tmp;
-	unsigned long      now = cfs_time_current();
+	kib_poolset_t *ps = pool->po_owner;
+	kib_pool_t *tmp;
+	unsigned long now = cfs_time_current();
 
 	spin_lock(&ps->ps_lock);
 
@@ -1727,9 +1726,9 @@ void kiblnd_pool_free_node(kib_pool_t *pool, struct list_head *node)
 
 struct list_head *kiblnd_pool_alloc_node(kib_poolset_t *ps)
 {
-	struct list_head	    *node;
-	kib_pool_t	    *pool;
-	int		    rc;
+	struct list_head *node;
+	kib_pool_t *pool;
+	int rc;
 
  again:
 	spin_lock(&ps->ps_lock);
@@ -1789,8 +1788,8 @@ struct list_head *kiblnd_pool_alloc_node(kib_poolset_t *ps)
 
 void kiblnd_pmr_pool_unmap(kib_phys_mr_t *pmr)
 {
-	kib_pmr_pool_t      *ppo = pmr->pmr_pool;
-	struct ib_mr	*mr  = pmr->pmr_mr;
+	kib_pmr_pool_t *ppo = pmr->pmr_pool;
+	struct ib_mr *mr = pmr->pmr_mr;
 
 	pmr->pmr_mr = NULL;
 	kiblnd_pool_free_node(&ppo->ppo_pool, &pmr->pmr_list);
@@ -1802,9 +1801,9 @@ int kiblnd_pmr_pool_map(kib_pmr_poolset_t *pps, kib_hca_dev_t *hdev,
 		    kib_rdma_desc_t *rd, __u64 *iova, kib_phys_mr_t **pp_pmr)
 {
 	kib_phys_mr_t *pmr;
-	struct list_head    *node;
-	int	    rc;
-	int	    i;
+	struct list_head *node;
+	int rc;
+	int i;
 
 	node = kiblnd_pool_alloc_node(&pps->pps_poolset);
 	if (node = NULL) {
@@ -1846,7 +1845,7 @@ int kiblnd_pmr_pool_map(kib_pmr_poolset_t *pps, kib_hca_dev_t *hdev,
 static void kiblnd_destroy_pmr_pool(kib_pool_t *pool)
 {
 	kib_pmr_pool_t *ppo = container_of(pool, kib_pmr_pool_t, ppo_pool);
-	kib_phys_mr_t  *pmr;
+	kib_phys_mr_t *pmr;
 	kib_phys_mr_t *tmp;
 
 	LASSERT(pool->po_allocated = 0);
@@ -1881,10 +1880,10 @@ static inline int kiblnd_pmr_pool_size(int ncpts)
 static int kiblnd_create_pmr_pool(kib_poolset_t *ps, int size,
 				  kib_pool_t **pp_po)
 {
-	struct kib_pmr_pool	*ppo;
-	struct kib_pool		*pool;
-	kib_phys_mr_t		*pmr;
-	int			i;
+	struct kib_pmr_pool *ppo;
+	struct kib_pool *pool;
+	kib_phys_mr_t *pmr;
+	int i;
 
 	LIBCFS_CPT_ALLOC(ppo, lnet_cpt_table(),
 			 ps->ps_cpt, sizeof(kib_pmr_pool_t));
@@ -1923,8 +1922,8 @@ static int kiblnd_create_pmr_pool(kib_poolset_t *ps, int size,
 
 static void kiblnd_destroy_tx_pool(kib_pool_t *pool)
 {
-	kib_tx_pool_t  *tpo = container_of(pool, kib_tx_pool_t, tpo_pool);
-	int	     i;
+	kib_tx_pool_t *tpo = container_of(pool, kib_tx_pool_t, tpo_pool);
+	int i;
 
 	LASSERT(pool->po_allocated = 0);
 
@@ -1979,9 +1978,9 @@ static int kiblnd_tx_pool_size(int ncpts)
 static int kiblnd_create_tx_pool(kib_poolset_t *ps, int size,
 				 kib_pool_t **pp_po)
 {
-	int	    i;
-	int	    npg;
-	kib_pool_t    *pool;
+	int i;
+	int npg;
+	kib_pool_t *pool;
 	kib_tx_pool_t *tpo;
 
 	LIBCFS_CPT_ALLOC(tpo, lnet_cpt_table(), ps->ps_cpt, sizeof(*tpo));
@@ -2064,19 +2063,19 @@ static void kiblnd_tx_init(kib_pool_t *pool, struct list_head *node)
 {
 	kib_tx_poolset_t *tps = container_of(pool->po_owner, kib_tx_poolset_t,
 					     tps_poolset);
-	kib_tx_t	 *tx  = list_entry(node, kib_tx_t, tx_list);
+	kib_tx_t *tx  = list_entry(node, kib_tx_t, tx_list);
 
 	tx->tx_cookie = tps->tps_next_tx_cookie++;
 }
 
 static void kiblnd_net_fini_pools(kib_net_t *net)
 {
-	int	i;
+	int i;
 
 	cfs_cpt_for_each(i, lnet_cpt_table()) {
-		kib_tx_poolset_t	*tps;
-		kib_fmr_poolset_t	*fps;
-		kib_pmr_poolset_t	*pps;
+		kib_tx_poolset_t *tps;
+		kib_fmr_poolset_t *fps;
+		kib_pmr_poolset_t *pps;
 
 		if (net->ibn_tx_ps != NULL) {
 			tps = net->ibn_tx_ps[i];
@@ -2112,16 +2111,15 @@ static void kiblnd_net_fini_pools(kib_net_t *net)
 
 static int kiblnd_net_init_pools(kib_net_t *net, __u32 *cpts, int ncpts)
 {
-	unsigned long	flags;
-	int		cpt;
-	int		rc;
-	int		i;
+	unsigned long flags;
+	int cpt;
+	int rc;
+	int i;
 
 	read_lock_irqsave(&kiblnd_data.kib_global_lock, flags);
 	if (*kiblnd_tunables.kib_map_on_demand = 0 &&
 	    net->ibn_dev->ibd_hdev->ibh_nmrs = 1) {
-		read_unlock_irqrestore(&kiblnd_data.kib_global_lock,
-					   flags);
+		read_unlock_irqrestore(&kiblnd_data.kib_global_lock, flags);
 		goto create_tx_pool;
 	}
 
@@ -2241,7 +2239,7 @@ static int kiblnd_net_init_pools(kib_net_t *net, __u32 *cpts, int ncpts)
 static int kiblnd_hdev_get_attr(kib_hca_dev_t *hdev)
 {
 	struct ib_device_attr *attr;
-	int		    rc;
+	int rc;
 
 	/* It's safe to assume a HCA can handle a page size
 	 * matching that of the native system */
@@ -2284,7 +2282,7 @@ static int kiblnd_hdev_get_attr(kib_hca_dev_t *hdev)
 
 static void kiblnd_hdev_cleanup_mrs(kib_hca_dev_t *hdev)
 {
-	int     i;
+	int i;
 
 	if (hdev->ibh_nmrs = 0 || hdev->ibh_mrs = NULL)
 		return;
@@ -2317,12 +2315,11 @@ void kiblnd_hdev_destroy(kib_hca_dev_t *hdev)
 static int kiblnd_hdev_setup_mrs(kib_hca_dev_t *hdev)
 {
 	struct ib_mr *mr;
-	int	   i;
-	int	   rc;
-	__u64	 mm_size;
-	__u64	 mr_size;
-	int	   acflags = IB_ACCESS_LOCAL_WRITE |
-				IB_ACCESS_REMOTE_WRITE;
+	int i;
+	int rc;
+	__u64 mm_size;
+	__u64 mr_size;
+	int acflags = IB_ACCESS_LOCAL_WRITE | IB_ACCESS_REMOTE_WRITE;
 
 	rc = kiblnd_hdev_get_attr(hdev);
 	if (rc != 0)
@@ -2371,11 +2368,11 @@ static int kiblnd_hdev_setup_mrs(kib_hca_dev_t *hdev)
 
 	for (i = 0; i < hdev->ibh_nmrs; i++) {
 		struct ib_phys_buf ipb;
-		__u64	      iova;
+		__u64 iova;
 
 		ipb.size = hdev->ibh_mr_size;
 		ipb.addr = i * mr_size;
-		iova     = ipb.addr;
+		iova = ipb.addr;
 
 		mr = ib_reg_phys_mr(hdev->ibh_pd, &ipb, 1, acflags, &iova);
 		if (IS_ERR(mr)) {
@@ -2406,10 +2403,10 @@ static int kiblnd_dummy_callback(struct rdma_cm_id *cmid,
 
 static int kiblnd_dev_need_failover(kib_dev_t *dev)
 {
-	struct rdma_cm_id  *cmid;
-	struct sockaddr_in  srcaddr;
-	struct sockaddr_in  dstaddr;
-	int		 rc;
+	struct rdma_cm_id *cmid;
+	struct sockaddr_in srcaddr;
+	struct sockaddr_in dstaddr;
+	int rc;
 
 	if (dev->ibd_hdev = NULL || /* initializing */
 	    dev->ibd_hdev->ibh_cmid = NULL || /* listener is dead */
@@ -2435,7 +2432,7 @@ static int kiblnd_dev_need_failover(kib_dev_t *dev)
 	}
 
 	memset(&srcaddr, 0, sizeof(srcaddr));
-	srcaddr.sin_family      = AF_INET;
+	srcaddr.sin_family = AF_INET;
 	srcaddr.sin_addr.s_addr = (__force u32)htonl(dev->ibd_ifip);
 
 	memset(&dstaddr, 0, sizeof(dstaddr));
@@ -2464,15 +2461,15 @@ int kiblnd_dev_failover(kib_dev_t *dev)
 	LIST_HEAD(zombie_tpo);
 	LIST_HEAD(zombie_ppo);
 	LIST_HEAD(zombie_fpo);
-	struct rdma_cm_id  *cmid  = NULL;
-	kib_hca_dev_t      *hdev  = NULL;
-	kib_hca_dev_t      *old;
-	struct ib_pd       *pd;
-	kib_net_t	  *net;
-	struct sockaddr_in  addr;
-	unsigned long       flags;
-	int		 rc = 0;
-	int		    i;
+	struct rdma_cm_id *cmid  = NULL;
+	kib_hca_dev_t *hdev  = NULL;
+	kib_hca_dev_t *old;
+	struct ib_pd *pd;
+	kib_net_t *net;
+	struct sockaddr_in addr;
+	unsigned long flags;
+	int rc = 0;
+	int i;
 
 	LASSERT(*kiblnd_tunables.kib_dev_failover > 1 ||
 		 dev->ibd_can_failover ||
@@ -2614,11 +2611,11 @@ void kiblnd_destroy_dev(kib_dev_t *dev)
 static kib_dev_t *kiblnd_create_dev(char *ifname)
 {
 	struct net_device *netdev;
-	kib_dev_t	 *dev;
-	__u32	      netmask;
-	__u32	      ip;
-	int		up;
-	int		rc;
+	kib_dev_t *dev;
+	__u32 netmask;
+	__u32 ip;
+	int up;
+	int rc;
 
 	rc = libcfs_ipif_query(ifname, &up, &ip, &netmask);
 	if (rc != 0) {
@@ -2665,8 +2662,8 @@ static kib_dev_t *kiblnd_create_dev(char *ifname)
 
 static void kiblnd_base_shutdown(void)
 {
-	struct kib_sched_info	*sched;
-	int			i;
+	struct kib_sched_info *sched;
+	int i;
 
 	LASSERT(list_empty(&kiblnd_data.kib_devs));
 
@@ -2732,10 +2729,10 @@ static void kiblnd_base_shutdown(void)
 
 void kiblnd_shutdown(lnet_ni_t *ni)
 {
-	kib_net_t	*net = ni->ni_data;
-	rwlock_t     *g_lock = &kiblnd_data.kib_global_lock;
-	int	       i;
-	unsigned long     flags;
+	kib_net_t *net = ni->ni_data;
+	rwlock_t *g_lock = &kiblnd_data.kib_global_lock;
+	int i;
+	unsigned long flags;
 
 	LASSERT(kiblnd_data.kib_init = IBLND_INIT_ALL);
 
@@ -2804,9 +2801,9 @@ out:
 
 static int kiblnd_base_startup(void)
 {
-	struct kib_sched_info	*sched;
-	int			rc;
-	int			i;
+	struct kib_sched_info *sched;
+	int rc;
+	int i;
 
 	LASSERT(kiblnd_data.kib_init = IBLND_INIT_NOTHING);
 
@@ -2821,8 +2818,7 @@ static int kiblnd_base_startup(void)
 
 	kiblnd_data.kib_peer_hash_size = IBLND_PEER_HASH_SIZE;
 	LIBCFS_ALLOC(kiblnd_data.kib_peers,
-		     sizeof(struct list_head) *
-			    kiblnd_data.kib_peer_hash_size);
+		     sizeof(struct list_head) * kiblnd_data.kib_peer_hash_size);
 	if (kiblnd_data.kib_peers = NULL)
 		goto failed;
 	for (i = 0; i < kiblnd_data.kib_peer_hash_size; i++)
@@ -2840,7 +2836,7 @@ static int kiblnd_base_startup(void)
 		goto failed;
 
 	cfs_percpt_for_each(sched, i, kiblnd_data.kib_scheds) {
-		int	nthrs;
+		int nthrs;
 
 		spin_lock_init(&sched->ibs_lock);
 		INIT_LIST_HEAD(&sched->ibs_conns);
@@ -2893,9 +2889,9 @@ static int kiblnd_base_startup(void)
 
 static int kiblnd_start_schedulers(struct kib_sched_info *sched)
 {
-	int	rc = 0;
-	int	nthrs;
-	int	i;
+	int rc = 0;
+	int nthrs;
+	int i;
 
 	if (sched->ibs_nthreads = 0) {
 		if (*kiblnd_tunables.kib_nscheds > 0) {
@@ -2913,8 +2909,8 @@ static int kiblnd_start_schedulers(struct kib_sched_info *sched)
 	}
 
 	for (i = 0; i < nthrs; i++) {
-		long	id;
-		char	name[20];
+		long id;
+		char name[20];
 
 		id = KIB_THREAD_ID(sched->ibs_cpt, sched->ibs_nthreads + i);
 		snprintf(name, sizeof(name), "kiblnd_sd_%02ld_%02ld",
@@ -2935,9 +2931,9 @@ static int kiblnd_start_schedulers(struct kib_sched_info *sched)
 static int kiblnd_dev_start_threads(kib_dev_t *dev, int newdev, __u32 *cpts,
 				    int ncpts)
 {
-	int	cpt;
-	int	rc;
-	int	i;
+	int cpt;
+	int rc;
+	int i;
 
 	for (i = 0; i < ncpts; i++) {
 		struct kib_sched_info *sched;
@@ -2960,10 +2956,10 @@ static int kiblnd_dev_start_threads(kib_dev_t *dev, int newdev, __u32 *cpts,
 
 static kib_dev_t *kiblnd_dev_search(char *ifname)
 {
-	kib_dev_t	*alias = NULL;
-	kib_dev_t	*dev;
-	char		*colon;
-	char		*colon2;
+	kib_dev_t *alias = NULL;
+	kib_dev_t *dev;
+	char *colon;
+	char *colon2;
 
 	colon = strchr(ifname, ':');
 	list_for_each_entry(dev, &kiblnd_data.kib_devs, ibd_list) {
@@ -2992,13 +2988,13 @@ static kib_dev_t *kiblnd_dev_search(char *ifname)
 
 int kiblnd_startup(lnet_ni_t *ni)
 {
-	char		     *ifname;
-	kib_dev_t		*ibdev = NULL;
-	kib_net_t		*net;
-	struct timeval	    tv;
-	unsigned long	     flags;
-	int		       rc;
-	int			  newdev;
+	char *ifname;
+	kib_dev_t *ibdev = NULL;
+	kib_net_t *net;
+	struct timeval tv;
+	unsigned long flags;
+	int rc;
+	int newdev;
 
 	LASSERT(ni->ni_lnd = &the_o2iblnd);
 
@@ -3091,7 +3087,7 @@ static void __exit kiblnd_module_fini(void)
 
 static int __init kiblnd_module_init(void)
 {
-	int    rc;
+	int rc;
 
 	CLASSERT(sizeof(kib_msg_t) <= IBLND_MSG_SIZE);
 	CLASSERT(offsetof(kib_msg_t,
diff --git a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h
index cd664d0..7f52c69 100644
--- a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h
+++ b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h
@@ -80,42 +80,47 @@
 #define IBLND_N_SCHED_HIGH		4
 
 typedef struct {
-	int	      *kib_dev_failover;     /* HCA failover */
-	unsigned int     *kib_service;	  /* IB service number */
-	int	      *kib_min_reconnect_interval; /* first failed connection retry... */
-	int	      *kib_max_reconnect_interval; /* ...exponentially increasing to this */
-	int	      *kib_cksum;	    /* checksum kib_msg_t? */
-	int	      *kib_timeout;	  /* comms timeout (seconds) */
-	int	      *kib_keepalive;	/* keepalive timeout (seconds) */
-	int	      *kib_ntx;	      /* # tx descs */
-	int	      *kib_credits;	  /* # concurrent sends */
-	int	      *kib_peertxcredits;    /* # concurrent sends to 1 peer */
-	int	      *kib_peerrtrcredits;   /* # per-peer router buffer credits */
-	int	      *kib_peercredits_hiw;  /* # when eagerly to return credits */
-	int	      *kib_peertimeout;      /* seconds to consider peer dead */
-	char	    **kib_default_ipif;     /* default IPoIB interface */
-	int	      *kib_retry_count;
-	int	      *kib_rnr_retry_count;
-	int	      *kib_concurrent_sends; /* send work queue sizing */
-	int		 *kib_ib_mtu;		/* IB MTU */
-	int	      *kib_map_on_demand;    /* map-on-demand if RD has more fragments
-						 * than this value, 0 disable map-on-demand */
-	int	      *kib_pmr_pool_size;    /* # physical MR in pool */
-	int	      *kib_fmr_pool_size;    /* # FMRs in pool */
-	int	      *kib_fmr_flush_trigger; /* When to trigger FMR flush */
-	int	      *kib_fmr_cache;	/* enable FMR pool cache? */
-	int	      *kib_require_priv_port;/* accept only privileged ports */
-	int	      *kib_use_priv_port;    /* use privileged port for active connect */
-	/* # threads on each CPT */
-	int		 *kib_nscheds;
+	int          *kib_dev_failover;      /* HCA failover */
+	unsigned int *kib_service;           /* IB service number */
+	int          *kib_min_reconnect_interval; /* first failed connection
+						   * retry... */
+	int          *kib_max_reconnect_interval; /* ...exponentially increasing
+						   * to this */
+	int          *kib_cksum;             /* checksum kib_msg_t? */
+	int          *kib_timeout;           /* comms timeout (seconds) */
+	int          *kib_keepalive;         /* keepalive timeout (seconds) */
+	int          *kib_ntx;               /* # tx descs */
+	int          *kib_credits;           /* # concurrent sends */
+	int          *kib_peertxcredits;     /* # concurrent sends to 1 peer */
+	int          *kib_peerrtrcredits;    /* # per-peer router buffer
+					      * credits */
+	int          *kib_peercredits_hiw;   /* # when eagerly to return
+					      * credits */
+	int          *kib_peertimeout;       /* seconds to consider peer dead */
+	char         **kib_default_ipif;     /* default IPoIB interface */
+	int          *kib_retry_count;
+	int          *kib_rnr_retry_count;
+	int          *kib_concurrent_sends;  /* send work queue sizing */
+	int          *kib_ib_mtu;            /* IB MTU */
+	int          *kib_map_on_demand;     /* map-on-demand if RD has more
+					      * fragments than this value, 0
+					      * disable map-on-demand */
+	int          *kib_pmr_pool_size;     /* # physical MR in pool */
+	int          *kib_fmr_pool_size;     /* # FMRs in pool */
+	int          *kib_fmr_flush_trigger; /* When to trigger FMR flush */
+	int          *kib_fmr_cache;         /* enable FMR pool cache? */
+	int          *kib_require_priv_port; /* accept only privileged ports */
+	int          *kib_use_priv_port;     /* use privileged port for active
+					      * connect */
+	int          *kib_nscheds;           /* # threads on each CPT */
 } kib_tunables_t;
 
 extern kib_tunables_t  kiblnd_tunables;
 
-#define IBLND_MSG_QUEUE_SIZE_V1      8	  /* V1 only : # messages/RDMAs in-flight */
-#define IBLND_CREDIT_HIGHWATER_V1    7	  /* V1 only : when eagerly to return credits */
+#define IBLND_MSG_QUEUE_SIZE_V1   8 /* V1 only : # messages/RDMAs in-flight */
+#define IBLND_CREDIT_HIGHWATER_V1 7 /* V1 only : when eagerly to return credits */
 
-#define IBLND_CREDITS_DEFAULT	8	  /* default # of peer credits */
+#define IBLND_CREDITS_DEFAULT     8 /* default # of peer credits */
 #define IBLND_CREDITS_MAX	  ((typeof(((kib_msg_t*) 0)->ibm_credits)) - 1)  /* Max # of peer credits */
 
 #define IBLND_MSG_QUEUE_SIZE(v)    ((v) = IBLND_MSG_VERSION_1 ? \
@@ -186,34 +191,36 @@ struct kib_hca_dev;
 #endif
 
 typedef struct {
-	struct list_head	   ibd_list;	  /* chain on kib_devs */
-	struct list_head	   ibd_fail_list;     /* chain on kib_failed_devs */
-	__u32		ibd_ifip;	  /* IPoIB interface IP */
-	/** IPoIB interface name */
-	char		 ibd_ifname[KIB_IFNAME_SIZE];
-	int		  ibd_nnets;	 /* # nets extant */
-
-	unsigned long	   ibd_next_failover;
-	int		  ibd_failed_failover; /* # failover failures */
-	unsigned int	 ibd_failover;      /* failover in progress */
-	unsigned int	 ibd_can_failover;  /* IPoIB interface is a bonding master */
-	struct list_head	   ibd_nets;
-	struct kib_hca_dev  *ibd_hdev;
+	struct list_head   ibd_list;            /* chain on kib_devs */
+	struct list_head   ibd_fail_list;       /* chain on kib_failed_devs */
+	__u32              ibd_ifip;            /* IPoIB interface IP */
+
+	/* IPoIB interface name */
+	char               ibd_ifname[KIB_IFNAME_SIZE];
+	int                ibd_nnets;           /* # nets extant */
+
+	unsigned long      ibd_next_failover;
+	int                ibd_failed_failover; /* # failover failures */
+	unsigned int       ibd_failover;        /* failover in progress */
+	unsigned int       ibd_can_failover;    /* IPoIB interface is a bonding
+						 * master */
+	struct list_head   ibd_nets;
+	struct kib_hca_dev *ibd_hdev;
 } kib_dev_t;
 
 typedef struct kib_hca_dev {
-	struct rdma_cm_id   *ibh_cmid;	  /* listener cmid */
-	struct ib_device    *ibh_ibdev;	 /* IB device */
-	int		  ibh_page_shift;    /* page shift of current HCA */
-	int		  ibh_page_size;     /* page size of current HCA */
-	__u64		ibh_page_mask;     /* page mask of current HCA */
-	int		  ibh_mr_shift;      /* bits shift of max MR size */
-	__u64		ibh_mr_size;       /* size of MR */
-	int		  ibh_nmrs;	  /* # of global MRs */
-	struct ib_mr       **ibh_mrs;	   /* global MR */
-	struct ib_pd	*ibh_pd;	    /* PD */
-	kib_dev_t	   *ibh_dev;	   /* owner */
-	atomic_t	 ibh_ref;	   /* refcount */
+	struct rdma_cm_id  *ibh_cmid;           /* listener cmid */
+	struct ib_device   *ibh_ibdev;          /* IB device */
+	int                ibh_page_shift;      /* page shift of current HCA */
+	int                ibh_page_size;       /* page size of current HCA */
+	__u64              ibh_page_mask;       /* page mask of current HCA */
+	int                ibh_mr_shift;        /* bits shift of max MR size */
+	__u64              ibh_mr_size;         /* size of MR */
+	int                ibh_nmrs;            /* # of global MRs */
+	struct ib_mr       **ibh_mrs;           /* global MR */
+	struct ib_pd       *ibh_pd;             /* PD */
+	kib_dev_t          *ibh_dev;            /* owner */
+	atomic_t           ibh_ref;             /* refcount */
 } kib_hca_dev_t;
 
 /** # of seconds to keep pool alive */
@@ -222,19 +229,19 @@ typedef struct kib_hca_dev {
 #define IBLND_POOL_RETRY	1
 
 typedef struct {
-	int		     ibp_npages;	     /* # pages */
-	struct page	    *ibp_pages[0];	   /* page array */
+	int                ibp_npages;          /* # pages */
+	struct page        *ibp_pages[0];       /* page array */
 } kib_pages_t;
 
 struct kib_pmr_pool;
 
 typedef struct {
-	struct list_head	      pmr_list;	       /* chain node */
-	struct ib_phys_buf     *pmr_ipb;		/* physical buffer */
-	struct ib_mr	   *pmr_mr;		 /* IB MR */
-	struct kib_pmr_pool    *pmr_pool;	       /* owner of this MR */
-	__u64		   pmr_iova;	       /* Virtual I/O address */
-	int		     pmr_refcount;	   /* reference count */
+	struct list_head    pmr_list;           /* chain node */
+	struct ib_phys_buf  *pmr_ipb;           /* physical buffer */
+	struct ib_mr        *pmr_mr;            /* IB MR */
+	struct kib_pmr_pool *pmr_pool;          /* owner of this MR */
+	__u64               pmr_iova;           /* Virtual I/O address */
+	int                 pmr_refcount;       /* reference count */
 } kib_phys_mr_t;
 
 struct kib_pool;
@@ -251,97 +258,99 @@ struct kib_net;
 #define IBLND_POOL_NAME_LEN     32
 
 typedef struct kib_poolset {
-	spinlock_t		ps_lock;		/* serialize */
-	struct kib_net	 *ps_net;		 /* network it belongs to */
-	char		    ps_name[IBLND_POOL_NAME_LEN]; /* pool set name */
-	struct list_head	      ps_pool_list;	   /* list of pools */
-	struct list_head	      ps_failed_pool_list;    /* failed pool list */
-	unsigned long	      ps_next_retry;	  /* time stamp for retry if failed to allocate */
-	int		     ps_increasing;	  /* is allocating new pool */
-	int		     ps_pool_size;	   /* new pool size */
-	int			ps_cpt;			/* CPT id */
-
-	kib_ps_pool_create_t    ps_pool_create;	 /* create a new pool */
-	kib_ps_pool_destroy_t   ps_pool_destroy;	/* destroy a pool */
-	kib_ps_node_init_t      ps_node_init;	   /* initialize new allocated node */
-	kib_ps_node_fini_t      ps_node_fini;	   /* finalize node */
+	spinlock_t            ps_lock;            /* serialize */
+	struct kib_net        *ps_net;            /* network it belongs to */
+	char                  ps_name[IBLND_POOL_NAME_LEN]; /* pool set name */
+	struct list_head      ps_pool_list;       /* list of pools */
+	struct list_head      ps_failed_pool_list;/* failed pool list */
+	unsigned long         ps_next_retry;      /* time stamp for retry if
+						   * failed to allocate */
+	int                   ps_increasing;      /* is allocating new pool */
+	int                   ps_pool_size;       /* new pool size */
+	int                   ps_cpt;             /* CPT id */
+
+	kib_ps_pool_create_t  ps_pool_create;     /* create a new pool */
+	kib_ps_pool_destroy_t ps_pool_destroy;    /* destroy a pool */
+	kib_ps_node_init_t    ps_node_init;       /* initialize new allocated
+						   * node */
+	kib_ps_node_fini_t    ps_node_fini;       /* finalize node */
 } kib_poolset_t;
 
 typedef struct kib_pool {
-	struct list_head	      po_list;		/* chain on pool list */
-	struct list_head	      po_free_list;	   /* pre-allocated node */
-	kib_poolset_t	  *po_owner;	       /* pool_set of this pool */
-	unsigned long	      po_deadline;	    /* deadline of this pool */
-	int		     po_allocated;	   /* # of elements in use */
-	int		     po_failed;	      /* pool is created on failed HCA */
-	int		     po_size;		/* # of pre-allocated elements */
+	struct list_head      po_list;         /* chain on pool list */
+	struct list_head      po_free_list;    /* pre-allocated node */
+	kib_poolset_t         *po_owner;       /* pool_set of this pool */
+	unsigned long         po_deadline;     /* deadline of this pool */
+	int                   po_allocated;    /* # of elements in use */
+	int                   po_failed;       /* pool is created on failed
+						* HCA */
+	int                   po_size;         /* # of pre-allocated elements */
 } kib_pool_t;
 
 typedef struct {
-	kib_poolset_t	   tps_poolset;	    /* pool-set */
-	__u64		   tps_next_tx_cookie;     /* cookie of TX */
+	kib_poolset_t         tps_poolset;        /* pool-set */
+	__u64                 tps_next_tx_cookie; /* cookie of TX */
 } kib_tx_poolset_t;
 
 typedef struct {
-	kib_pool_t	      tpo_pool;	       /* pool */
-	struct kib_hca_dev     *tpo_hdev;	       /* device for this pool */
-	struct kib_tx	  *tpo_tx_descs;	   /* all the tx descriptors */
-	kib_pages_t	    *tpo_tx_pages;	   /* premapped tx msg pages */
+	kib_pool_t            tpo_pool;           /* pool */
+	struct kib_hca_dev    *tpo_hdev;          /* device for this pool */
+	struct kib_tx         *tpo_tx_descs;      /* all the tx descriptors */
+	kib_pages_t           *tpo_tx_pages;      /* premapped tx msg pages */
 } kib_tx_pool_t;
 
 typedef struct {
-	kib_poolset_t	   pps_poolset;	    /* pool-set */
+	kib_poolset_t         pps_poolset;        /* pool-set */
 } kib_pmr_poolset_t;
 
 typedef struct kib_pmr_pool {
-	struct kib_hca_dev     *ppo_hdev;	       /* device for this pool */
-	kib_pool_t	      ppo_pool;	       /* pool */
+	struct kib_hca_dev    *ppo_hdev;          /* device for this pool */
+	kib_pool_t            ppo_pool;           /* pool */
 } kib_pmr_pool_t;
 
 typedef struct {
-	spinlock_t		fps_lock;		/* serialize */
-	struct kib_net	 *fps_net;		/* IB network */
-	struct list_head	      fps_pool_list;	  /* FMR pool list */
-	struct list_head	      fps_failed_pool_list;   /* FMR pool list */
-	__u64		   fps_version;	    /* validity stamp */
-	int			fps_cpt;		/* CPT id */
-	int			fps_pool_size;
-	int			fps_flush_trigger;
-	/* is allocating new pool */
-	int			fps_increasing;
-	/* time stamp for retry if failed to allocate */
-	unsigned long		fps_next_retry;
+	spinlock_t            fps_lock;            /* serialize */
+	struct kib_net        *fps_net;            /* IB network */
+	struct list_head      fps_pool_list;       /* FMR pool list */
+	struct list_head      fps_failed_pool_list;/* FMR pool list */
+	__u64                 fps_version;         /* validity stamp */
+	int                   fps_cpt;             /* CPT id */
+	int                   fps_pool_size;
+	int                   fps_flush_trigger;
+	int                   fps_increasing;      /* is allocating new pool */
+	unsigned long         fps_next_retry;      /* time stamp for retry if
+						    * failed to allocate */
 } kib_fmr_poolset_t;
 
 typedef struct {
-	struct list_head	      fpo_list;	       /* chain on pool list */
-	struct kib_hca_dev     *fpo_hdev;	       /* device for this pool */
-	kib_fmr_poolset_t      *fpo_owner;	      /* owner of this pool */
-	struct ib_fmr_pool     *fpo_fmr_pool;	   /* IB FMR pool */
-	unsigned long	      fpo_deadline;	   /* deadline of this pool */
-	int		     fpo_failed;	     /* fmr pool is failed */
-	int		     fpo_map_count;	  /* # of mapped FMR */
+	struct list_head      fpo_list;            /* chain on pool list */
+	struct kib_hca_dev    *fpo_hdev;           /* device for this pool */
+	kib_fmr_poolset_t     *fpo_owner;          /* owner of this pool */
+	struct ib_fmr_pool    *fpo_fmr_pool;       /* IB FMR pool */
+	unsigned long         fpo_deadline;        /* deadline of this pool */
+	int                   fpo_failed;          /* fmr pool is failed */
+	int                   fpo_map_count;       /* # of mapped FMR */
 } kib_fmr_pool_t;
 
 typedef struct {
-	struct ib_pool_fmr     *fmr_pfmr;	       /* IB pool fmr */
-	kib_fmr_pool_t	 *fmr_pool;	       /* pool of FMR */
+	struct ib_pool_fmr    *fmr_pfmr;           /* IB pool fmr */
+	kib_fmr_pool_t        *fmr_pool;           /* pool of FMR */
 } kib_fmr_t;
 
 typedef struct kib_net {
-	struct list_head	   ibn_list;	  /* chain on kib_dev_t::ibd_nets */
-	__u64		ibn_incarnation;   /* my epoch */
-	int		  ibn_init;	  /* initialisation state */
-	int		  ibn_shutdown;      /* shutting down? */
+	struct list_head      ibn_list;       /* chain on kib_dev_t::ibd_nets */
+	__u64                 ibn_incarnation;/* my epoch */
+	int                   ibn_init;       /* initialisation state */
+	int                   ibn_shutdown;   /* shutting down? */
 
-	atomic_t		ibn_npeers;	/* # peers extant */
-	atomic_t		ibn_nconns;	/* # connections extant */
+	atomic_t              ibn_npeers;     /* # peers extant */
+	atomic_t              ibn_nconns;     /* # connections extant */
 
-	kib_tx_poolset_t	**ibn_tx_ps;	/* tx pool-set */
-	kib_fmr_poolset_t	**ibn_fmr_ps;	/* fmr pool-set */
-	kib_pmr_poolset_t	**ibn_pmr_ps;	/* pmr pool-set */
+	kib_tx_poolset_t      **ibn_tx_ps;    /* tx pool-set */
+	kib_fmr_poolset_t     **ibn_fmr_ps;   /* fmr pool-set */
+	kib_pmr_poolset_t     **ibn_pmr_ps;   /* pmr pool-set */
 
-	kib_dev_t		*ibn_dev;	/* underlying IB device */
+	kib_dev_t             *ibn_dev;       /* underlying IB device */
 } kib_net_t;
 
 #define KIB_THREAD_SHIFT		16
@@ -350,51 +359,45 @@ typedef struct kib_net {
 #define KIB_THREAD_TID(id)		((id) & ((1UL << KIB_THREAD_SHIFT) - 1))
 
 struct kib_sched_info {
-	/* serialise */
-	spinlock_t		ibs_lock;
-	/* schedulers sleep here */
-	wait_queue_head_t		ibs_waitq;
-	/* conns to check for rx completions */
-	struct list_head		ibs_conns;
-	/* number of scheduler threads */
-	int			ibs_nthreads;
-	/* max allowed scheduler threads */
-	int			ibs_nthreads_max;
-	int			ibs_cpt;	/* CPT id */
+	spinlock_t         ibs_lock;     /* serialise */
+	wait_queue_head_t  ibs_waitq;    /* schedulers sleep here */
+	struct list_head   ibs_conns;    /* conns to check for rx completions */
+	int                ibs_nthreads; /* number of scheduler threads */
+	int                ibs_nthreads_max; /* max allowed scheduler threads */
+	int                ibs_cpt;      /* CPT id */
 };
 
 typedef struct {
-	int			kib_init;	/* initialisation state */
-	int			kib_shutdown;	/* shut down? */
-	struct list_head		kib_devs;	/* IB devices extant */
-	/* list head of failed devices */
-	struct list_head		kib_failed_devs;
-	/* schedulers sleep here */
-	wait_queue_head_t		kib_failover_waitq;
-	atomic_t		kib_nthreads;	/* # live threads */
-	/* stabilize net/dev/peer/conn ops */
-	rwlock_t		kib_global_lock;
-	/* hash table of all my known peers */
-	struct list_head		*kib_peers;
-	/* size of kib_peers */
-	int			kib_peer_hash_size;
-	/* the connd task (serialisation assertions) */
-	void			*kib_connd;
-	/* connections to setup/teardown */
-	struct list_head		kib_connd_conns;
-	/* connections with zero refcount */
-	struct list_head		kib_connd_zombies;
-	/* connection daemon sleeps here */
-	wait_queue_head_t		kib_connd_waitq;
-	spinlock_t		kib_connd_lock;	/* serialise */
-	struct ib_qp_attr	kib_error_qpa;	/* QP->ERROR */
-	/* percpt data for schedulers */
-	struct kib_sched_info	**kib_scheds;
+	int                   kib_init;           /* initialisation state */
+	int                   kib_shutdown;       /* shut down? */
+	struct list_head      kib_devs;           /* IB devices extant */
+	struct list_head      kib_failed_devs;    /* list head of failed
+						   * devices */
+	wait_queue_head_t     kib_failover_waitq; /* schedulers sleep here */
+	atomic_t              kib_nthreads;       /* # live threads */
+	rwlock_t              kib_global_lock;    /* stabilize net/dev/peer/conn
+						   * ops */
+	struct list_head      *kib_peers;         /* hash table of all my known
+						   * peers */
+	int                   kib_peer_hash_size; /* size of kib_peers */
+	void                  *kib_connd;         /* the connd task
+						   * (serialisation assertions)
+						   */
+	struct list_head      kib_connd_conns;    /* connections to
+						   * setup/teardown */
+	struct list_head      kib_connd_zombies;  /* connections with zero
+						   * refcount */
+	wait_queue_head_t     kib_connd_waitq;    /* connection daemon sleeps
+						   * here */
+	spinlock_t            kib_connd_lock;     /* serialise */
+	struct ib_qp_attr     kib_error_qpa;      /* QP->ERROR */
+	struct kib_sched_info **kib_scheds;       /* percpt data for schedulers
+						   */
 } kib_data_t;
 
-#define IBLND_INIT_NOTHING	 0
-#define IBLND_INIT_DATA	    1
-#define IBLND_INIT_ALL	     2
+#define IBLND_INIT_NOTHING 0
+#define IBLND_INIT_DATA    1
+#define IBLND_INIT_ALL     2
 
 /************************************************************************
  * IB Wire message format.
@@ -402,228 +405,243 @@ typedef struct {
  */
 
 typedef struct kib_connparams {
-	__u16	     ibcp_queue_depth;
-	__u16	     ibcp_max_frags;
-	__u32	     ibcp_max_msg_size;
+	__u16        ibcp_queue_depth;
+	__u16        ibcp_max_frags;
+	__u32        ibcp_max_msg_size;
 } WIRE_ATTR kib_connparams_t;
 
 typedef struct {
-	lnet_hdr_t	ibim_hdr;	     /* portals header */
-	char	      ibim_payload[0];      /* piggy-backed payload */
+	lnet_hdr_t   ibim_hdr;        /* portals header */
+	char         ibim_payload[0]; /* piggy-backed payload */
 } WIRE_ATTR kib_immediate_msg_t;
 
 typedef struct {
-	__u32	     rf_nob;	       /* # bytes this frag */
-	__u64	     rf_addr;	      /* CAVEAT EMPTOR: misaligned!! */
+	__u32        rf_nob;          /* # bytes this frag */
+	__u64        rf_addr;         /* CAVEAT EMPTOR: misaligned!! */
 } WIRE_ATTR kib_rdma_frag_t;
 
 typedef struct {
-	__u32	     rd_key;	       /* local/remote key */
-	__u32	     rd_nfrags;	    /* # fragments */
-	kib_rdma_frag_t   rd_frags[0];	  /* buffer frags */
+	__u32           rd_key;       /* local/remote key */
+	__u32           rd_nfrags;    /* # fragments */
+	kib_rdma_frag_t rd_frags[0];  /* buffer frags */
 } WIRE_ATTR kib_rdma_desc_t;
 
 typedef struct {
-	lnet_hdr_t	ibprm_hdr;	    /* portals header */
-	__u64	     ibprm_cookie;	 /* opaque completion cookie */
+	lnet_hdr_t      ibprm_hdr;    /* portals header */
+	__u64           ibprm_cookie; /* opaque completion cookie */
 } WIRE_ATTR kib_putreq_msg_t;
 
 typedef struct {
-	__u64	     ibpam_src_cookie;     /* reflected completion cookie */
-	__u64	     ibpam_dst_cookie;     /* opaque completion cookie */
-	kib_rdma_desc_t   ibpam_rd;	     /* sender's sink buffer */
+	__u64           ibpam_src_cookie; /* reflected completion cookie */
+	__u64           ibpam_dst_cookie; /* opaque completion cookie */
+	kib_rdma_desc_t ibpam_rd;         /* sender's sink buffer */
 } WIRE_ATTR kib_putack_msg_t;
 
 typedef struct {
-	lnet_hdr_t	ibgm_hdr;	     /* portals header */
-	__u64	     ibgm_cookie;	  /* opaque completion cookie */
-	kib_rdma_desc_t   ibgm_rd;	      /* rdma descriptor */
+	lnet_hdr_t      ibgm_hdr;     /* portals header */
+	__u64           ibgm_cookie;  /* opaque completion cookie */
+	kib_rdma_desc_t ibgm_rd;      /* rdma descriptor */
 } WIRE_ATTR kib_get_msg_t;
 
 typedef struct {
-	__u64	     ibcm_cookie;	  /* opaque completion cookie */
-	__s32	     ibcm_status;	  /* < 0 failure: >= 0 length */
+	__u64           ibcm_cookie;  /* opaque completion cookie */
+	__s32           ibcm_status;  /* < 0 failure: >= 0 length */
 } WIRE_ATTR kib_completion_msg_t;
 
 typedef struct {
 	/* First 2 fields fixed FOR ALL TIME */
-	__u32	     ibm_magic;	    /* I'm an ibnal message */
-	__u16	     ibm_version;	  /* this is my version number */
-
-	__u8	      ibm_type;	     /* msg type */
-	__u8	      ibm_credits;	  /* returned credits */
-	__u32	     ibm_nob;	      /* # bytes in whole message */
-	__u32	     ibm_cksum;	    /* checksum (0 = no checksum) */
-	__u64	     ibm_srcnid;	   /* sender's NID */
-	__u64	     ibm_srcstamp;	 /* sender's incarnation */
-	__u64	     ibm_dstnid;	   /* destination's NID */
-	__u64	     ibm_dststamp;	 /* destination's incarnation */
+	__u32           ibm_magic;    /* I'm an ibnal message */
+	__u16           ibm_version;  /* this is my version number */
+
+	__u8            ibm_type;     /* msg type */
+	__u8            ibm_credits;  /* returned credits */
+	__u32           ibm_nob;      /* # bytes in whole message */
+	__u32           ibm_cksum;    /* checksum (0 = no checksum) */
+	__u64           ibm_srcnid;   /* sender's NID */
+	__u64           ibm_srcstamp; /* sender's incarnation */
+	__u64           ibm_dstnid;   /* destination's NID */
+	__u64           ibm_dststamp; /* destination's incarnation */
 
 	union {
-		kib_connparams_t      connparams;
-		kib_immediate_msg_t   immediate;
-		kib_putreq_msg_t      putreq;
-		kib_putack_msg_t      putack;
-		kib_get_msg_t	 get;
-		kib_completion_msg_t  completion;
+		kib_connparams_t     connparams;
+		kib_immediate_msg_t  immediate;
+		kib_putreq_msg_t     putreq;
+		kib_putack_msg_t     putack;
+		kib_get_msg_t        get;
+		kib_completion_msg_t completion;
 	} WIRE_ATTR ibm_u;
 } WIRE_ATTR kib_msg_t;
 
-#define IBLND_MSG_MAGIC LNET_PROTO_IB_MAGIC	/* unique magic */
+#define IBLND_MSG_MAGIC     LNET_PROTO_IB_MAGIC /* unique magic */
 
-#define IBLND_MSG_VERSION_1	 0x11
-#define IBLND_MSG_VERSION_2	 0x12
-#define IBLND_MSG_VERSION	   IBLND_MSG_VERSION_2
+#define IBLND_MSG_VERSION_1 0x11
+#define IBLND_MSG_VERSION_2 0x12
+#define IBLND_MSG_VERSION   IBLND_MSG_VERSION_2
 
-#define IBLND_MSG_CONNREQ	   0xc0	/* connection request */
-#define IBLND_MSG_CONNACK	   0xc1	/* connection acknowledge */
-#define IBLND_MSG_NOOP	      0xd0	/* nothing (just credits) */
-#define IBLND_MSG_IMMEDIATE	 0xd1	/* immediate */
-#define IBLND_MSG_PUT_REQ	   0xd2	/* putreq (src->sink) */
-#define IBLND_MSG_PUT_NAK	   0xd3	/* completion (sink->src) */
-#define IBLND_MSG_PUT_ACK	   0xd4	/* putack (sink->src) */
-#define IBLND_MSG_PUT_DONE	  0xd5	/* completion (src->sink) */
-#define IBLND_MSG_GET_REQ	   0xd6	/* getreq (sink->src) */
-#define IBLND_MSG_GET_DONE	  0xd7	/* completion (src->sink: all OK) */
+#define IBLND_MSG_CONNREQ   0xc0	/* connection request */
+#define IBLND_MSG_CONNACK   0xc1	/* connection acknowledge */
+#define IBLND_MSG_NOOP      0xd0	/* nothing (just credits) */
+#define IBLND_MSG_IMMEDIATE 0xd1	/* immediate */
+#define IBLND_MSG_PUT_REQ   0xd2	/* putreq (src->sink) */
+#define IBLND_MSG_PUT_NAK   0xd3	/* completion (sink->src) */
+#define IBLND_MSG_PUT_ACK   0xd4	/* putack (sink->src) */
+#define IBLND_MSG_PUT_DONE  0xd5	/* completion (src->sink) */
+#define IBLND_MSG_GET_REQ   0xd6	/* getreq (sink->src) */
+#define IBLND_MSG_GET_DONE  0xd7	/* completion (src->sink: all OK) */
 
 typedef struct {
-	__u32	    ibr_magic;	     /* sender's magic */
-	__u16	    ibr_version;	   /* sender's version */
-	__u8	     ibr_why;	       /* reject reason */
-	__u8	     ibr_padding;	   /* padding */
-	__u64	    ibr_incarnation;       /* incarnation of peer */
-	kib_connparams_t ibr_cp;		/* connection parameters */
+	__u32            ibr_magic;       /* sender's magic */
+	__u16            ibr_version;     /* sender's version */
+	__u8             ibr_why;         /* reject reason */
+	__u8             ibr_padding;     /* padding */
+	__u64            ibr_incarnation; /* incarnation of peer */
+	kib_connparams_t ibr_cp;          /* connection parameters */
 } WIRE_ATTR kib_rej_t;
 
 /* connection rejection reasons */
-#define IBLND_REJECT_CONN_RACE       1	  /* You lost connection race */
-#define IBLND_REJECT_NO_RESOURCES    2	  /* Out of memory/conns etc */
-#define IBLND_REJECT_FATAL	   3	  /* Anything else */
-
-#define IBLND_REJECT_CONN_UNCOMPAT   4	  /* incompatible version peer */
-#define IBLND_REJECT_CONN_STALE      5	  /* stale peer */
-
-#define IBLND_REJECT_RDMA_FRAGS      6	  /* Fatal: peer's rdma frags can't match mine */
-#define IBLND_REJECT_MSG_QUEUE_SIZE  7	  /* Fatal: peer's msg queue size can't match mine */
+#define IBLND_REJECT_CONN_RACE      1 /* You lost connection race */
+#define IBLND_REJECT_NO_RESOURCES   2 /* Out of memory/conns etc */
+#define IBLND_REJECT_FATAL          3 /* Anything else */
+#define IBLND_REJECT_CONN_UNCOMPAT  4 /* incompatible version peer */
+#define IBLND_REJECT_CONN_STALE     5 /* stale peer */
+#define IBLND_REJECT_RDMA_FRAGS     6 /* Fatal: peer's rdma frags can't match
+				       * mine */
+#define IBLND_REJECT_MSG_QUEUE_SIZE 7 /* Fatal: peer's msg queue size can't
+				       * match mine */
 
 /***********************************************************************/
 
-typedef struct kib_rx			   /* receive message */
+typedef struct kib_rx                         /* receive message */
 {
-	struct list_head		rx_list;      /* queue for attention */
-	struct kib_conn	  *rx_conn;      /* owning conn */
-	int		       rx_nob;       /* # bytes received (-1 while posted) */
-	enum ib_wc_status	 rx_status;    /* completion status */
-	kib_msg_t		*rx_msg;       /* message buffer (host vaddr) */
-	__u64		     rx_msgaddr;   /* message buffer (I/O addr) */
-	DECLARE_PCI_UNMAP_ADDR   (rx_msgunmap); /* for dma_unmap_single() */
-	struct ib_recv_wr	 rx_wrq;       /* receive work item... */
-	struct ib_sge	     rx_sge;       /* ...and its memory */
+	struct list_head       rx_list;       /* queue for attention */
+	struct kib_conn        *rx_conn;      /* owning conn */
+	int                    rx_nob;        /* # bytes received (-1 while
+					       * posted) */
+	enum ib_wc_status      rx_status;     /* completion status */
+	kib_msg_t              *rx_msg;       /* message buffer (host vaddr) */
+	__u64                  rx_msgaddr;    /* message buffer (I/O addr) */
+	DECLARE_PCI_UNMAP_ADDR (rx_msgunmap); /* for dma_unmap_single() */
+	struct ib_recv_wr      rx_wrq;        /* receive work item... */
+	struct ib_sge          rx_sge;        /* ...and its memory */
 } kib_rx_t;
 
-#define IBLND_POSTRX_DONT_POST    0	     /* don't post */
-#define IBLND_POSTRX_NO_CREDIT    1	     /* post: no credits */
-#define IBLND_POSTRX_PEER_CREDIT  2	     /* post: give peer back 1 credit */
-#define IBLND_POSTRX_RSRVD_CREDIT 3	     /* post: give myself back 1 reserved credit */
+#define IBLND_POSTRX_DONT_POST    0   /* don't post */
+#define IBLND_POSTRX_NO_CREDIT    1   /* post: no credits */
+#define IBLND_POSTRX_PEER_CREDIT  2   /* post: give peer back 1 credit */
+#define IBLND_POSTRX_RSRVD_CREDIT 3   /* post: give myself back 1 reserved
+				       * credit */
 
-typedef struct kib_tx			   /* transmit message */
+typedef struct kib_tx                         /* transmit message */
 {
-	struct list_head		tx_list;      /* queue on idle_txs ibc_tx_queue etc. */
-	kib_tx_pool_t	    *tx_pool;      /* pool I'm from */
-	struct kib_conn	  *tx_conn;      /* owning conn */
-	short		     tx_sending;   /* # tx callbacks outstanding */
-	short		     tx_queued;    /* queued for sending */
-	short		     tx_waiting;   /* waiting for peer */
-	int		       tx_status;    /* LNET completion status */
-	unsigned long	     tx_deadline;  /* completion deadline */
-	__u64		     tx_cookie;    /* completion cookie */
-	lnet_msg_t	       *tx_lntmsg[2]; /* lnet msgs to finalize on completion */
-	kib_msg_t		*tx_msg;       /* message buffer (host vaddr) */
-	__u64		     tx_msgaddr;   /* message buffer (I/O addr) */
-	DECLARE_PCI_UNMAP_ADDR   (tx_msgunmap); /* for dma_unmap_single() */
-	int		       tx_nwrq;      /* # send work items */
-	struct ib_send_wr	*tx_wrq;       /* send work items... */
-	struct ib_sge	    *tx_sge;       /* ...and their memory */
-	kib_rdma_desc_t	  *tx_rd;	/* rdma descriptor */
-	int		       tx_nfrags;    /* # entries in... */
-	struct scatterlist       *tx_frags;     /* dma_map_sg descriptor */
-	__u64		    *tx_pages;     /* rdma phys page addrs */
+	struct list_head       tx_list;       /* queue on idle_txs ibc_tx_queue
+					       * etc. */
+	kib_tx_pool_t          *tx_pool;      /* pool I'm from */
+	struct kib_conn        *tx_conn;      /* owning conn */
+	short                  tx_sending;    /* # tx callbacks outstanding */
+	short                  tx_queued;     /* queued for sending */
+	short                  tx_waiting;    /* waiting for peer */
+	int                    tx_status;     /* LNET completion status */
+	unsigned long          tx_deadline;   /* completion deadline */
+	__u64                  tx_cookie;     /* completion cookie */
+	lnet_msg_t             *tx_lntmsg[2]; /* lnet msgs to finalize on
+					       * completion */
+	kib_msg_t              *tx_msg;       /* message buffer (host vaddr) */
+	__u64                  tx_msgaddr;    /* message buffer (I/O addr) */
+	DECLARE_PCI_UNMAP_ADDR (tx_msgunmap); /* for dma_unmap_single() */
+	int                    tx_nwrq;       /* # send work items */
+	struct ib_send_wr      *tx_wrq;       /* send work items... */
+	struct ib_sge          *tx_sge;       /* ...and their memory */
+	kib_rdma_desc_t        *tx_rd;        /* rdma descriptor */
+	int                    tx_nfrags;     /* # entries in... */
+	struct scatterlist     *tx_frags;     /* dma_map_sg descriptor */
+	__u64                  *tx_pages;     /* rdma phys page addrs */
 	union {
-		kib_phys_mr_t      *pmr;	/* MR for physical buffer */
-		kib_fmr_t	   fmr;	/* FMR */
-	}			 tx_u;
-	int		       tx_dmadir;    /* dma direction */
+		kib_phys_mr_t  *pmr;          /* MR for physical buffer */
+		kib_fmr_t      fmr;           /* FMR */
+	}                      tx_u;
+	int                    tx_dmadir;     /* dma direction */
 } kib_tx_t;
 
 typedef struct kib_connvars {
-	/* connection-in-progress variables */
-	kib_msg_t		 cv_msg;
+	kib_msg_t cv_msg; /* connection-in-progress variables */
 } kib_connvars_t;
 
 typedef struct kib_conn {
-	struct kib_sched_info *ibc_sched;	/* scheduler information */
-	struct kib_peer     *ibc_peer;	  /* owning peer */
-	kib_hca_dev_t       *ibc_hdev;	  /* HCA bound on */
-	struct list_head	   ibc_list;	  /* stash on peer's conn list */
-	struct list_head	   ibc_sched_list;    /* schedule for attention */
-	__u16		ibc_version;       /* version of connection */
-	__u64		ibc_incarnation;   /* which instance of the peer */
-	atomic_t	 ibc_refcount;      /* # users */
-	int		  ibc_state;	 /* what's happening */
-	int		  ibc_nsends_posted; /* # uncompleted sends */
-	int		  ibc_noops_posted;  /* # uncompleted NOOPs */
-	int		  ibc_credits;       /* # credits I have */
-	int		  ibc_outstanding_credits; /* # credits to return */
-	int		  ibc_reserved_credits;/* # ACK/DONE msg credits */
-	int		  ibc_comms_error;   /* set on comms error */
-	unsigned int	     ibc_nrx:16;	/* receive buffers owned */
-	unsigned int	     ibc_scheduled:1;   /* scheduled for attention */
-	unsigned int	     ibc_ready:1;       /* CQ callback fired */
-	/* time of last send */
-	unsigned long	ibc_last_send;
-	/** link chain for kiblnd_check_conns only */
-	struct list_head	   ibc_connd_list;
-	/** rxs completed before ESTABLISHED */
-	struct list_head	   ibc_early_rxs;
-	/** IBLND_MSG_NOOPs for IBLND_MSG_VERSION_1 */
-	struct list_head	   ibc_tx_noops;
-	struct list_head	   ibc_tx_queue;       /* sends that need a credit */
-	struct list_head	   ibc_tx_queue_nocred;/* sends that don't need a credit */
-	struct list_head	   ibc_tx_queue_rsrvd; /* sends that need to reserve an ACK/DONE msg */
-	struct list_head	   ibc_active_txs;     /* active tx awaiting completion */
-	spinlock_t	     ibc_lock;		 /* serialise */
-	kib_rx_t	    *ibc_rxs;	    /* the rx descs */
-	kib_pages_t	 *ibc_rx_pages;       /* premapped rx msg pages */
-
-	struct rdma_cm_id   *ibc_cmid;	   /* CM id */
-	struct ib_cq	*ibc_cq;	     /* completion queue */
-
-	kib_connvars_t      *ibc_connvars;       /* in-progress connection state */
+	struct kib_sched_info *ibc_sched;           /* scheduler information */
+	struct kib_peer       *ibc_peer;            /* owning peer */
+	kib_hca_dev_t         *ibc_hdev;            /* HCA bound on */
+	struct list_head      ibc_list;             /* stash on peer's conn
+						     * list */
+	struct list_head      ibc_sched_list;       /* schedule for attention */
+	__u16                 ibc_version;          /* version of connection */
+	__u64                 ibc_incarnation;      /* which instance of the
+						     * peer */
+	atomic_t              ibc_refcount;         /* # users */
+	int                   ibc_state;            /* what's happening */
+	int                   ibc_nsends_posted;    /* # uncompleted sends */
+	int                   ibc_noops_posted;     /* # uncompleted NOOPs */
+	int                   ibc_credits;          /* # credits I have */
+	int                   ibc_outstanding_credits; /* # credits to return */
+	int                   ibc_reserved_credits; /* # ACK/DONE msg credits */
+	int                   ibc_comms_error;      /* set on comms error */
+	unsigned int          ibc_nrx:16;           /* receive buffers owned */
+	unsigned int          ibc_scheduled:1;      /* scheduled for attention
+						     */
+	unsigned int          ibc_ready:1;          /* CQ callback fired */
+	unsigned long         ibc_last_send;        /* time of last send */
+	struct list_head      ibc_connd_list;       /* link chain for
+						     * kiblnd_check_conns only
+						     */
+	struct list_head      ibc_early_rxs;        /* rxs completed before
+						     * ESTABLISHED */
+	struct list_head      ibc_tx_noops;         /* IBLND_MSG_NOOPs for
+						     * IBLND_MSG_VERSION_1 */
+	struct list_head      ibc_tx_queue;         /* sends that need a credit
+						     */
+	struct list_head      ibc_tx_queue_nocred;  /* sends that don't need a
+						     * credit */
+	struct list_head      ibc_tx_queue_rsrvd;   /* sends that need to
+						     * reserve an ACK/DONE msg
+						     */
+	struct list_head      ibc_active_txs;       /* active tx awaiting
+						     * completion */
+	spinlock_t            ibc_lock;             /* serialise */
+	kib_rx_t              *ibc_rxs;             /* the rx descs */
+	kib_pages_t           *ibc_rx_pages;        /* premapped rx msg pages */
+
+	struct rdma_cm_id     *ibc_cmid;            /* CM id */
+	struct ib_cq          *ibc_cq;              /* completion queue */
+
+	kib_connvars_t        *ibc_connvars;        /* in-progress connection
+						     * state */
 } kib_conn_t;
 
-#define IBLND_CONN_INIT	       0	 /* being initialised */
-#define IBLND_CONN_ACTIVE_CONNECT     1	 /* active sending req */
-#define IBLND_CONN_PASSIVE_WAIT       2	 /* passive waiting for rtu */
-#define IBLND_CONN_ESTABLISHED	3	 /* connection established */
-#define IBLND_CONN_CLOSING	    4	 /* being closed */
-#define IBLND_CONN_DISCONNECTED       5	 /* disconnected */
+#define IBLND_CONN_INIT           0	 /* being initialised */
+#define IBLND_CONN_ACTIVE_CONNECT 1	 /* active sending req */
+#define IBLND_CONN_PASSIVE_WAIT   2	 /* passive waiting for rtu */
+#define IBLND_CONN_ESTABLISHED    3	 /* connection established */
+#define IBLND_CONN_CLOSING        4	 /* being closed */
+#define IBLND_CONN_DISCONNECTED   5	 /* disconnected */
 
 typedef struct kib_peer {
-	struct list_head	   ibp_list;	   /* stash on global peer list */
-	lnet_nid_t	   ibp_nid;	    /* who's on the other end(s) */
-	lnet_ni_t	   *ibp_ni;	     /* LNet interface */
-	atomic_t	 ibp_refcount;       /* # users */
-	struct list_head	   ibp_conns;	  /* all active connections */
-	struct list_head	   ibp_tx_queue;       /* msgs waiting for a conn */
-	__u16		ibp_version;	/* version of peer */
-	__u64		ibp_incarnation;    /* incarnation of peer */
-	int		  ibp_connecting;     /* current active connection attempts */
-	int		  ibp_accepting;      /* current passive connection attempts */
-	int		  ibp_error;	  /* errno on closing this peer */
-	unsigned long	   ibp_last_alive;     /* when (in jiffies) I was last alive */
+	struct list_head ibp_list;        /* stash on global peer list */
+	lnet_nid_t       ibp_nid;         /* who's on the other end(s) */
+	lnet_ni_t        *ibp_ni;         /* LNet interface */
+	atomic_t         ibp_refcount;    /* # users */
+	struct list_head ibp_conns;       /* all active connections */
+	struct list_head ibp_tx_queue;    /* msgs waiting for a conn */
+	__u16            ibp_version;     /* version of peer */
+	__u64            ibp_incarnation; /* incarnation of peer */
+	int              ibp_connecting;  /* current active connection attempts
+					   */
+	int              ibp_accepting;   /* current passive connection attempts
+					   */
+	int              ibp_error;       /* errno on closing this peer */
+	unsigned long    ibp_last_alive;  /* when (in jiffies) I was last alive
+					   */
 } kib_peer_t;
 
-extern kib_data_t      kiblnd_data;
+extern kib_data_t kiblnd_data;
 
 extern void kiblnd_hdev_destroy(kib_hca_dev_t *hdev);
 
@@ -941,8 +959,8 @@ static inline unsigned int kiblnd_sg_dma_len(struct ib_device *dev,
  * right because OFED1.2 defines it as const, to use it we have to add
  * (void *) cast to overcome "const" */
 
-#define KIBLND_CONN_PARAM(e)	    ((e)->param.conn.private_data)
-#define KIBLND_CONN_PARAM_LEN(e)	((e)->param.conn.private_data_len)
+#define KIBLND_CONN_PARAM(e)     ((e)->param.conn.private_data)
+#define KIBLND_CONN_PARAM_LEN(e) ((e)->param.conn.private_data_len)
 
 
 struct ib_mr *kiblnd_find_rd_dma_mr(kib_hca_dev_t *hdev,
diff --git a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c
index dbf3749..477aa8b 100644
--- a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c
+++ b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c
@@ -44,9 +44,9 @@ static void
 kiblnd_tx_done(lnet_ni_t *ni, kib_tx_t *tx)
 {
 	lnet_msg_t *lntmsg[2];
-	kib_net_t  *net = ni->ni_data;
-	int	 rc;
-	int	 i;
+	kib_net_t *net = ni->ni_data;
+	int rc;
+	int i;
 
 	LASSERT(net != NULL);
 	LASSERT(!in_interrupt());
@@ -102,10 +102,10 @@ kiblnd_txlist_done(lnet_ni_t *ni, struct list_head *txlist, int status)
 static kib_tx_t *
 kiblnd_get_idle_tx(lnet_ni_t *ni, lnet_nid_t target)
 {
-	kib_net_t		*net = (kib_net_t *)ni->ni_data;
-	struct list_head		*node;
-	kib_tx_t		*tx;
-	kib_tx_poolset_t	*tps;
+	kib_net_t *net = (kib_net_t *)ni->ni_data;
+	struct list_head *node;
+	kib_tx_t *tx;
+	kib_tx_poolset_t *tps;
 
 	tps = net->ibn_tx_ps[lnet_cpt_of_nid(target)];
 	node = kiblnd_pool_alloc_node(&tps->tps_poolset);
@@ -130,9 +130,9 @@ kiblnd_get_idle_tx(lnet_ni_t *ni, lnet_nid_t target)
 static void
 kiblnd_drop_rx(kib_rx_t *rx)
 {
-	kib_conn_t		*conn	= rx->rx_conn;
-	struct kib_sched_info	*sched	= conn->ibc_sched;
-	unsigned long		flags;
+	kib_conn_t *conn = rx->rx_conn;
+	struct kib_sched_info *sched = conn->ibc_sched;
+	unsigned long flags;
 
 	spin_lock_irqsave(&sched->ibs_lock, flags);
 	LASSERT(conn->ibc_nrx > 0);
@@ -145,11 +145,11 @@ kiblnd_drop_rx(kib_rx_t *rx)
 int
 kiblnd_post_rx(kib_rx_t *rx, int credit)
 {
-	kib_conn_t	 *conn = rx->rx_conn;
-	kib_net_t	  *net = conn->ibc_peer->ibp_ni->ni_data;
-	struct ib_recv_wr  *bad_wrq = NULL;
-	struct ib_mr       *mr;
-	int		 rc;
+	kib_conn_t *conn = rx->rx_conn;
+	kib_net_t *net = conn->ibc_peer->ibp_ni->ni_data;
+	struct ib_recv_wr *bad_wrq = NULL;
+	struct ib_mr *mr;
+	int rc;
 
 	LASSERT(net != NULL);
 	LASSERT(!in_interrupt());
@@ -164,10 +164,10 @@ kiblnd_post_rx(kib_rx_t *rx, int credit)
 	rx->rx_sge.addr   = rx->rx_msgaddr;
 	rx->rx_sge.length = IBLND_MSG_SIZE;
 
-	rx->rx_wrq.next = NULL;
+	rx->rx_wrq.next    = NULL;
 	rx->rx_wrq.sg_list = &rx->rx_sge;
 	rx->rx_wrq.num_sge = 1;
-	rx->rx_wrq.wr_id = kiblnd_ptr2wreqid(rx, IBLND_WID_RX);
+	rx->rx_wrq.wr_id   = kiblnd_ptr2wreqid(rx, IBLND_WID_RX);
 
 	LASSERT(conn->ibc_state >= IBLND_CONN_INIT);
 	LASSERT(rx->rx_nob >= 0);	      /* not posted */
@@ -212,7 +212,7 @@ kiblnd_post_rx(kib_rx_t *rx, int credit)
 static kib_tx_t *
 kiblnd_find_waiting_tx_locked(kib_conn_t *conn, int txtype, __u64 cookie)
 {
-	struct list_head   *tmp;
+	struct list_head *tmp;
 
 	list_for_each(tmp, &conn->ibc_active_txs) {
 		kib_tx_t *tx = list_entry(tmp, kib_tx_t, tx_list);
@@ -237,9 +237,9 @@ kiblnd_find_waiting_tx_locked(kib_conn_t *conn, int txtype, __u64 cookie)
 static void
 kiblnd_handle_completion(kib_conn_t *conn, int txtype, int status, __u64 cookie)
 {
-	kib_tx_t    *tx;
-	lnet_ni_t   *ni = conn->ibc_peer->ibp_ni;
-	int	  idle;
+	kib_tx_t *tx;
+	lnet_ni_t *ni = conn->ibc_peer->ibp_ni;
+	int idle;
 
 	spin_lock(&conn->ibc_lock);
 
@@ -276,8 +276,8 @@ kiblnd_handle_completion(kib_conn_t *conn, int txtype, int status, __u64 cookie)
 static void
 kiblnd_send_completion(kib_conn_t *conn, int type, int status, __u64 cookie)
 {
-	lnet_ni_t   *ni = conn->ibc_peer->ibp_ni;
-	kib_tx_t    *tx = kiblnd_get_idle_tx(ni, conn->ibc_peer->ibp_nid);
+	lnet_ni_t *ni = conn->ibc_peer->ibp_ni;
+	kib_tx_t *tx = kiblnd_get_idle_tx(ni, conn->ibc_peer->ibp_nid);
 
 	if (tx = NULL) {
 		CERROR("Can't get tx for completion %x for %s\n",
@@ -295,14 +295,14 @@ kiblnd_send_completion(kib_conn_t *conn, int type, int status, __u64 cookie)
 static void
 kiblnd_handle_rx(kib_rx_t *rx)
 {
-	kib_msg_t    *msg = rx->rx_msg;
-	kib_conn_t   *conn = rx->rx_conn;
-	lnet_ni_t    *ni = conn->ibc_peer->ibp_ni;
-	int	   credits = msg->ibm_credits;
-	kib_tx_t     *tx;
-	int	   rc = 0;
-	int	   rc2;
-	int	   post_credit;
+	kib_msg_t *msg = rx->rx_msg;
+	kib_conn_t *conn = rx->rx_conn;
+	lnet_ni_t *ni = conn->ibc_peer->ibp_ni;
+	int credits = msg->ibm_credits;
+	kib_tx_t *tx;
+	int rc = 0;
+	int rc2;
+	int post_credit;
 
 	LASSERT(conn->ibc_state >= IBLND_CONN_ESTABLISHED);
 
@@ -456,12 +456,12 @@ kiblnd_handle_rx(kib_rx_t *rx)
 static void
 kiblnd_rx_complete(kib_rx_t *rx, int status, int nob)
 {
-	kib_msg_t    *msg = rx->rx_msg;
-	kib_conn_t   *conn = rx->rx_conn;
-	lnet_ni_t    *ni = conn->ibc_peer->ibp_ni;
-	kib_net_t    *net = ni->ni_data;
-	int	   rc;
-	int	   err = -EIO;
+	kib_msg_t *msg = rx->rx_msg;
+	kib_conn_t *conn = rx->rx_conn;
+	lnet_ni_t *ni = conn->ibc_peer->ibp_ni;
+	kib_net_t *net = ni->ni_data;
+	int rc;
+	int err = -EIO;
 
 	LASSERT(net != NULL);
 	LASSERT(rx->rx_nob < 0);	       /* was posted */
@@ -502,8 +502,8 @@ kiblnd_rx_complete(kib_rx_t *rx, int status, int nob)
 	/* racing with connection establishment/teardown! */
 
 	if (conn->ibc_state < IBLND_CONN_ESTABLISHED) {
-		rwlock_t  *g_lock = &kiblnd_data.kib_global_lock;
-		unsigned long  flags;
+		rwlock_t *g_lock = &kiblnd_data.kib_global_lock;
+		unsigned long flags;
 
 		write_lock_irqsave(g_lock, flags);
 		/* must check holding global lock to eliminate race */
@@ -550,19 +550,19 @@ kiblnd_kvaddr_to_page(unsigned long vaddr)
 static int
 kiblnd_fmr_map_tx(kib_net_t *net, kib_tx_t *tx, kib_rdma_desc_t *rd, int nob)
 {
-	kib_hca_dev_t		*hdev;
-	__u64			*pages = tx->tx_pages;
-	kib_fmr_poolset_t	*fps;
-	int			npages;
-	int			size;
-	int			cpt;
-	int			rc;
-	int			i;
+	kib_hca_dev_t *hdev;
+	__u64 *pages = tx->tx_pages;
+	kib_fmr_poolset_t *fps;
+	int npages;
+	int size;
+	int cpt;
+	int rc;
+	int i;
 
 	LASSERT(tx->tx_pool != NULL);
 	LASSERT(tx->tx_pool->tpo_pool.po_owner != NULL);
 
-	hdev  = tx->tx_pool->tpo_hdev;
+	hdev = tx->tx_pool->tpo_hdev;
 
 	for (i = 0, npages = 0; i < rd->rd_nfrags; i++) {
 		for (size = 0; size <  rd->rd_frags[i].rf_nob;
@@ -586,7 +586,7 @@ kiblnd_fmr_map_tx(kib_net_t *net, kib_tx_t *tx, kib_rdma_desc_t *rd, int nob)
 	rd->rd_key = (rd != tx->tx_rd) ? tx->tx_u.fmr.fmr_pfmr->fmr->rkey :
 					 tx->tx_u.fmr.fmr_pfmr->fmr->lkey;
 	rd->rd_frags[0].rf_addr &= ~hdev->ibh_page_mask;
-	rd->rd_frags[0].rf_nob   = nob;
+	rd->rd_frags[0].rf_nob = nob;
 	rd->rd_nfrags = 1;
 
 	return 0;
@@ -595,11 +595,11 @@ kiblnd_fmr_map_tx(kib_net_t *net, kib_tx_t *tx, kib_rdma_desc_t *rd, int nob)
 static int
 kiblnd_pmr_map_tx(kib_net_t *net, kib_tx_t *tx, kib_rdma_desc_t *rd, int nob)
 {
-	kib_hca_dev_t		*hdev;
-	kib_pmr_poolset_t	*pps;
-	__u64			iova;
-	int			cpt;
-	int			rc;
+	kib_hca_dev_t *hdev;
+	kib_pmr_poolset_t *pps;
+	__u64 iova;
+	int cpt;
+	int rc;
 
 	LASSERT(tx->tx_pool != NULL);
 	LASSERT(tx->tx_pool->tpo_pool.po_owner != NULL);
@@ -623,7 +623,7 @@ kiblnd_pmr_map_tx(kib_net_t *net, kib_tx_t *tx, kib_rdma_desc_t *rd, int nob)
 					 tx->tx_u.pmr->pmr_mr->lkey;
 	rd->rd_nfrags = 1;
 	rd->rd_frags[0].rf_addr = iova;
-	rd->rd_frags[0].rf_nob  = nob;
+	rd->rd_frags[0].rf_nob = nob;
 
 	return 0;
 }
@@ -631,7 +631,7 @@ kiblnd_pmr_map_tx(kib_net_t *net, kib_tx_t *tx, kib_rdma_desc_t *rd, int nob)
 void
 kiblnd_unmap_tx(lnet_ni_t *ni, kib_tx_t *tx)
 {
-	kib_net_t  *net = ni->ni_data;
+	kib_net_t *net = ni->ni_data;
 
 	LASSERT(net != NULL);
 
@@ -655,20 +655,19 @@ int
 kiblnd_map_tx(lnet_ni_t *ni, kib_tx_t *tx,
 	      kib_rdma_desc_t *rd, int nfrags)
 {
-	kib_hca_dev_t      *hdev  = tx->tx_pool->tpo_hdev;
-	kib_net_t	  *net   = ni->ni_data;
-	struct ib_mr       *mr    = NULL;
-	__u32	       nob;
-	int		 i;
+	kib_hca_dev_t *hdev = tx->tx_pool->tpo_hdev;
+	kib_net_t *net = ni->ni_data;
+	struct ib_mr *mr    = NULL;
+	__u32 nob;
+	int i;
 
 	/* If rd is not tx_rd, it's going to get sent to a peer and I'm the
 	 * RDMA sink */
 	tx->tx_dmadir = (rd != tx->tx_rd) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
 	tx->tx_nfrags = nfrags;
 
-	rd->rd_nfrags -		kiblnd_dma_map_sg(hdev->ibh_ibdev,
-				  tx->tx_frags, tx->tx_nfrags, tx->tx_dmadir);
+	rd->rd_nfrags = kiblnd_dma_map_sg(hdev->ibh_ibdev, tx->tx_frags,
+					  tx->tx_nfrags, tx->tx_dmadir);
 
 	for (i = 0, nob = 0; i < rd->rd_nfrags; i++) {
 		rd->rd_frags[i].rf_nob  = kiblnd_sg_dma_len(
@@ -699,12 +698,12 @@ static int
 kiblnd_setup_rd_iov(lnet_ni_t *ni, kib_tx_t *tx, kib_rdma_desc_t *rd,
 		    unsigned int niov, struct kvec *iov, int offset, int nob)
 {
-	kib_net_t	  *net = ni->ni_data;
-	struct page	*page;
+	kib_net_t *net = ni->ni_data;
+	struct page *page;
 	struct scatterlist *sg;
-	unsigned long       vaddr;
-	int		 fragnob;
-	int		 page_offset;
+	unsigned long vaddr;
+	int fragnob;
+	int page_offset;
 
 	LASSERT(nob > 0);
 	LASSERT(niov > 0);
@@ -752,9 +751,9 @@ static int
 kiblnd_setup_rd_kiov(lnet_ni_t *ni, kib_tx_t *tx, kib_rdma_desc_t *rd,
 		      int nkiov, lnet_kiov_t *kiov, int offset, int nob)
 {
-	kib_net_t	  *net = ni->ni_data;
+	kib_net_t *net = ni->ni_data;
 	struct scatterlist *sg;
-	int		 fragnob;
+	int fragnob;
 
 	CDEBUG(D_NET, "niov %d offset %d nob %d\n", nkiov, offset, nob);
 
@@ -793,11 +792,11 @@ kiblnd_post_tx_locked(kib_conn_t *conn, kib_tx_t *tx, int credit)
 	__releases(conn->ibc_lock)
 	__acquires(conn->ibc_lock)
 {
-	kib_msg_t	 *msg = tx->tx_msg;
-	kib_peer_t	*peer = conn->ibc_peer;
-	int		ver = conn->ibc_version;
-	int		rc;
-	int		done;
+	kib_msg_t *msg = tx->tx_msg;
+	kib_peer_t *peer = conn->ibc_peer;
+	int ver = conn->ibc_version;
+	int rc;
+	int done;
 	struct ib_send_wr *bad_wrq;
 
 	LASSERT(tx->tx_queued);
@@ -878,8 +877,7 @@ kiblnd_post_tx_locked(kib_conn_t *conn, kib_tx_t *tx, int credit)
 		/* close_conn will launch failover */
 		rc = -ENETDOWN;
 	} else {
-		rc = ib_post_send(conn->ibc_cmid->qp,
-				  tx->tx_wrq, &bad_wrq);
+		rc = ib_post_send(conn->ibc_cmid->qp, tx->tx_wrq, &bad_wrq);
 	}
 
 	conn->ibc_last_send = jiffies;
@@ -925,9 +923,9 @@ kiblnd_post_tx_locked(kib_conn_t *conn, kib_tx_t *tx, int credit)
 void
 kiblnd_check_sends(kib_conn_t *conn)
 {
-	int	ver = conn->ibc_version;
+	int ver = conn->ibc_version;
 	lnet_ni_t *ni = conn->ibc_peer->ibp_ni;
-	kib_tx_t  *tx;
+	kib_tx_t *tx;
 
 	/* Don't send anything until after the connection is established */
 	if (conn->ibc_state < IBLND_CONN_ESTABLISHED) {
@@ -997,9 +995,9 @@ kiblnd_check_sends(kib_conn_t *conn)
 static void
 kiblnd_tx_complete(kib_tx_t *tx, int status)
 {
-	int	   failed = (status != IB_WC_SUCCESS);
-	kib_conn_t   *conn = tx->tx_conn;
-	int	   idle;
+	int failed = (status != IB_WC_SUCCESS);
+	kib_conn_t *conn = tx->tx_conn;
+	int idle;
 
 	LASSERT(tx->tx_sending > 0);
 
@@ -1051,11 +1049,11 @@ kiblnd_tx_complete(kib_tx_t *tx, int status)
 void
 kiblnd_init_tx_msg(lnet_ni_t *ni, kib_tx_t *tx, int type, int body_nob)
 {
-	kib_hca_dev_t     *hdev = tx->tx_pool->tpo_hdev;
-	struct ib_sge     *sge = &tx->tx_sge[tx->tx_nwrq];
+	kib_hca_dev_t *hdev = tx->tx_pool->tpo_hdev;
+	struct ib_sge *sge = &tx->tx_sge[tx->tx_nwrq];
 	struct ib_send_wr *wrq = &tx->tx_wrq[tx->tx_nwrq];
-	int		nob = offsetof(kib_msg_t, ibm_u) + body_nob;
-	struct ib_mr      *mr;
+	int nob = offsetof(kib_msg_t, ibm_u) + body_nob;
+	struct ib_mr *mr;
 
 	LASSERT(tx->tx_nwrq >= 0);
 	LASSERT(tx->tx_nwrq < IBLND_MAX_RDMA_FRAGS + 1);
@@ -1086,14 +1084,14 @@ int
 kiblnd_init_rdma(kib_conn_t *conn, kib_tx_t *tx, int type,
 		  int resid, kib_rdma_desc_t *dstrd, __u64 dstcookie)
 {
-	kib_msg_t	 *ibmsg = tx->tx_msg;
-	kib_rdma_desc_t   *srcrd = tx->tx_rd;
-	struct ib_sge     *sge = &tx->tx_sge[0];
+	kib_msg_t *ibmsg = tx->tx_msg;
+	kib_rdma_desc_t *srcrd = tx->tx_rd;
+	struct ib_sge *sge = &tx->tx_sge[0];
 	struct ib_send_wr *wrq = &tx->tx_wrq[0];
-	int		rc  = resid;
-	int		srcidx;
-	int		dstidx;
-	int		wrknob;
+	int rc  = resid;
+	int srcidx;
+	int dstidx;
+	int wrknob;
 
 	LASSERT(!in_interrupt());
 	LASSERT(tx->tx_nwrq = 0);
@@ -1144,7 +1142,7 @@ kiblnd_init_rdma(kib_conn_t *conn, kib_tx_t *tx, int type,
 		wrq->send_flags = 0;
 
 		wrq->wr.rdma.remote_addr = kiblnd_rd_frag_addr(dstrd, dstidx);
-		wrq->wr.rdma.rkey	= kiblnd_rd_frag_key(dstrd, dstidx);
+		wrq->wr.rdma.rkey        = kiblnd_rd_frag_key(dstrd, dstidx);
 
 		srcidx = kiblnd_rd_consume_frag(srcrd, srcidx, wrknob);
 		dstidx = kiblnd_rd_consume_frag(dstrd, dstidx, wrknob);
@@ -1170,7 +1168,7 @@ kiblnd_init_rdma(kib_conn_t *conn, kib_tx_t *tx, int type,
 void
 kiblnd_queue_tx_locked(kib_tx_t *tx, kib_conn_t *conn)
 {
-	struct list_head   *q;
+	struct list_head *q;
 
 	LASSERT(tx->tx_nwrq > 0);	      /* work items set up */
 	LASSERT(!tx->tx_queued);	       /* not queued for sending already */
@@ -1271,11 +1269,11 @@ static void
 kiblnd_connect_peer(kib_peer_t *peer)
 {
 	struct rdma_cm_id *cmid;
-	kib_dev_t	 *dev;
-	kib_net_t	 *net = peer->ibp_ni->ni_data;
+	kib_dev_t *dev;
+	kib_net_t *net = peer->ibp_ni->ni_data;
 	struct sockaddr_in srcaddr;
 	struct sockaddr_in dstaddr;
-	int		rc;
+	int rc;
 
 	LASSERT(net != NULL);
 	LASSERT(peer->ibp_connecting > 0);
@@ -1335,12 +1333,12 @@ kiblnd_connect_peer(kib_peer_t *peer)
 void
 kiblnd_launch_tx(lnet_ni_t *ni, kib_tx_t *tx, lnet_nid_t nid)
 {
-	kib_peer_t	*peer;
-	kib_peer_t	*peer2;
-	kib_conn_t	*conn;
-	rwlock_t	*g_lock = &kiblnd_data.kib_global_lock;
-	unsigned long      flags;
-	int		rc;
+	kib_peer_t *peer;
+	kib_peer_t *peer2;
+	kib_conn_t *conn;
+	rwlock_t *g_lock = &kiblnd_data.kib_global_lock;
+	unsigned long flags;
+	int rc;
 
 	/* If I get here, I've committed to send, so I complete the tx with
 	 * failure on any problems */
@@ -1456,20 +1454,20 @@ kiblnd_launch_tx(lnet_ni_t *ni, kib_tx_t *tx, lnet_nid_t nid)
 int
 kiblnd_send(lnet_ni_t *ni, void *private, lnet_msg_t *lntmsg)
 {
-	lnet_hdr_t       *hdr = &lntmsg->msg_hdr;
-	int	       type = lntmsg->msg_type;
+	lnet_hdr_t *hdr = &lntmsg->msg_hdr;
+	int type = lntmsg->msg_type;
 	lnet_process_id_t target = lntmsg->msg_target;
-	int	       target_is_router = lntmsg->msg_target_is_router;
-	int	       routing = lntmsg->msg_routing;
-	unsigned int      payload_niov = lntmsg->msg_niov;
-	struct kvec      *payload_iov = lntmsg->msg_iov;
-	lnet_kiov_t      *payload_kiov = lntmsg->msg_kiov;
-	unsigned int      payload_offset = lntmsg->msg_offset;
-	unsigned int      payload_nob = lntmsg->msg_len;
-	kib_msg_t	*ibmsg;
-	kib_tx_t	 *tx;
-	int	       nob;
-	int	       rc;
+	int target_is_router = lntmsg->msg_target_is_router;
+	int routing = lntmsg->msg_routing;
+	unsigned int payload_niov = lntmsg->msg_niov;
+	struct kvec *payload_iov = lntmsg->msg_iov;
+	lnet_kiov_t *payload_kiov = lntmsg->msg_kiov;
+	unsigned int payload_offset = lntmsg->msg_offset;
+	unsigned int payload_nob = lntmsg->msg_len;
+	kib_msg_t *ibmsg;
+	kib_tx_t *tx;
+	int nob;
+	int rc;
 
 	/* NB 'private' is different depending on what we're sending.... */
 
@@ -1628,13 +1626,13 @@ static void
 kiblnd_reply(lnet_ni_t *ni, kib_rx_t *rx, lnet_msg_t *lntmsg)
 {
 	lnet_process_id_t target = lntmsg->msg_target;
-	unsigned int      niov = lntmsg->msg_niov;
-	struct kvec      *iov = lntmsg->msg_iov;
-	lnet_kiov_t      *kiov = lntmsg->msg_kiov;
-	unsigned int      offset = lntmsg->msg_offset;
-	unsigned int      nob = lntmsg->msg_len;
-	kib_tx_t	 *tx;
-	int	       rc;
+	unsigned int niov = lntmsg->msg_niov;
+	struct kvec *iov = lntmsg->msg_iov;
+	lnet_kiov_t *kiov = lntmsg->msg_kiov;
+	unsigned int offset = lntmsg->msg_offset;
+	unsigned int nob = lntmsg->msg_len;
+	kib_tx_t *tx;
+	int rc;
 
 	tx = kiblnd_get_idle_tx(ni, rx->rx_conn->ibc_peer->ibp_nid);
 	if (tx = NULL) {
@@ -1691,14 +1689,14 @@ kiblnd_recv(lnet_ni_t *ni, void *private, lnet_msg_t *lntmsg, int delayed,
 	     unsigned int niov, struct kvec *iov, lnet_kiov_t *kiov,
 	     unsigned int offset, unsigned int mlen, unsigned int rlen)
 {
-	kib_rx_t    *rx = private;
-	kib_msg_t   *rxmsg = rx->rx_msg;
-	kib_conn_t  *conn = rx->rx_conn;
-	kib_tx_t    *tx;
-	kib_msg_t   *txmsg;
-	int	  nob;
-	int	  post_credit = IBLND_POSTRX_PEER_CREDIT;
-	int	  rc = 0;
+	kib_rx_t *rx = private;
+	kib_msg_t *rxmsg = rx->rx_msg;
+	kib_conn_t *conn = rx->rx_conn;
+	kib_tx_t *tx;
+	kib_msg_t *txmsg;
+	int nob;
+	int post_credit = IBLND_POSTRX_PEER_CREDIT;
+	int rc = 0;
 
 	LASSERT(mlen <= rlen);
 	LASSERT(!in_interrupt());
@@ -1828,8 +1826,8 @@ kiblnd_peer_alive(kib_peer_t *peer)
 static void
 kiblnd_peer_notify(kib_peer_t *peer)
 {
-	int	   error = 0;
-	unsigned long    last_alive = 0;
+	int error = 0;
+	unsigned long last_alive = 0;
 	unsigned long flags;
 
 	read_lock_irqsave(&kiblnd_data.kib_global_lock, flags);
@@ -1860,9 +1858,9 @@ kiblnd_close_conn_locked(kib_conn_t *conn, int error)
 	 * connection to be finished off by the connd.  Otherwise the connd is
 	 * already dealing with it (either to set it up or tear it down).
 	 * Caller holds kib_global_lock exclusively in irq context */
-	kib_peer_t       *peer = conn->ibc_peer;
-	kib_dev_t	*dev;
-	unsigned long     flags;
+	kib_peer_t *peer = conn->ibc_peer;
+	kib_dev_t *dev;
+	unsigned long flags;
 
 	LASSERT(error != 0 || conn->ibc_state >= IBLND_CONN_ESTABLISHED);
 
@@ -1934,8 +1932,8 @@ kiblnd_close_conn(kib_conn_t *conn, int error)
 static void
 kiblnd_handle_early_rxs(kib_conn_t *conn)
 {
-	unsigned long    flags;
-	kib_rx_t	*rx;
+	unsigned long flags;
+	kib_rx_t *rx;
 	kib_rx_t *tmp;
 
 	LASSERT(!in_interrupt());
@@ -1957,9 +1955,9 @@ static void
 kiblnd_abort_txs(kib_conn_t *conn, struct list_head *txs)
 {
 	LIST_HEAD(zombies);
-	struct list_head	  *tmp;
-	struct list_head	  *nxt;
-	kib_tx_t	    *tx;
+	struct list_head *tmp;
+	struct list_head *nxt;
+	kib_tx_t *tx;
 
 	spin_lock(&conn->ibc_lock);
 
@@ -2018,7 +2016,7 @@ void
 kiblnd_peer_connect_failed(kib_peer_t *peer, int active, int error)
 {
 	LIST_HEAD(zombies);
-	unsigned long     flags;
+	unsigned long flags;
 
 	LASSERT(error != 0);
 	LASSERT(!in_interrupt());
@@ -2071,12 +2069,12 @@ kiblnd_peer_connect_failed(kib_peer_t *peer, int active, int error)
 void
 kiblnd_connreq_done(kib_conn_t *conn, int status)
 {
-	kib_peer_t	*peer = conn->ibc_peer;
-	kib_tx_t	  *tx;
+	kib_peer_t *peer = conn->ibc_peer;
+	kib_tx_t *tx;
 	kib_tx_t *tmp;
-	struct list_head	 txs;
-	unsigned long      flags;
-	int		active;
+	struct list_head txs;
+	unsigned long flags;
+	int active;
 
 	active = (conn->ibc_state = IBLND_CONN_ACTIVE_CONNECT);
 
@@ -2166,7 +2164,7 @@ kiblnd_connreq_done(kib_conn_t *conn, int status)
 static void
 kiblnd_reject(struct rdma_cm_id *cmid, kib_rej_t *rej)
 {
-	int	  rc;
+	int rc;
 
 	rc = rdma_reject(cmid, rej, sizeof(*rej));
 
@@ -2177,22 +2175,22 @@ kiblnd_reject(struct rdma_cm_id *cmid, kib_rej_t *rej)
 static int
 kiblnd_passive_connect(struct rdma_cm_id *cmid, void *priv, int priv_nob)
 {
-	rwlock_t		*g_lock = &kiblnd_data.kib_global_lock;
-	kib_msg_t	     *reqmsg = priv;
-	kib_msg_t	     *ackmsg;
-	kib_dev_t	     *ibdev;
-	kib_peer_t	    *peer;
-	kib_peer_t	    *peer2;
-	kib_conn_t	    *conn;
-	lnet_ni_t	     *ni  = NULL;
-	kib_net_t	     *net = NULL;
-	lnet_nid_t	     nid;
+	rwlock_t *g_lock = &kiblnd_data.kib_global_lock;
+	kib_msg_t *reqmsg = priv;
+	kib_msg_t *ackmsg;
+	kib_dev_t *ibdev;
+	kib_peer_t *peer;
+	kib_peer_t *peer2;
+	kib_conn_t *conn;
+	lnet_ni_t *ni  = NULL;
+	kib_net_t *net = NULL;
+	lnet_nid_t nid;
 	struct rdma_conn_param cp;
-	kib_rej_t	      rej;
-	int		    version = IBLND_MSG_VERSION;
-	unsigned long	  flags;
-	int		    rc;
-	struct sockaddr_in    *peer_addr;
+	kib_rej_t rej;
+	int version = IBLND_MSG_VERSION;
+	unsigned long flags;
+	int rc;
+	struct sockaddr_in *peer_addr;
 	LASSERT(!in_interrupt());
 
 	/* cmid inherits 'context' from the corresponding listener id */
@@ -2200,8 +2198,8 @@ kiblnd_passive_connect(struct rdma_cm_id *cmid, void *priv, int priv_nob)
 	LASSERT(ibdev != NULL);
 
 	memset(&rej, 0, sizeof(rej));
-	rej.ibr_magic		= IBLND_MSG_MAGIC;
-	rej.ibr_why		  = IBLND_REJECT_FATAL;
+	rej.ibr_magic = IBLND_MSG_MAGIC;
+	rej.ibr_why = IBLND_REJECT_FATAL;
 	rej.ibr_cp.ibcp_max_msg_size = IBLND_MSG_SIZE;
 
 	peer_addr = (struct sockaddr_in *)&(cmid->route.addr.dst_addr);
@@ -2243,7 +2241,7 @@ kiblnd_passive_connect(struct rdma_cm_id *cmid, void *priv, int priv_nob)
 	}
 
 	nid = reqmsg->ibm_srcnid;
-	ni  = lnet_net2ni(LNET_NIDNET(reqmsg->ibm_dstnid));
+	ni = lnet_net2ni(LNET_NIDNET(reqmsg->ibm_dstnid));
 
 	if (ni != NULL) {
 		net = (kib_net_t *)ni->ni_data;
@@ -2394,7 +2392,7 @@ kiblnd_passive_connect(struct rdma_cm_id *cmid, void *priv, int priv_nob)
 	 * CM callback doesn't destroy cmid. */
 
 	conn->ibc_incarnation      = reqmsg->ibm_srcstamp;
-	conn->ibc_credits	  = IBLND_MSG_QUEUE_SIZE(version);
+	conn->ibc_credits          = IBLND_MSG_QUEUE_SIZE(version);
 	conn->ibc_reserved_credits = IBLND_MSG_QUEUE_SIZE(version);
 	LASSERT(conn->ibc_credits + conn->ibc_reserved_credits + IBLND_OOB_MSGS(version)
 		 <= IBLND_RX_MSGS(version));
@@ -2412,12 +2410,12 @@ kiblnd_passive_connect(struct rdma_cm_id *cmid, void *priv, int priv_nob)
 
 	memset(&cp, 0, sizeof(cp));
 	cp.private_data	= ackmsg;
-	cp.private_data_len    = ackmsg->ibm_nob;
+	cp.private_data_len = ackmsg->ibm_nob;
 	cp.responder_resources = 0;	     /* No atomic ops or RDMA reads */
-	cp.initiator_depth     = 0;
+	cp.initiator_depth = 0;
 	cp.flow_control	= 1;
-	cp.retry_count	 = *kiblnd_tunables.kib_retry_count;
-	cp.rnr_retry_count     = *kiblnd_tunables.kib_rnr_retry_count;
+	cp.retry_count = *kiblnd_tunables.kib_retry_count;
+	cp.rnr_retry_count = *kiblnd_tunables.kib_rnr_retry_count;
 
 	CDEBUG(D_NET, "Accept %s\n", libcfs_nid2str(nid));
 
@@ -2439,7 +2437,7 @@ kiblnd_passive_connect(struct rdma_cm_id *cmid, void *priv, int priv_nob)
 	if (ni != NULL)
 		lnet_ni_decref(ni);
 
-	rej.ibr_version = version;
+	rej.ibr_version             = version;
 	rej.ibr_cp.ibcp_queue_depth = IBLND_MSG_QUEUE_SIZE(version);
 	rej.ibr_cp.ibcp_max_frags   = IBLND_RDMA_FRAGS(version);
 	kiblnd_reject(cmid, &rej);
@@ -2451,10 +2449,10 @@ static void
 kiblnd_reconnect(kib_conn_t *conn, int version,
 		  __u64 incarnation, int why, kib_connparams_t *cp)
 {
-	kib_peer_t    *peer = conn->ibc_peer;
-	char	  *reason;
-	int	    retry = 0;
-	unsigned long  flags;
+	kib_peer_t *peer = conn->ibc_peer;
+	char *reason;
+	int retry = 0;
+	unsigned long flags;
 
 	LASSERT(conn->ibc_state = IBLND_CONN_ACTIVE_CONNECT);
 	LASSERT(peer->ibp_connecting > 0);     /* 'conn' at least */
@@ -2513,7 +2511,7 @@ kiblnd_reconnect(kib_conn_t *conn, int version,
 static void
 kiblnd_rejected(kib_conn_t *conn, int reason, void *priv, int priv_nob)
 {
-	kib_peer_t    *peer = conn->ibc_peer;
+	kib_peer_t *peer = conn->ibc_peer;
 
 	LASSERT(!in_interrupt());
 	LASSERT(conn->ibc_state = IBLND_CONN_ACTIVE_CONNECT);
@@ -2532,10 +2530,10 @@ kiblnd_rejected(kib_conn_t *conn, int reason, void *priv, int priv_nob)
 
 	case IB_CM_REJ_CONSUMER_DEFINED:
 		if (priv_nob >= offsetof(kib_rej_t, ibr_padding)) {
-			kib_rej_t	*rej	 = priv;
-			kib_connparams_t *cp	  = NULL;
-			int	       flip	= 0;
-			__u64	     incarnation = -1;
+			kib_rej_t *rej = priv;
+			kib_connparams_t *cp = NULL;
+			int flip = 0;
+			__u64 incarnation = -1;
 
 			/* NB. default incarnation is -1 because:
 			 * a) V1 will ignore dst incarnation in connreq.
@@ -2652,13 +2650,13 @@ kiblnd_rejected(kib_conn_t *conn, int reason, void *priv, int priv_nob)
 static void
 kiblnd_check_connreply(kib_conn_t *conn, void *priv, int priv_nob)
 {
-	kib_peer_t    *peer = conn->ibc_peer;
-	lnet_ni_t     *ni   = peer->ibp_ni;
-	kib_net_t     *net  = ni->ni_data;
-	kib_msg_t     *msg  = priv;
-	int	    ver  = conn->ibc_version;
-	int	    rc   = kiblnd_unpack_msg(msg, priv_nob);
-	unsigned long  flags;
+	kib_peer_t *peer = conn->ibc_peer;
+	lnet_ni_t *ni = peer->ibp_ni;
+	kib_net_t *net = ni->ni_data;
+	kib_msg_t *msg = priv;
+	int ver = conn->ibc_version;
+	int rc = kiblnd_unpack_msg(msg, priv_nob);
+	unsigned long flags;
 
 	LASSERT(net != NULL);
 
@@ -2726,8 +2724,8 @@ kiblnd_check_connreply(kib_conn_t *conn, void *priv, int priv_nob)
 		goto failed;
 	}
 
-	conn->ibc_incarnation      = msg->ibm_srcstamp;
-	conn->ibc_credits	  +	conn->ibc_incarnation = msg->ibm_srcstamp;
+	conn->ibc_credits  	conn->ibc_reserved_credits = IBLND_MSG_QUEUE_SIZE(ver);
 	LASSERT(conn->ibc_credits + conn->ibc_reserved_credits + IBLND_OOB_MSGS(ver)
 		 <= IBLND_RX_MSGS(ver));
@@ -2749,20 +2747,20 @@ kiblnd_check_connreply(kib_conn_t *conn, void *priv, int priv_nob)
 static int
 kiblnd_active_connect(struct rdma_cm_id *cmid)
 {
-	kib_peer_t	      *peer = (kib_peer_t *)cmid->context;
-	kib_conn_t	      *conn;
-	kib_msg_t	       *msg;
-	struct rdma_conn_param   cp;
-	int		      version;
-	__u64		    incarnation;
-	unsigned long	    flags;
-	int		      rc;
+	kib_peer_t *peer = (kib_peer_t *)cmid->context;
+	kib_conn_t *conn;
+	kib_msg_t *msg;
+	struct rdma_conn_param cp;
+	int version;
+	__u64 incarnation;
+	unsigned long flags;
+	int rc;
 
 	read_lock_irqsave(&kiblnd_data.kib_global_lock, flags);
 
 	incarnation = peer->ibp_incarnation;
-	version     = (peer->ibp_version = 0) ? IBLND_MSG_VERSION :
-						 peer->ibp_version;
+	version = (peer->ibp_version = 0) ? IBLND_MSG_VERSION :
+					     peer->ibp_version;
 
 	read_unlock_irqrestore(&kiblnd_data.kib_global_lock, flags);
 
@@ -2793,8 +2791,8 @@ kiblnd_active_connect(struct rdma_cm_id *cmid)
 	cp.private_data_len    = msg->ibm_nob;
 	cp.responder_resources = 0;	     /* No atomic ops or RDMA reads */
 	cp.initiator_depth     = 0;
-	cp.flow_control	= 1;
-	cp.retry_count	 = *kiblnd_tunables.kib_retry_count;
+	cp.flow_control        = 1;
+	cp.retry_count         = *kiblnd_tunables.kib_retry_count;
 	cp.rnr_retry_count     = *kiblnd_tunables.kib_rnr_retry_count;
 
 	LASSERT(cmid->context = (void *)conn);
@@ -2814,9 +2812,9 @@ kiblnd_active_connect(struct rdma_cm_id *cmid)
 int
 kiblnd_cm_callback(struct rdma_cm_id *cmid, struct rdma_cm_event *event)
 {
-	kib_peer_t  *peer;
-	kib_conn_t  *conn;
-	int	  rc;
+	kib_peer_t *peer;
+	kib_conn_t *conn;
+	int rc;
 
 	switch (event->event) {
 	default:
@@ -2983,8 +2981,8 @@ kiblnd_cm_callback(struct rdma_cm_id *cmid, struct rdma_cm_event *event)
 static int
 kiblnd_check_txs_locked(kib_conn_t *conn, struct list_head *txs)
 {
-	kib_tx_t	  *tx;
-	struct list_head	*ttmp;
+	kib_tx_t *tx;
+	struct list_head *ttmp;
 
 	list_for_each(ttmp, txs) {
 		tx = list_entry(ttmp, kib_tx_t, tx_list);
@@ -3022,13 +3020,13 @@ kiblnd_check_conns(int idx)
 {
 	LIST_HEAD(closes);
 	LIST_HEAD(checksends);
-	struct list_head    *peers = &kiblnd_data.kib_peers[idx];
-	struct list_head    *ptmp;
-	kib_peer_t    *peer;
-	kib_conn_t    *conn;
+	struct list_head *peers = &kiblnd_data.kib_peers[idx];
+	struct list_head *ptmp;
+	kib_peer_t *peer;
+	kib_conn_t *conn;
 	kib_conn_t *tmp;
-	struct list_head    *ctmp;
-	unsigned long  flags;
+	struct list_head *ctmp;
+	unsigned long flags;
 
 	/* NB. We expect to have a look at all the peers and not find any
 	 * RDMAs to time out, so we just use a shared lock while we
@@ -3114,14 +3112,14 @@ kiblnd_disconnect_conn(kib_conn_t *conn)
 int
 kiblnd_connd(void *arg)
 {
-	wait_queue_t     wait;
-	unsigned long      flags;
-	kib_conn_t	*conn;
-	int		timeout;
-	int		i;
-	int		dropped_lock;
-	int		peer_index = 0;
-	unsigned long      deadline = jiffies;
+	wait_queue_t wait;
+	unsigned long flags;
+	kib_conn_t *conn;
+	int timeout;
+	int i;
+	int dropped_lock;
+	int peer_index = 0;
+	unsigned long deadline = jiffies;
 
 	cfs_block_allsigs();
 
@@ -3169,7 +3167,7 @@ kiblnd_connd(void *arg)
 		if (timeout <= 0) {
 			const int n = 4;
 			const int p = 1;
-			int       chunk = kiblnd_data.kib_peer_hash_size;
+			int chunk = kiblnd_data.kib_peer_hash_size;
 
 			spin_unlock_irqrestore(&kiblnd_data.kib_connd_lock, flags);
 			dropped_lock = 1;
@@ -3273,9 +3271,9 @@ kiblnd_cq_completion(struct ib_cq *cq, void *arg)
 	 * consuming my CQ I could be called after all completions have
 	 * occurred.  But in this case, ibc_nrx = 0 && ibc_nsends_posted = 0
 	 * and this CQ is about to be destroyed so I NOOP. */
-	kib_conn_t		*conn = (kib_conn_t *)arg;
-	struct kib_sched_info	*sched = conn->ibc_sched;
-	unsigned long		flags;
+	kib_conn_t *conn = (kib_conn_t *)arg;
+	struct kib_sched_info *sched = conn->ibc_sched;
+	unsigned long flags;
 
 	LASSERT(cq = conn->ibc_cq);
 
@@ -3309,15 +3307,15 @@ kiblnd_cq_event(struct ib_event *event, void *arg)
 int
 kiblnd_scheduler(void *arg)
 {
-	long			id = (long)arg;
-	struct kib_sched_info	*sched;
-	kib_conn_t		*conn;
-	wait_queue_t		wait;
-	unsigned long		flags;
-	struct ib_wc		wc;
-	int			did_something;
-	int			busy_loops = 0;
-	int			rc;
+	long id = (long)arg;
+	struct kib_sched_info *sched;
+	kib_conn_t *conn;
+	wait_queue_t wait;
+	unsigned long flags;
+	struct ib_wc wc;
+	int did_something;
+	int busy_loops = 0;
+	int rc;
 
 	cfs_block_allsigs();
 
@@ -3432,11 +3430,11 @@ kiblnd_scheduler(void *arg)
 int
 kiblnd_failover_thread(void *arg)
 {
-	rwlock_t		*glock = &kiblnd_data.kib_global_lock;
-	kib_dev_t	 *dev;
-	wait_queue_t     wait;
-	unsigned long      flags;
-	int		rc;
+	rwlock_t *glock = &kiblnd_data.kib_global_lock;
+	kib_dev_t *dev;
+	wait_queue_t wait;
+	unsigned long flags;
+	int rc;
 
 	LASSERT(*kiblnd_tunables.kib_dev_failover != 0);
 
@@ -3446,8 +3444,8 @@ kiblnd_failover_thread(void *arg)
 	write_lock_irqsave(glock, flags);
 
 	while (!kiblnd_data.kib_shutdown) {
-		int     do_failover = 0;
-		int     long_sleep;
+		int do_failover = 0;
+		int long_sleep;
 
 		list_for_each_entry(dev, &kiblnd_data.kib_failed_devs,
 				    ibd_fail_list) {
diff --git a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_modparams.c b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_modparams.c
index eedf01a..b0e0036 100644
--- a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_modparams.c
+++ b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_modparams.c
@@ -150,30 +150,30 @@ module_param(use_privileged_port, int, 0644);
 MODULE_PARM_DESC(use_privileged_port, "use privileged port when initiating connection");
 
 kib_tunables_t kiblnd_tunables = {
-	.kib_dev_failover	   = &dev_failover,
-	.kib_service		= &service,
-	.kib_cksum		  = &cksum,
-	.kib_timeout		= &timeout,
-	.kib_keepalive	      = &keepalive,
-	.kib_ntx		    = &ntx,
-	.kib_credits		= &credits,
-	.kib_peertxcredits	  = &peer_credits,
-	.kib_peercredits_hiw	= &peer_credits_hiw,
-	.kib_peerrtrcredits	 = &peer_buffer_credits,
-	.kib_peertimeout	    = &peer_timeout,
-	.kib_default_ipif	   = &ipif_name,
-	.kib_retry_count	    = &retry_count,
-	.kib_rnr_retry_count	= &rnr_retry_count,
-	.kib_concurrent_sends       = &concurrent_sends,
-	.kib_ib_mtu		 = &ib_mtu,
-	.kib_map_on_demand	  = &map_on_demand,
-	.kib_fmr_pool_size	  = &fmr_pool_size,
-	.kib_fmr_flush_trigger      = &fmr_flush_trigger,
-	.kib_fmr_cache	      = &fmr_cache,
-	.kib_pmr_pool_size	  = &pmr_pool_size,
-	.kib_require_priv_port      = &require_privileged_port,
-	.kib_use_priv_port	    = &use_privileged_port,
-	.kib_nscheds		    = &nscheds
+	.kib_dev_failover      = &dev_failover,
+	.kib_service           = &service,
+	.kib_cksum             = &cksum,
+	.kib_timeout           = &timeout,
+	.kib_keepalive         = &keepalive,
+	.kib_ntx               = &ntx,
+	.kib_credits           = &credits,
+	.kib_peertxcredits     = &peer_credits,
+	.kib_peercredits_hiw   = &peer_credits_hiw,
+	.kib_peerrtrcredits    = &peer_buffer_credits,
+	.kib_peertimeout       = &peer_timeout,
+	.kib_default_ipif      = &ipif_name,
+	.kib_retry_count       = &retry_count,
+	.kib_rnr_retry_count   = &rnr_retry_count,
+	.kib_concurrent_sends  = &concurrent_sends,
+	.kib_ib_mtu            = &ib_mtu,
+	.kib_map_on_demand     = &map_on_demand,
+	.kib_fmr_pool_size     = &fmr_pool_size,
+	.kib_fmr_flush_trigger = &fmr_flush_trigger,
+	.kib_fmr_cache         = &fmr_cache,
+	.kib_pmr_pool_size     = &pmr_pool_size,
+	.kib_require_priv_port = &require_privileged_port,
+	.kib_use_priv_port     = &use_privileged_port,
+	.kib_nscheds           = &nscheds
 };
 
 int
-- 
1.7.1

