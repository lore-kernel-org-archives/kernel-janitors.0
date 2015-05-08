From: Mike Shuey <shuey@purdue.edu>
Date: Fri, 08 May 2015 12:00:57 +0000
Subject: [PATCH v2 5/8] staging: lustre: lnet: lnet: code cleanup - variable declaration spacing
Message-Id: <1431086460-22455-13-git-send-email-shuey@purdue.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1431086460-22455-9-git-send-email-shuey@purdue.edu>
In-Reply-To: <1431086460-22455-9-git-send-email-shuey@purdue.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oleg.drokin@intel.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, Mike Shuey <shuey@purdue.edu>

Unify spacing among variable declaration and bulk assignments.

Signed-off-by: Mike Shuey <shuey@purdue.edu>
---
 drivers/staging/lustre/lnet/lnet/lib-msg.c |   50 ++++++------
 drivers/staging/lustre/lnet/lnet/lib-ptl.c |  116 ++++++++++++++--------------
 drivers/staging/lustre/lnet/lnet/lo.c      |    2 +-
 drivers/staging/lustre/lnet/lnet/module.c  |    8 +-
 4 files changed, 88 insertions(+), 88 deletions(-)

diff --git a/drivers/staging/lustre/lnet/lnet/lib-msg.c b/drivers/staging/lustre/lnet/lnet/lib-msg.c
index a46ccbf..65d7595 100644
--- a/drivers/staging/lustre/lnet/lnet/lib-msg.c
+++ b/drivers/staging/lustre/lnet/lnet/lib-msg.c
@@ -60,8 +60,8 @@ lnet_build_unlink_event(lnet_libmd_t *md, lnet_event_t *ev)
 void
 lnet_build_msg_event(lnet_msg_t *msg, lnet_event_kind_t ev_type)
 {
-	lnet_hdr_t	*hdr = &msg->msg_hdr;
-	lnet_event_t	*ev  = &msg->msg_ev;
+	lnet_hdr_t *hdr = &msg->msg_hdr;
+	lnet_event_t *ev  = &msg->msg_ev;
 
 	LASSERT(!msg->msg_routing);
 
@@ -73,7 +73,7 @@ lnet_build_msg_event(lnet_msg_t *msg, lnet_event_kind_t ev_type)
 		ev->target.pid    = le32_to_cpu(hdr->dest_pid);
 		ev->initiator.nid = LNET_NID_ANY;
 		ev->initiator.pid = the_lnet.ln_pid;
-		ev->sender	  = LNET_NID_ANY;
+		ev->sender        = LNET_NID_ANY;
 
 	} else {
 		/* event for passive message */
@@ -82,9 +82,9 @@ lnet_build_msg_event(lnet_msg_t *msg, lnet_event_kind_t ev_type)
 		ev->initiator.pid = hdr->src_pid;
 		ev->initiator.nid = hdr->src_nid;
 		ev->rlength       = hdr->payload_length;
-		ev->sender	  = msg->msg_from;
-		ev->mlength	  = msg->msg_wanted;
-		ev->offset	  = msg->msg_offset;
+		ev->sender        = msg->msg_from;
+		ev->mlength       = msg->msg_wanted;
+		ev->offset        = msg->msg_offset;
 	}
 
 	switch (ev_type) {
@@ -137,7 +137,7 @@ void
 lnet_msg_commit(lnet_msg_t *msg, int cpt)
 {
 	struct lnet_msg_container *container = the_lnet.ln_msg_containers[cpt];
-	lnet_counters_t		  *counters  = the_lnet.ln_counters[cpt];
+	lnet_counters_t *counters  = the_lnet.ln_counters[cpt];
 
 	/* routed message can be committed for both receiving and sending */
 	LASSERT(!msg->msg_tx_committed);
@@ -170,7 +170,7 @@ static void
 lnet_msg_decommit_tx(lnet_msg_t *msg, int status)
 {
 	lnet_counters_t	*counters;
-	lnet_event_t	*ev = &msg->msg_ev;
+	lnet_event_t *ev = &msg->msg_ev;
 
 	LASSERT(msg->msg_tx_committed);
 	if (status != 0)
@@ -219,8 +219,8 @@ lnet_msg_decommit_tx(lnet_msg_t *msg, int status)
 static void
 lnet_msg_decommit_rx(lnet_msg_t *msg, int status)
 {
-	lnet_counters_t	*counters;
-	lnet_event_t	*ev = &msg->msg_ev;
+	lnet_counters_t *counters;
+	lnet_event_t *ev = &msg->msg_ev;
 
 	LASSERT(!msg->msg_tx_committed); /* decommitted or never committed */
 	LASSERT(msg->msg_rx_committed);
@@ -273,7 +273,7 @@ lnet_msg_decommit_rx(lnet_msg_t *msg, int status)
 void
 lnet_msg_decommit(lnet_msg_t *msg, int cpt, int status)
 {
-	int	cpt2 = cpt;
+	int cpt2 = cpt;
 
 	LASSERT(msg->msg_tx_committed || msg->msg_rx_committed);
 	LASSERT(msg->msg_onactivelist);
@@ -335,8 +335,8 @@ lnet_msg_attach_md(lnet_msg_t *msg, lnet_libmd_t *md,
 void
 lnet_msg_detach_md(lnet_msg_t *msg, int status)
 {
-	lnet_libmd_t	*md = msg->msg_md;
-	int		unlink;
+	lnet_libmd_t *md = msg->msg_md;
+	int unlink;
 
 	/* Now it's safe to drop my caller's ref */
 	md->md_refcount--;
@@ -359,8 +359,8 @@ static int
 lnet_complete_msg_locked(lnet_msg_t *msg, int cpt)
 {
 	lnet_handle_wire_t ack_wmd;
-	int		rc;
-	int		status = msg->msg_ev.status;
+	int rc;
+	int status = msg->msg_ev.status;
 
 	LASSERT(msg->msg_onactivelist);
 
@@ -434,11 +434,11 @@ lnet_complete_msg_locked(lnet_msg_t *msg, int cpt)
 void
 lnet_finalize(lnet_ni_t *ni, lnet_msg_t *msg, int status)
 {
-	struct lnet_msg_container	*container;
-	int				my_slot;
-	int				cpt;
-	int				rc;
-	int				i;
+	struct lnet_msg_container *container;
+	int my_slot;
+	int cpt;
+	int rc;
+	int i;
 
 	LASSERT(!in_interrupt());
 
@@ -534,7 +534,7 @@ EXPORT_SYMBOL(lnet_finalize);
 void
 lnet_msg_container_cleanup(struct lnet_msg_container *container)
 {
-	int     count = 0;
+	int count = 0;
 
 	if (container->msc_init = 0)
 		return;
@@ -568,7 +568,7 @@ lnet_msg_container_cleanup(struct lnet_msg_container *container)
 int
 lnet_msg_container_setup(struct lnet_msg_container *container, int cpt)
 {
-	int	rc;
+	int rc;
 
 	container->msc_init = 1;
 
@@ -608,7 +608,7 @@ void
 lnet_msg_containers_destroy(void)
 {
 	struct lnet_msg_container *container;
-	int     i;
+	int i;
 
 	if (the_lnet.ln_msg_containers = NULL)
 		return;
@@ -624,8 +624,8 @@ int
 lnet_msg_containers_create(void)
 {
 	struct lnet_msg_container *container;
-	int	rc;
-	int	i;
+	int rc;
+	int i;
 
 	the_lnet.ln_msg_containers = cfs_percpt_alloc(lnet_cpt_table(),
 						      sizeof(*container));
diff --git a/drivers/staging/lustre/lnet/lnet/lib-ptl.c b/drivers/staging/lustre/lnet/lnet/lib-ptl.c
index 3ba0da9..832b4a3 100644
--- a/drivers/staging/lustre/lnet/lnet/lib-ptl.c
+++ b/drivers/staging/lustre/lnet/lnet/lib-ptl.c
@@ -39,7 +39,7 @@
 #include "../../include/linux/lnet/lib-lnet.h"
 
 /* NB: add /proc interfaces in upcoming patches */
-int	portal_rotor	= LNET_PTL_ROTOR_HASH_RT;
+int portal_rotor = LNET_PTL_ROTOR_HASH_RT;
 module_param(portal_rotor, int, 0644);
 MODULE_PARM_DESC(portal_rotor, "redirect PUTs to different cpu-partitions");
 
@@ -47,8 +47,8 @@ static int
 lnet_ptl_match_type(unsigned int index, lnet_process_id_t match_id,
 		    __u64 mbits, __u64 ignore_bits)
 {
-	struct lnet_portal	*ptl = the_lnet.ln_portals[index];
-	int			unique;
+	struct lnet_portal *ptl = the_lnet.ln_portals[index];
+	int unique;
 
 	unique = ignore_bits = 0 &&
 		 match_id.nid != LNET_NID_ANY &&
@@ -89,7 +89,7 @@ static void
 lnet_ptl_enable_mt(struct lnet_portal *ptl, int cpt)
 {
 	struct lnet_match_table	*mtable = ptl->ptl_mtables[cpt];
-	int			i;
+	int i;
 
 	/* with hold of both lnet_res_lock(cpt) and lnet_ptl_lock */
 	LASSERT(lnet_ptl_is_wildcard(ptl));
@@ -114,7 +114,7 @@ static void
 lnet_ptl_disable_mt(struct lnet_portal *ptl, int cpt)
 {
 	struct lnet_match_table	*mtable = ptl->ptl_mtables[cpt];
-	int			i;
+	int i;
 
 	/* with hold of both lnet_res_lock(cpt) and lnet_ptl_lock */
 	LASSERT(lnet_ptl_is_wildcard(ptl));
@@ -141,9 +141,9 @@ lnet_try_match_md(lnet_libmd_t *md,
 {
 	/* ALWAYS called holding the lnet_res_lock, and can't lnet_res_unlock;
 	 * lnet_match_blocked_msg() relies on this to avoid races */
-	unsigned int	offset;
-	unsigned int	mlength;
-	lnet_me_t	*me = md->md_me;
+	unsigned int offset;
+	unsigned int mlength;
+	lnet_me_t *me = md->md_me;
 
 	/* MD exhausted */
 	if (lnet_md_exhausted(md))
@@ -227,7 +227,7 @@ struct lnet_match_table *
 lnet_mt_of_attach(unsigned int index, lnet_process_id_t id,
 		  __u64 mbits, __u64 ignore_bits, lnet_ins_pos_t pos)
 {
-	struct lnet_portal	*ptl;
+	struct lnet_portal *ptl;
 	struct lnet_match_table	*mtable;
 
 	/* NB: called w/o lock */
@@ -261,11 +261,11 @@ static struct lnet_match_table *
 lnet_mt_of_match(struct lnet_match_info *info, struct lnet_msg *msg)
 {
 	struct lnet_match_table	*mtable;
-	struct lnet_portal	*ptl;
-	unsigned int		nmaps;
-	unsigned int		rotor;
-	unsigned int		cpt;
-	bool			routed;
+	struct lnet_portal *ptl;
+	unsigned int nmaps;
+	unsigned int rotor;
+	unsigned int cpt;
+	bool routed;
 
 	/* NB: called w/o lock */
 	LASSERT(info->mi_portal < the_lnet.ln_nportals);
@@ -312,8 +312,8 @@ lnet_mt_of_match(struct lnet_match_info *info, struct lnet_msg *msg)
 static int
 lnet_mt_test_exhausted(struct lnet_match_table *mtable, int pos)
 {
-	__u64	*bmap;
-	int	i;
+	__u64 *bmap;
+	int i;
 
 	if (!lnet_ptl_is_wildcard(the_lnet.ln_portals[mtable->mt_portal]))
 		return 0;
@@ -337,7 +337,7 @@ lnet_mt_test_exhausted(struct lnet_match_table *mtable, int pos)
 static void
 lnet_mt_set_exhausted(struct lnet_match_table *mtable, int pos, int exhausted)
 {
-	__u64	*bmap;
+	__u64 *bmap;
 
 	LASSERT(lnet_ptl_is_wildcard(the_lnet.ln_portals[mtable->mt_portal]));
 	LASSERT(pos <= LNET_MT_HASH_IGNORE);
@@ -373,11 +373,11 @@ int
 lnet_mt_match_md(struct lnet_match_table *mtable,
 		 struct lnet_match_info *info, struct lnet_msg *msg)
 {
-	struct list_head		*head;
-	lnet_me_t		*me;
-	lnet_me_t		*tmp;
-	int			exhausted = 0;
-	int			rc;
+	struct list_head *head;
+	lnet_me_t *me;
+	lnet_me_t *tmp;
+	int exhausted = 0;
+	int rc;
 
 	/* any ME with ignore bits? */
 	if (!list_empty(&mtable->mt_mhash[LNET_MT_HASH_IGNORE]))
@@ -428,7 +428,7 @@ lnet_mt_match_md(struct lnet_match_table *mtable,
 static int
 lnet_ptl_match_early(struct lnet_portal *ptl, struct lnet_msg *msg)
 {
-	int	rc;
+	int rc;
 
 	/* message arrived before any buffer posting on this portal,
 	 * simply delay or drop this message */
@@ -461,9 +461,9 @@ static int
 lnet_ptl_match_delay(struct lnet_portal *ptl,
 		     struct lnet_match_info *info, struct lnet_msg *msg)
 {
-	int	first = ptl->ptl_mt_maps[0]; /* read w/o lock */
-	int	rc = 0;
-	int	i;
+	int first = ptl->ptl_mt_maps[0]; /* read w/o lock */
+	int rc = 0;
+	int i;
 
 	/* steal buffer from other CPTs, and delay it if nothing to steal,
 	 * this function is more expensive than a regular match, but we
@@ -472,7 +472,7 @@ lnet_ptl_match_delay(struct lnet_portal *ptl,
 
 	for (i = 0; i < LNET_CPT_NUMBER; i++) {
 		struct lnet_match_table *mtable;
-		int			cpt;
+		int cpt;
 
 		cpt = (first + i) % LNET_CPT_NUMBER;
 		mtable = ptl->ptl_mtables[cpt];
@@ -536,8 +536,8 @@ int
 lnet_ptl_match_md(struct lnet_match_info *info, struct lnet_msg *msg)
 {
 	struct lnet_match_table	*mtable;
-	struct lnet_portal	*ptl;
-	int			rc;
+	struct lnet_portal *ptl;
+	int rc;
 
 	CDEBUG(D_NET, "Request from %s of length %d into portal %d MB=%#llx\n",
 	       libcfs_id2str(info->mi_id), info->mi_rlength, info->mi_portal,
@@ -622,13 +622,13 @@ void
 lnet_ptl_attach_md(lnet_me_t *me, lnet_libmd_t *md,
 		   struct list_head *matches, struct list_head *drops)
 {
-	struct lnet_portal	*ptl = the_lnet.ln_portals[me->me_portal];
+	struct lnet_portal *ptl = the_lnet.ln_portals[me->me_portal];
 	struct lnet_match_table	*mtable;
-	struct list_head		*head;
-	lnet_msg_t		*tmp;
-	lnet_msg_t		*msg;
-	int			exhausted = 0;
-	int			cpt;
+	struct list_head *head;
+	lnet_msg_t *tmp;
+	lnet_msg_t *msg;
+	int exhausted = 0;
+	int cpt;
 
 	LASSERT(md->md_refcount = 0); /* a brand new MD */
 
@@ -647,20 +647,20 @@ lnet_ptl_attach_md(lnet_me_t *me, lnet_libmd_t *md,
 	head = &ptl->ptl_msg_stealing;
  again:
 	list_for_each_entry_safe(msg, tmp, head, msg_list) {
-		struct lnet_match_info	info;
-		lnet_hdr_t		*hdr;
-		int			rc;
+		struct lnet_match_info info;
+		lnet_hdr_t *hdr;
+		int rc;
 
 		LASSERT(msg->msg_rx_delayed || head = &ptl->ptl_msg_stealing);
 
-		hdr   = &msg->msg_hdr;
-		info.mi_id.nid	= hdr->src_nid;
-		info.mi_id.pid	= hdr->src_pid;
-		info.mi_opc	= LNET_MD_OP_PUT;
-		info.mi_portal	= hdr->msg.put.ptl_index;
-		info.mi_rlength	= hdr->payload_length;
-		info.mi_roffset	= hdr->msg.put.offset;
-		info.mi_mbits	= hdr->msg.put.match_bits;
+		hdr = &msg->msg_hdr;
+		info.mi_id.nid  = hdr->src_nid;
+		info.mi_id.pid  = hdr->src_pid;
+		info.mi_opc     = LNET_MD_OP_PUT;
+		info.mi_portal  = hdr->msg.put.ptl_index;
+		info.mi_rlength = hdr->payload_length;
+		info.mi_roffset = hdr->msg.put.offset;
+		info.mi_mbits   = hdr->msg.put.match_bits;
 
 		rc = lnet_try_match_md(md, &info, msg);
 
@@ -715,7 +715,7 @@ static void
 lnet_ptl_cleanup(struct lnet_portal *ptl)
 {
 	struct lnet_match_table	*mtable;
-	int			i;
+	int i;
 
 	if (ptl->ptl_mtables = NULL) /* uninitialized portal */
 		return;
@@ -723,9 +723,9 @@ lnet_ptl_cleanup(struct lnet_portal *ptl)
 	LASSERT(list_empty(&ptl->ptl_msg_delayed));
 	LASSERT(list_empty(&ptl->ptl_msg_stealing));
 	cfs_percpt_for_each(mtable, i, ptl->ptl_mtables) {
-		struct list_head	*mhash;
-		lnet_me_t	*me;
-		int		j;
+		struct list_head *mhash;
+		lnet_me_t *me;
+		int j;
 
 		if (mtable->mt_mhash = NULL) /* uninitialized match-table */
 			continue;
@@ -753,9 +753,9 @@ static int
 lnet_ptl_setup(struct lnet_portal *ptl, int index)
 {
 	struct lnet_match_table	*mtable;
-	struct list_head		*mhash;
-	int			i;
-	int			j;
+	struct list_head *mhash;
+	int i;
+	int j;
 
 	ptl->ptl_mtables = cfs_percpt_alloc(lnet_cpt_table(),
 					    sizeof(struct lnet_match_table));
@@ -798,7 +798,7 @@ lnet_ptl_setup(struct lnet_portal *ptl, int index)
 void
 lnet_portals_destroy(void)
 {
-	int	i;
+	int i;
 
 	if (the_lnet.ln_portals = NULL)
 		return;
@@ -813,8 +813,8 @@ lnet_portals_destroy(void)
 int
 lnet_portals_create(void)
 {
-	int	size;
-	int	i;
+	int size;
+	int i;
 
 	size = offsetof(struct lnet_portal, ptl_mt_maps[LNET_CPT_NUMBER]);
 
@@ -898,8 +898,8 @@ EXPORT_SYMBOL(LNetSetLazyPortal);
 int
 LNetClearLazyPortal(int portal)
 {
-	struct lnet_portal	*ptl;
-	LIST_HEAD		(zombies);
+	struct lnet_portal *ptl;
+	LIST_HEAD (zombies);
 
 	if (portal < 0 || portal >= the_lnet.ln_nportals)
 		return -EINVAL;
diff --git a/drivers/staging/lustre/lnet/lnet/lo.c b/drivers/staging/lustre/lnet/lnet/lo.c
index f708c2e..2a137f4 100644
--- a/drivers/staging/lustre/lnet/lnet/lo.c
+++ b/drivers/staging/lustre/lnet/lnet/lo.c
@@ -111,7 +111,7 @@ lnd_t the_lolnd = {
 	/* .lnd_type       = */ LOLND,
 	/* .lnd_startup    = */ lolnd_startup,
 	/* .lnd_shutdown   = */ lolnd_shutdown,
-	/* .lnt_ctl	= */ NULL,
+	/* .lnt_ctl        = */ NULL,
 	/* .lnd_send       = */ lolnd_send,
 	/* .lnd_recv       = */ lolnd_recv,
 	/* .lnd_eager_recv = */ NULL,
diff --git a/drivers/staging/lustre/lnet/lnet/module.c b/drivers/staging/lustre/lnet/lnet/module.c
index 72b7fbc..ff3f831 100644
--- a/drivers/staging/lustre/lnet/lnet/module.c
+++ b/drivers/staging/lustre/lnet/lnet/module.c
@@ -47,7 +47,7 @@ static int
 lnet_configure(void *arg)
 {
 	/* 'arg' only there so I can be passed to cfs_create_thread() */
-	int    rc = 0;
+	int rc = 0;
 
 	LNET_MUTEX_LOCK(&lnet_config_mutex);
 
@@ -66,7 +66,7 @@ lnet_configure(void *arg)
 static int
 lnet_unconfigure(void)
 {
-	int   refcount;
+	int refcount;
 
 	LNET_MUTEX_LOCK(&lnet_config_mutex);
 
@@ -86,7 +86,7 @@ lnet_unconfigure(void)
 static int
 lnet_ioctl(unsigned int cmd, struct libcfs_ioctl_data *data)
 {
-	int   rc;
+	int rc;
 
 	switch (cmd) {
 	case IOC_LIBCFS_CONFIGURE:
@@ -113,7 +113,7 @@ static DECLARE_IOCTL_HANDLER(lnet_ioctl_handler, lnet_ioctl);
 static int __init
 init_lnet(void)
 {
-	int		  rc;
+	int rc;
 
 	mutex_init(&lnet_config_mutex);
 
-- 
1.7.1

