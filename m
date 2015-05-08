From: Mike Shuey <shuey@purdue.edu>
Date: Fri, 08 May 2015 12:00:55 +0000
Subject: [PATCH v2 3/8] staging: lustre: code cleanup - variable declaration spacing
Message-Id: <1431086460-22455-11-git-send-email-shuey@purdue.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1431086460-22455-9-git-send-email-shuey@purdue.edu>
In-Reply-To: <1431086460-22455-9-git-send-email-shuey@purdue.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oleg.drokin@intel.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, Mike Shuey <shuey@purdue.edu>

Clean up spacing in some variable declarations, to be more consistent.
---
 drivers/staging/lustre/lnet/lnet/lib-md.c   |   26 ++--
 drivers/staging/lustre/lnet/lnet/lib-me.c   |   20 +-
 drivers/staging/lustre/lnet/lnet/lib-move.c |  240 +++++++++++++-------------
 3 files changed, 143 insertions(+), 143 deletions(-)

diff --git a/drivers/staging/lustre/lnet/lnet/lib-md.c b/drivers/staging/lustre/lnet/lnet/lib-md.c
index 89d660f..5856c30 100644
--- a/drivers/staging/lustre/lnet/lnet/lib-md.c
+++ b/drivers/staging/lustre/lnet/lnet/lib-md.c
@@ -74,7 +74,7 @@ lnet_md_unlink(lnet_libmd_t *md)
 	CDEBUG(D_NET, "Unlinking md %p\n", md);
 
 	if (md->md_eq != NULL) {
-		int	cpt = lnet_cpt_of_cookie(md->md_lh.lh_cookie);
+		int cpt = lnet_cpt_of_cookie(md->md_lh.lh_cookie);
 
 		LASSERT(*md->md_eq->eq_refs[cpt] > 0);
 		(*md->md_eq->eq_refs[cpt])--;
@@ -88,9 +88,9 @@ lnet_md_unlink(lnet_libmd_t *md)
 static int
 lnet_md_build(lnet_libmd_t *lmd, lnet_md_t *umd, int unlink)
 {
-	int	  i;
+	int i;
 	unsigned int niov;
-	int	  total_length = 0;
+	int total_length = 0;
 
 	lmd->md_me = NULL;
 	lmd->md_start = umd->start;
@@ -268,10 +268,10 @@ LNetMDAttach(lnet_handle_me_t meh, lnet_md_t umd,
 {
 	LIST_HEAD(matches);
 	LIST_HEAD(drops);
-	struct lnet_me		*me;
-	struct lnet_libmd	*md;
-	int			cpt;
-	int			rc;
+	struct lnet_me *me;
+	struct lnet_libmd *md;
+	int cpt;
+	int rc;
 
 	LASSERT(the_lnet.ln_init);
 	LASSERT(the_lnet.ln_refcount > 0);
@@ -346,9 +346,9 @@ EXPORT_SYMBOL(LNetMDAttach);
 int
 LNetMDBind(lnet_md_t umd, lnet_unlink_t unlink, lnet_handle_md_t *handle)
 {
-	lnet_libmd_t	*md;
-	int		cpt;
-	int		rc;
+	lnet_libmd_t *md;
+	int cpt;
+	int rc;
 
 	LASSERT(the_lnet.ln_init);
 	LASSERT(the_lnet.ln_refcount > 0);
@@ -421,9 +421,9 @@ EXPORT_SYMBOL(LNetMDBind);
 int
 LNetMDUnlink(lnet_handle_md_t mdh)
 {
-	lnet_event_t	ev;
-	lnet_libmd_t	*md;
-	int		cpt;
+	lnet_event_t ev;
+	lnet_libmd_t *md;
+	int cpt;
 
 	LASSERT(the_lnet.ln_init);
 	LASSERT(the_lnet.ln_refcount > 0);
diff --git a/drivers/staging/lustre/lnet/lnet/lib-me.c b/drivers/staging/lustre/lnet/lnet/lib-me.c
index a3f9292..09e9008 100644
--- a/drivers/staging/lustre/lnet/lnet/lib-me.c
+++ b/drivers/staging/lustre/lnet/lnet/lib-me.c
@@ -80,8 +80,8 @@ LNetMEAttach(unsigned int portal,
 	     lnet_handle_me_t *handle)
 {
 	struct lnet_match_table *mtable;
-	struct lnet_me		*me;
-	struct list_head		*head;
+	struct lnet_me *me;
+	struct list_head *head;
 
 	LASSERT(the_lnet.ln_init);
 	LASSERT(the_lnet.ln_refcount > 0);
@@ -151,10 +151,10 @@ LNetMEInsert(lnet_handle_me_t current_meh,
 	     lnet_unlink_t unlink, lnet_ins_pos_t pos,
 	     lnet_handle_me_t *handle)
 {
-	struct lnet_me		*current_me;
-	struct lnet_me		*new_me;
-	struct lnet_portal	*ptl;
-	int			cpt;
+	struct lnet_me *current_me;
+	struct lnet_me *new_me;
+	struct lnet_portal *ptl;
+	int cpt;
 
 	LASSERT(the_lnet.ln_init);
 	LASSERT(the_lnet.ln_refcount > 0);
@@ -228,10 +228,10 @@ EXPORT_SYMBOL(LNetMEInsert);
 int
 LNetMEUnlink(lnet_handle_me_t meh)
 {
-	lnet_me_t	*me;
-	lnet_libmd_t	*md;
-	lnet_event_t	ev;
-	int		cpt;
+	lnet_me_t *me;
+	lnet_libmd_t *md;
+	lnet_event_t ev;
+	int cpt;
 
 	LASSERT(the_lnet.ln_init);
 	LASSERT(the_lnet.ln_refcount > 0);
diff --git a/drivers/staging/lustre/lnet/lnet/lib-move.c b/drivers/staging/lustre/lnet/lnet/lib-move.c
index c2fb70e..ba59fe7 100644
--- a/drivers/staging/lustre/lnet/lnet/lib-move.c
+++ b/drivers/staging/lustre/lnet/lnet/lib-move.c
@@ -49,10 +49,10 @@ MODULE_PARM_DESC(local_nid_dist_zero, "Reserved");
 int
 lnet_fail_nid(lnet_nid_t nid, unsigned int threshold)
 {
-	lnet_test_peer_t  *tp;
-	struct list_head	*el;
-	struct list_head	*next;
-	struct list_head	 cull;
+	lnet_test_peer_t *tp;
+	struct list_head *el;
+	struct list_head *next;
+	struct list_head cull;
 
 	LASSERT(the_lnet.ln_init);
 
@@ -103,10 +103,10 @@ static int
 fail_peer(lnet_nid_t nid, int outgoing)
 {
 	lnet_test_peer_t *tp;
-	struct list_head       *el;
-	struct list_head       *next;
-	struct list_head	cull;
-	int	       fail = 0;
+	struct list_head *el;
+	struct list_head *next;
+	struct list_head cull;
+	int fail = 0;
 
 	INIT_LIST_HEAD(&cull);
 
@@ -175,7 +175,7 @@ lnet_copy_iov2iov(unsigned int ndiov, struct kvec *diov, unsigned int doffset,
 		   unsigned int nob)
 {
 	/* NB diov, siov are READ-ONLY */
-	unsigned int  this_nob;
+	unsigned int this_nob;
 
 	if (nob = 0)
 		return;
@@ -236,8 +236,8 @@ lnet_extract_iov(int dst_niov, struct kvec *dst,
 	/* Initialise 'dst' to the subset of 'src' starting at 'offset',
 	 * for exactly 'len' bytes, and return the number of entries.
 	 * NB not destructive to 'src' */
-	unsigned int    frag_len;
-	unsigned int    niov;
+	unsigned int frag_len;
+	unsigned int niov;
 
 	if (len = 0)			   /* no data => */
 		return 0;		     /* no frags */
@@ -279,7 +279,7 @@ EXPORT_SYMBOL(lnet_extract_iov);
 unsigned int
 lnet_kiov_nob(unsigned int niov, lnet_kiov_t *kiov)
 {
-	unsigned int  nob = 0;
+	unsigned int nob = 0;
 
 	while (niov-- > 0)
 		nob += (kiov++)->kiov_len;
@@ -294,9 +294,9 @@ lnet_copy_kiov2kiov(unsigned int ndiov, lnet_kiov_t *diov, unsigned int doffset,
 		    unsigned int nob)
 {
 	/* NB diov, siov are READ-ONLY */
-	unsigned int    this_nob;
-	char	   *daddr = NULL;
-	char	   *saddr = NULL;
+	unsigned int this_nob;
+	char *daddr = NULL;
+	char *saddr = NULL;
 
 	if (nob = 0)
 		return;
@@ -376,8 +376,8 @@ lnet_copy_kiov2iov(unsigned int niov, struct kvec *iov, unsigned int iovoffset,
 		   unsigned int kiovoffset, unsigned int nob)
 {
 	/* NB iov, kiov are READ-ONLY */
-	unsigned int    this_nob;
-	char	   *addr = NULL;
+	unsigned int this_nob;
+	char *addr = NULL;
 
 	if (nob = 0)
 		return;
@@ -447,8 +447,8 @@ lnet_copy_iov2kiov(unsigned int nkiov, lnet_kiov_t *kiov,
 		   unsigned int nob)
 {
 	/* NB kiov, iov are READ-ONLY */
-	unsigned int    this_nob;
-	char	   *addr = NULL;
+	unsigned int this_nob;
+	char *addr = NULL;
 
 	if (nob = 0)
 		return;
@@ -518,8 +518,8 @@ lnet_extract_kiov(int dst_niov, lnet_kiov_t *dst,
 	/* Initialise 'dst' to the subset of 'src' starting at 'offset',
 	 * for exactly 'len' bytes, and return the number of entries.
 	 * NB not destructive to 'src' */
-	unsigned int    frag_len;
-	unsigned int    niov;
+	unsigned int frag_len;
+	unsigned int niov;
 
 	if (len = 0)			   /* no data => */
 		return 0;		     /* no frags */
@@ -565,10 +565,10 @@ static void
 lnet_ni_recv(lnet_ni_t *ni, void *private, lnet_msg_t *msg, int delayed,
 	     unsigned int offset, unsigned int mlen, unsigned int rlen)
 {
-	unsigned int  niov = 0;
+	unsigned int niov = 0;
 	struct kvec *iov = NULL;
-	lnet_kiov_t  *kiov = NULL;
-	int	   rc;
+	lnet_kiov_t *kiov = NULL;
+	int rc;
 
 	LASSERT(!in_interrupt());
 	LASSERT(mlen = 0 || msg != NULL);
@@ -642,8 +642,8 @@ lnet_prep_send(lnet_msg_t *msg, int type, lnet_process_id_t target,
 static void
 lnet_ni_send(lnet_ni_t *ni, lnet_msg_t *msg)
 {
-	void   *priv = msg->msg_private;
-	int     rc;
+	void *priv = msg->msg_private;
+	int rc;
 
 	LASSERT(!in_interrupt());
 	LASSERT(LNET_NETTYP(LNET_NIDNET(ni->ni_nid)) = LOLND ||
@@ -657,7 +657,7 @@ lnet_ni_send(lnet_ni_t *ni, lnet_msg_t *msg)
 static int
 lnet_ni_eager_recv(lnet_ni_t *ni, lnet_msg_t *msg)
 {
-	int	rc;
+	int rc;
 
 	LASSERT(!msg->msg_sending);
 	LASSERT(msg->msg_receiving);
@@ -700,7 +700,7 @@ lnet_ni_query_locked(lnet_ni_t *ni, lnet_peer_t *lp)
 static inline int
 lnet_peer_is_alive(lnet_peer_t *lp, unsigned long now)
 {
-	int	alive;
+	int alive;
 	unsigned long deadline;
 
 	LASSERT(lnet_peer_aliveness_enabled(lp));
@@ -785,10 +785,10 @@ lnet_peer_alive_locked(lnet_peer_t *lp)
 static int
 lnet_post_send_locked(lnet_msg_t *msg, int do_send)
 {
-	lnet_peer_t		*lp = msg->msg_txpeer;
-	lnet_ni_t		*ni = lp->lp_ni;
-	int			cpt = msg->msg_tx_cpt;
-	struct lnet_tx_queue	*tq = ni->ni_tx_queues[cpt];
+	lnet_peer_t *lp = msg->msg_txpeer;
+	lnet_ni_t *ni = lp->lp_ni;
+	int cpt = msg->msg_tx_cpt;
+	struct lnet_tx_queue *tq = ni->ni_tx_queues[cpt];
 
 	/* non-lnet_send() callers have checked before */
 	LASSERT(!do_send || msg->msg_tx_delayed);
@@ -871,8 +871,8 @@ lnet_post_send_locked(lnet_msg_t *msg, int do_send)
 static lnet_rtrbufpool_t *
 lnet_msg2bufpool(lnet_msg_t *msg)
 {
-	lnet_rtrbufpool_t	*rbp;
-	int			cpt;
+	lnet_rtrbufpool_t *rbp;
+	int cpt;
 
 	LASSERT(msg->msg_rx_committed);
 
@@ -894,9 +894,9 @@ lnet_post_routed_recv_locked(lnet_msg_t *msg, int do_recv)
 	/* lnet_parse is going to lnet_net_unlock immediately after this, so it
 	 * sets do_recv FALSE and I don't do the unlock/send/lock bit.  I
 	 * return EAGAIN if msg blocked and 0 if received or OK to receive */
-	lnet_peer_t	 *lp = msg->msg_rxpeer;
-	lnet_rtrbufpool_t   *rbp;
-	lnet_rtrbuf_t       *rb;
+	lnet_peer_t *lp = msg->msg_rxpeer;
+	lnet_rtrbufpool_t *rbp;
+	lnet_rtrbuf_t *rb;
 
 	LASSERT(msg->msg_iov = NULL);
 	LASSERT(msg->msg_kiov = NULL);
@@ -967,11 +967,11 @@ lnet_post_routed_recv_locked(lnet_msg_t *msg, int do_recv)
 void
 lnet_return_tx_credits_locked(lnet_msg_t *msg)
 {
-	lnet_peer_t	*txpeer = msg->msg_txpeer;
-	lnet_msg_t	*msg2;
+	lnet_peer_t *txpeer = msg->msg_txpeer;
+	lnet_msg_t *msg2;
 
 	if (msg->msg_txcredit) {
-		struct lnet_ni	     *ni = txpeer->lp_ni;
+		struct lnet_ni *ni = txpeer->lp_ni;
 		struct lnet_tx_queue *tq = ni->ni_tx_queues[msg->msg_tx_cpt];
 
 		/* give back NI txcredits */
@@ -1025,12 +1025,12 @@ lnet_return_tx_credits_locked(lnet_msg_t *msg)
 void
 lnet_return_rx_credits_locked(lnet_msg_t *msg)
 {
-	lnet_peer_t	*rxpeer = msg->msg_rxpeer;
-	lnet_msg_t	*msg2;
+	lnet_peer_t *rxpeer = msg->msg_rxpeer;
+	lnet_msg_t *msg2;
 
 	if (msg->msg_rtrcredit) {
 		/* give back global router credits */
-		lnet_rtrbuf_t     *rb;
+		lnet_rtrbuf_t *rb;
 		lnet_rtrbufpool_t *rbp;
 
 		/* NB If a msg ever blocks for a buffer in rbp_msgs, it stays
@@ -1122,13 +1122,13 @@ lnet_compare_routes(lnet_route_t *r1, lnet_route_t *r2)
 static lnet_peer_t *
 lnet_find_route_locked(lnet_ni_t *ni, lnet_nid_t target, lnet_nid_t rtr_nid)
 {
-	lnet_remotenet_t	*rnet;
-	lnet_route_t		*rtr;
-	lnet_route_t		*rtr_best;
-	lnet_route_t		*rtr_last;
-	struct lnet_peer	*lp_best;
-	struct lnet_peer	*lp;
-	int			rc;
+	lnet_remotenet_t *rnet;
+	lnet_route_t *rtr;
+	lnet_route_t *rtr_best;
+	lnet_route_t *rtr_last;
+	struct lnet_peer *lp_best;
+	struct lnet_peer *lp;
+	int rc;
 
 	/* If @rtr_nid is not LNET_NID_ANY, return the gateway with
 	 * rtr_nid nid, otherwise find the best gateway I can use */
@@ -1182,13 +1182,13 @@ lnet_find_route_locked(lnet_ni_t *ni, lnet_nid_t target, lnet_nid_t rtr_nid)
 int
 lnet_send(lnet_nid_t src_nid, lnet_msg_t *msg, lnet_nid_t rtr_nid)
 {
-	lnet_nid_t		dst_nid = msg->msg_target.nid;
-	struct lnet_ni		*src_ni;
-	struct lnet_ni		*local_ni;
-	struct lnet_peer	*lp;
-	int			cpt;
-	int			cpt2;
-	int			rc;
+	lnet_nid_t dst_nid = msg->msg_target.nid;
+	struct lnet_ni *src_ni;
+	struct lnet_ni *local_ni;
+	struct lnet_peer *lp;
+	int cpt;
+	int cpt2;
+	int rc;
 
 	/* NB: rtr_nid is set to LNET_NID_ANY for all current use-cases,
 	 * but we might want to use pre-determined router for ACK/REPLY
@@ -1364,7 +1364,7 @@ lnet_drop_message(lnet_ni_t *ni, int cpt, void *private, unsigned int nob)
 static void
 lnet_recv_put(lnet_ni_t *ni, lnet_msg_t *msg)
 {
-	lnet_hdr_t	*hdr = &msg->msg_hdr;
+	lnet_hdr_t *hdr = &msg->msg_hdr;
 
 	if (msg->msg_wanted != 0)
 		lnet_setpayloadbuffer(msg);
@@ -1383,9 +1383,9 @@ lnet_recv_put(lnet_ni_t *ni, lnet_msg_t *msg)
 static int
 lnet_parse_put(lnet_ni_t *ni, lnet_msg_t *msg)
 {
-	lnet_hdr_t		*hdr = &msg->msg_hdr;
-	struct lnet_match_info	info;
-	int			rc;
+	lnet_hdr_t *hdr = &msg->msg_hdr;
+	struct lnet_match_info info;
+	int rc;
 
 	/* Convert put fields to host byte order */
 	hdr->msg.put.match_bits	= le64_to_cpu(hdr->msg.put.match_bits);
@@ -1433,24 +1433,24 @@ lnet_parse_put(lnet_ni_t *ni, lnet_msg_t *msg)
 static int
 lnet_parse_get(lnet_ni_t *ni, lnet_msg_t *msg, int rdma_get)
 {
-	struct lnet_match_info	info;
-	lnet_hdr_t		*hdr = &msg->msg_hdr;
-	lnet_handle_wire_t	reply_wmd;
-	int			rc;
+	struct lnet_match_info info;
+	lnet_hdr_t *hdr = &msg->msg_hdr;
+	lnet_handle_wire_t reply_wmd;
+	int rc;
 
 	/* Convert get fields to host byte order */
-	hdr->msg.get.match_bits	  = le64_to_cpu(hdr->msg.get.match_bits);
-	hdr->msg.get.ptl_index	  = le32_to_cpu(hdr->msg.get.ptl_index);
-	hdr->msg.get.sink_length  = le32_to_cpu(hdr->msg.get.sink_length);
-	hdr->msg.get.src_offset	  = le32_to_cpu(hdr->msg.get.src_offset);
-
-	info.mi_id.nid	= hdr->src_nid;
-	info.mi_id.pid	= hdr->src_pid;
-	info.mi_opc	= LNET_MD_OP_GET;
-	info.mi_portal	= hdr->msg.get.ptl_index;
-	info.mi_rlength	= hdr->msg.get.sink_length;
-	info.mi_roffset	= hdr->msg.get.src_offset;
-	info.mi_mbits	= hdr->msg.get.match_bits;
+	hdr->msg.get.match_bits  = le64_to_cpu(hdr->msg.get.match_bits);
+	hdr->msg.get.ptl_index   = le32_to_cpu(hdr->msg.get.ptl_index);
+	hdr->msg.get.sink_length = le32_to_cpu(hdr->msg.get.sink_length);
+	hdr->msg.get.src_offset  = le32_to_cpu(hdr->msg.get.src_offset);
+
+	info.mi_id.nid  = hdr->src_nid;
+	info.mi_id.pid  = hdr->src_pid;
+	info.mi_opc     = LNET_MD_OP_GET;
+	info.mi_portal  = hdr->msg.get.ptl_index;
+	info.mi_rlength = hdr->msg.get.sink_length;
+	info.mi_roffset = hdr->msg.get.src_offset;
+	info.mi_mbits   = hdr->msg.get.match_bits;
 
 	rc = lnet_ptl_match_md(&info, msg);
 	if (rc = LNET_MATCHMD_DROP) {
@@ -1497,13 +1497,13 @@ lnet_parse_get(lnet_ni_t *ni, lnet_msg_t *msg, int rdma_get)
 static int
 lnet_parse_reply(lnet_ni_t *ni, lnet_msg_t *msg)
 {
-	void	     *private = msg->msg_private;
-	lnet_hdr_t       *hdr = &msg->msg_hdr;
+	void *private = msg->msg_private;
+	lnet_hdr_t *hdr = &msg->msg_hdr;
 	lnet_process_id_t src = {0};
-	lnet_libmd_t     *md;
-	int	       rlength;
-	int	       mlength;
-	int			cpt;
+	lnet_libmd_t *md;
+	int rlength;
+	int mlength;
+	int cpt;
 
 	cpt = lnet_cpt_of_cookie(hdr->msg.reply.dst_wmd.wh_object_cookie);
 	lnet_res_lock(cpt);
@@ -1562,10 +1562,10 @@ lnet_parse_reply(lnet_ni_t *ni, lnet_msg_t *msg)
 static int
 lnet_parse_ack(lnet_ni_t *ni, lnet_msg_t *msg)
 {
-	lnet_hdr_t       *hdr = &msg->msg_hdr;
+	lnet_hdr_t *hdr = &msg->msg_hdr;
 	lnet_process_id_t src = {0};
-	lnet_libmd_t     *md;
-	int			cpt;
+	lnet_libmd_t *md;
+	int cpt;
 
 	src.nid = hdr->src_nid;
 	src.pid = hdr->src_pid;
@@ -1612,7 +1612,7 @@ lnet_parse_ack(lnet_ni_t *ni, lnet_msg_t *msg)
 static int
 lnet_parse_forward_locked(lnet_ni_t *ni, lnet_msg_t *msg)
 {
-	int	rc = 0;
+	int rc = 0;
 
 	if (msg->msg_rxpeer->lp_rtrcredits <= 0 ||
 	    lnet_msg2bufpool(msg)->rbp_credits <= 0) {
@@ -1713,15 +1713,15 @@ int
 lnet_parse(lnet_ni_t *ni, lnet_hdr_t *hdr, lnet_nid_t from_nid,
 	   void *private, int rdma_req)
 {
-	int		rc = 0;
-	int		cpt;
-	int		for_me;
-	struct lnet_msg	*msg;
-	lnet_pid_t     dest_pid;
-	lnet_nid_t     dest_nid;
-	lnet_nid_t     src_nid;
-	__u32	  payload_length;
-	__u32	  type;
+	int rc = 0;
+	int cpt;
+	int for_me;
+	struct lnet_msg *msg;
+	lnet_pid_t dest_pid;
+	lnet_nid_t dest_nid;
+	lnet_nid_t src_nid;
+	__u32 payload_length;
+	__u32 type;
 
 	LASSERT(!in_interrupt());
 
@@ -1945,8 +1945,8 @@ void
 lnet_drop_delayed_msg_list(struct list_head *head, char *reason)
 {
 	while (!list_empty(head)) {
-		lnet_process_id_t	id = {0};
-		lnet_msg_t		*msg;
+		lnet_process_id_t id = {0};
+		lnet_msg_t *msg;
 
 		msg = list_entry(head->next, lnet_msg_t, msg_list);
 		list_del(&msg->msg_list);
@@ -1986,8 +1986,8 @@ void
 lnet_recv_delayed_msg_list(struct list_head *head)
 {
 	while (!list_empty(head)) {
-		lnet_msg_t	  *msg;
-		lnet_process_id_t  id;
+		lnet_msg_t *msg;
+		lnet_process_id_t id;
 
 		msg = list_entry(head->next, lnet_msg_t, msg_list);
 		list_del(&msg->msg_list);
@@ -2063,10 +2063,10 @@ LNetPut(lnet_nid_t self, lnet_handle_md_t mdh, lnet_ack_req_t ack,
 	__u64 match_bits, unsigned int offset,
 	__u64 hdr_data)
 {
-	struct lnet_msg		*msg;
-	struct lnet_libmd	*md;
-	int			cpt;
-	int			rc;
+	struct lnet_msg *msg;
+	struct lnet_libmd *md;
+	int cpt;
+	int rc;
 
 	LASSERT(the_lnet.ln_init);
 	LASSERT(the_lnet.ln_refcount > 0);
@@ -2153,10 +2153,10 @@ lnet_create_reply_msg(lnet_ni_t *ni, lnet_msg_t *getmsg)
 	 * CAVEAT EMPTOR: 'getmsg' is the original GET, which is freed when
 	 * lnet_finalize() is called on it, so the LND must call this first */
 
-	struct lnet_msg		*msg = lnet_msg_alloc();
-	struct lnet_libmd	*getmd = getmsg->msg_md;
-	lnet_process_id_t	peer_id = getmsg->msg_target;
-	int			cpt;
+	struct lnet_msg *msg = lnet_msg_alloc();
+	struct lnet_libmd *getmd = getmsg->msg_md;
+	lnet_process_id_t peer_id = getmsg->msg_target;
+	int cpt;
 
 	LASSERT(!getmsg->msg_target_is_router);
 	LASSERT(!getmsg->msg_routing);
@@ -2263,10 +2263,10 @@ LNetGet(lnet_nid_t self, lnet_handle_md_t mdh,
 	lnet_process_id_t target, unsigned int portal,
 	__u64 match_bits, unsigned int offset)
 {
-	struct lnet_msg		*msg;
-	struct lnet_libmd	*md;
-	int			cpt;
-	int			rc;
+	struct lnet_msg *msg;
+	struct lnet_libmd *md;
+	int cpt;
+	int rc;
 
 	LASSERT(the_lnet.ln_init);
 	LASSERT(the_lnet.ln_refcount > 0);
@@ -2353,14 +2353,14 @@ EXPORT_SYMBOL(LNetGet);
 int
 LNetDist(lnet_nid_t dstnid, lnet_nid_t *srcnidp, __u32 *orderp)
 {
-	struct list_head		*e;
-	struct lnet_ni		*ni;
-	lnet_remotenet_t	*rnet;
-	__u32			dstnet = LNET_NIDNET(dstnid);
-	int			hops;
-	int			cpt;
-	__u32			order = 2;
-	struct list_head		*rn_list;
+	struct list_head *e;
+	struct lnet_ni *ni;
+	lnet_remotenet_t *rnet;
+	__u32 dstnet = LNET_NIDNET(dstnid);
+	int hops;
+	int cpt;
+	__u32 order = 2;
+	struct list_head *rn_list;
 
 	/* if !local_nid_dist_zero, I don't return a distance of 0 ever
 	 * (when lustre sees a distance of 0, it substitutes 0@lo), so I
-- 
1.7.1

