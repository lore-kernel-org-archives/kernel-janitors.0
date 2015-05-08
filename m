From: Mike Shuey <shuey@purdue.edu>
Date: Fri, 08 May 2015 12:00:59 +0000
Subject: [PATCH v2 7/8] staging: lustre: code cleanup - variable declaration cleanups
Message-Id: <1431086460-22455-15-git-send-email-shuey@purdue.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1431086460-22455-9-git-send-email-shuey@purdue.edu>
In-Reply-To: <1431086460-22455-9-git-send-email-shuey@purdue.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oleg.drokin@intel.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, Mike Shuey <shuey@purdue.edu>

Unify variable declarations to a single space.

Signed-off-by: Mike Shuey <shuey@purdue.edu>
---
 drivers/staging/lustre/lnet/lnet/peer.c        |   50 +++---
 drivers/staging/lustre/lnet/lnet/router.c      |  224 ++++++++++++------------
 drivers/staging/lustre/lnet/lnet/router_proc.c |  210 +++++++++++-----------
 3 files changed, 242 insertions(+), 242 deletions(-)

diff --git a/drivers/staging/lustre/lnet/lnet/peer.c b/drivers/staging/lustre/lnet/lnet/peer.c
index 45b5742..1fceed3 100644
--- a/drivers/staging/lustre/lnet/lnet/peer.c
+++ b/drivers/staging/lustre/lnet/lnet/peer.c
@@ -43,10 +43,10 @@
 int
 lnet_peer_tables_create(void)
 {
-	struct lnet_peer_table	*ptable;
-	struct list_head		*hash;
-	int			i;
-	int			j;
+	struct lnet_peer_table *ptable;
+	struct list_head *hash;
+	int i;
+	int j;
 
 	the_lnet.ln_peer_tables = cfs_percpt_alloc(lnet_cpt_table(),
 						   sizeof(*ptable));
@@ -77,10 +77,10 @@ lnet_peer_tables_create(void)
 void
 lnet_peer_tables_destroy(void)
 {
-	struct lnet_peer_table	*ptable;
-	struct list_head		*hash;
-	int			i;
-	int			j;
+	struct lnet_peer_table *ptable;
+	struct list_head *hash;
+	int i;
+	int j;
 
 	if (the_lnet.ln_peer_tables = NULL)
 		return;
@@ -106,9 +106,9 @@ lnet_peer_tables_destroy(void)
 void
 lnet_peer_tables_cleanup(void)
 {
-	struct lnet_peer_table	*ptable;
-	int			i;
-	int			j;
+	struct lnet_peer_table *ptable;
+	int i;
+	int j;
 
 	LASSERT(the_lnet.ln_shutdown);	/* i.e. no new peers */
 
@@ -133,7 +133,7 @@ lnet_peer_tables_cleanup(void)
 
 	cfs_percpt_for_each(ptable, i, the_lnet.ln_peer_tables) {
 		LIST_HEAD(deathrow);
-		lnet_peer_t	*lp;
+		lnet_peer_t *lp;
 
 		lnet_net_lock(i);
 
@@ -186,8 +186,8 @@ lnet_destroy_peer_locked(lnet_peer_t *lp)
 lnet_peer_t *
 lnet_find_peer_locked(struct lnet_peer_table *ptable, lnet_nid_t nid)
 {
-	struct list_head	*peers;
-	lnet_peer_t	*lp;
+	struct list_head *peers;
+	lnet_peer_t *lp;
 
 	LASSERT(!the_lnet.ln_shutdown);
 
@@ -205,11 +205,11 @@ lnet_find_peer_locked(struct lnet_peer_table *ptable, lnet_nid_t nid)
 int
 lnet_nid2peer_locked(lnet_peer_t **lpp, lnet_nid_t nid, int cpt)
 {
-	struct lnet_peer_table	*ptable;
-	lnet_peer_t		*lp = NULL;
-	lnet_peer_t		*lp2;
-	int			cpt2;
-	int			rc = 0;
+	struct lnet_peer_table *ptable;
+	lnet_peer_t *lp = NULL;
+	lnet_peer_t *lp2;
+	int cpt2;
+	int rc = 0;
 
 	*lpp = NULL;
 	if (the_lnet.ln_shutdown) /* it's shutting down */
@@ -287,8 +287,8 @@ lnet_nid2peer_locked(lnet_peer_t **lpp, lnet_nid_t nid, int cpt)
 		goto out;
 	}
 
-	lp->lp_txcredits    -	lp->lp_mintxcredits = lp->lp_ni->ni_peertxcredits;
+	lp->lp_txcredits     +	lp->lp_mintxcredits  = lp->lp_ni->ni_peertxcredits;
 	lp->lp_rtrcredits     	lp->lp_minrtrcredits = lnet_peer_buffer_credits(lp->lp_ni);
 
@@ -308,10 +308,10 @@ out:
 void
 lnet_debug_peer(lnet_nid_t nid)
 {
-	char		*aliveness = "NA";
-	lnet_peer_t	*lp;
-	int		rc;
-	int		cpt;
+	char *aliveness = "NA";
+	lnet_peer_t *lp;
+	int rc;
+	int cpt;
 
 	cpt = lnet_cpt_of_nid(nid);
 	lnet_net_lock(cpt);
diff --git a/drivers/staging/lustre/lnet/lnet/router.c b/drivers/staging/lustre/lnet/lnet/router.c
index 8510bae..96886a2 100644
--- a/drivers/staging/lustre/lnet/lnet/router.c
+++ b/drivers/staging/lustre/lnet/lnet/router.c
@@ -139,8 +139,8 @@ lnet_notify_locked(lnet_peer_t *lp, int notifylnd, int alive,
 static void
 lnet_ni_notify_locked(lnet_ni_t *ni, lnet_peer_t *lp)
 {
-	int	alive;
-	int	notifylnd;
+	int alive;
+	int notifylnd;
 
 	/* Notify only in 1 thread at any time to ensure ordered notification.
 	 * NB individual events can be missed; the only guarantee is that you
@@ -152,7 +152,7 @@ lnet_ni_notify_locked(lnet_ni_t *ni, lnet_peer_t *lp)
 	lp->lp_notifying = 1;
 
 	while (lp->lp_notify) {
-		alive     = lp->lp_alive;
+		alive = lp->lp_alive;
 		notifylnd = lp->lp_notifylnd;
 
 		lp->lp_notifylnd = 0;
@@ -228,9 +228,9 @@ lnet_rtr_decref_locked(lnet_peer_t *lp)
 lnet_remotenet_t *
 lnet_find_net_locked(__u32 net)
 {
-	lnet_remotenet_t	*rnet;
-	struct list_head		*tmp;
-	struct list_head		*rn_list;
+	lnet_remotenet_t *rnet;
+	struct list_head *tmp;
+	struct list_head *rn_list;
 
 	LASSERT(!the_lnet.ln_shutdown);
 
@@ -276,9 +276,9 @@ static void lnet_shuffle_seed(void)
 static void
 lnet_add_route_to_rnet(lnet_remotenet_t *rnet, lnet_route_t *route)
 {
-	unsigned int      len = 0;
-	unsigned int      offset = 0;
-	struct list_head       *e;
+	unsigned int len = 0;
+	unsigned int offset = 0;
+	struct list_head *e;
 
 	lnet_shuffle_seed();
 
@@ -304,13 +304,13 @@ int
 lnet_add_route(__u32 net, unsigned int hops, lnet_nid_t gateway,
 	       unsigned int priority)
 {
-	struct list_head	  *e;
-	lnet_remotenet_t    *rnet;
-	lnet_remotenet_t    *rnet2;
-	lnet_route_t	*route;
-	lnet_ni_t	   *ni;
-	int		  add_route;
-	int		  rc;
+	struct list_head *e;
+	lnet_remotenet_t *rnet;
+	lnet_remotenet_t *rnet2;
+	lnet_route_t *route;
+	lnet_ni_t *ni;
+	int add_route;
+	int rc;
 
 	CDEBUG(D_NET, "Add route: net %s hops %u priority %u gw %s\n",
 	       libcfs_net2str(net), hops, priority, libcfs_nid2str(gateway));
@@ -416,14 +416,14 @@ lnet_add_route(__u32 net, unsigned int hops, lnet_nid_t gateway,
 int
 lnet_check_routes(void)
 {
-	lnet_remotenet_t	*rnet;
-	lnet_route_t		*route;
-	lnet_route_t		*route2;
-	struct list_head		*e1;
-	struct list_head		*e2;
-	int			cpt;
-	struct list_head		*rn_list;
-	int			i;
+	lnet_remotenet_t *rnet;
+	lnet_route_t *route;
+	lnet_route_t *route2;
+	struct list_head *e1;
+	struct list_head *e2;
+	int cpt;
+	struct list_head *rn_list;
+	int i;
 
 	cpt = lnet_net_lock_current();
 
@@ -434,9 +434,9 @@ lnet_check_routes(void)
 
 			route2 = NULL;
 			list_for_each(e2, &rnet->lrn_routes) {
-				lnet_nid_t	nid1;
-				lnet_nid_t	nid2;
-				int		net;
+				lnet_nid_t nid1;
+				lnet_nid_t nid2;
+				int net;
 
 				route = list_entry(e2, lnet_route_t,
 						       lr_list);
@@ -472,14 +472,14 @@ lnet_check_routes(void)
 int
 lnet_del_route(__u32 net, lnet_nid_t gw_nid)
 {
-	struct lnet_peer	*gateway;
-	lnet_remotenet_t	*rnet;
-	lnet_route_t		*route;
-	struct list_head		*e1;
-	struct list_head		*e2;
-	int			rc = -ENOENT;
-	struct list_head		*rn_list;
-	int			idx = 0;
+	struct lnet_peer *gateway;
+	lnet_remotenet_t *rnet;
+	lnet_route_t *route;
+	struct list_head *e1;
+	struct list_head *e2;
+	int rc = -ENOENT;
+	struct list_head *rn_list;
+	int idx = 0;
 
 	CDEBUG(D_NET, "Del route: net %s : gw %s\n",
 	       libcfs_net2str(net), libcfs_nid2str(gw_nid));
@@ -554,13 +554,13 @@ int
 lnet_get_route(int idx, __u32 *net, __u32 *hops,
 	       lnet_nid_t *gateway, __u32 *alive, __u32 *priority)
 {
-	struct list_head		*e1;
-	struct list_head		*e2;
-	lnet_remotenet_t	*rnet;
-	lnet_route_t		*route;
-	int			cpt;
-	int			i;
-	struct list_head		*rn_list;
+	struct list_head *e1;
+	struct list_head *e2;
+	lnet_remotenet_t *rnet;
+	lnet_route_t *route;
+	int cpt;
+	int i;
+	struct list_head *rn_list;
 
 	cpt = lnet_net_lock_current();
 
@@ -574,11 +574,11 @@ lnet_get_route(int idx, __u32 *net, __u32 *hops,
 						       lr_list);
 
 				if (idx-- = 0) {
-					*net	  = rnet->lrn_net;
-					*hops	  = route->lr_hops;
+					*net      = rnet->lrn_net;
+					*hops     = route->lr_hops;
 					*priority = route->lr_priority;
 					*gateway  = route->lr_gateway->lp_nid;
-					*alive	  = route->lr_gateway->lp_alive;
+					*alive    = route->lr_gateway->lp_alive;
 					lnet_net_unlock(cpt);
 					return 0;
 				}
@@ -593,7 +593,7 @@ lnet_get_route(int idx, __u32 *net, __u32 *hops,
 void
 lnet_swap_pinginfo(lnet_ping_info_t *info)
 {
-	int	       i;
+	int i;
 	lnet_ni_status_t *stat;
 
 	__swab32s(&info->pi_magic);
@@ -614,9 +614,9 @@ lnet_swap_pinginfo(lnet_ping_info_t *info)
 static void
 lnet_parse_rc_info(lnet_rc_data_t *rcd)
 {
-	lnet_ping_info_t	*info = rcd->rcd_pinginfo;
-	struct lnet_peer	*gw   = rcd->rcd_gateway;
-	lnet_route_t		*rtr;
+	lnet_ping_info_t *info = rcd->rcd_pinginfo;
+	struct lnet_peer *gw = rcd->rcd_gateway;
+	lnet_route_t *rtr;
 
 	if (!gw->lp_alive)
 		return;
@@ -643,14 +643,14 @@ lnet_parse_rc_info(lnet_rc_data_t *rcd)
 		return; /* can't carry NI status info */
 
 	list_for_each_entry(rtr, &gw->lp_routes, lr_gwlist) {
-		int	ptl_status = LNET_NI_STATUS_INVALID;
-		int	down = 0;
-		int	up = 0;
-		int	i;
+		int ptl_status = LNET_NI_STATUS_INVALID;
+		int down = 0;
+		int up = 0;
+		int i;
 
 		for (i = 0; i < info->pi_nnis && i < LNET_MAX_RTR_NIS; i++) {
 			lnet_ni_status_t *stat = &info->pi_ni[i];
-			lnet_nid_t	 nid = stat->ns_nid;
+			lnet_nid_t nid = stat->ns_nid;
 
 			if (nid = LNET_NID_ANY) {
 				CDEBUG(D_NET, "%s: unexpected LNET_NID_ANY\n",
@@ -699,8 +699,8 @@ lnet_parse_rc_info(lnet_rc_data_t *rcd)
 static void
 lnet_router_checker_event(lnet_event_t *event)
 {
-	lnet_rc_data_t		*rcd = event->md.user_ptr;
-	struct lnet_peer	*lp;
+	lnet_rc_data_t *rcd = event->md.user_ptr;
+	struct lnet_peer *lp;
 
 	LASSERT(rcd != NULL);
 
@@ -752,14 +752,14 @@ lnet_router_checker_event(lnet_event_t *event)
 static void
 lnet_wait_known_routerstate(void)
 {
-	lnet_peer_t	 *rtr;
-	struct list_head	  *entry;
-	int		  all_known;
+	lnet_peer_t *rtr;
+	struct list_head *entry;
+	int all_known;
 
 	LASSERT(the_lnet.ln_rc_state = LNET_RC_STATE_RUNNING);
 
 	for (;;) {
-		int	cpt = lnet_net_lock_current();
+		int cpt = lnet_net_lock_current();
 
 		all_known = 1;
 		list_for_each(entry, &the_lnet.ln_routers) {
@@ -799,9 +799,9 @@ lnet_router_ni_update_locked(lnet_peer_t *gw, __u32 net)
 static void
 lnet_update_ni_status_locked(void)
 {
-	lnet_ni_t	*ni;
-	long		now;
-	int		timeout;
+	lnet_ni_t *ni;
+	long now;
+	int timeout;
 
 	LASSERT(the_lnet.ln_routing);
 
@@ -860,10 +860,10 @@ lnet_destroy_rc_data(lnet_rc_data_t *rcd)
 static lnet_rc_data_t *
 lnet_create_rc_data_locked(lnet_peer_t *gateway)
 {
-	lnet_rc_data_t		*rcd = NULL;
-	lnet_ping_info_t	*pi;
-	int			rc;
-	int			i;
+	lnet_rc_data_t *rcd = NULL;
+	lnet_ping_info_t *pi;
+	int rc;
+	int i;
 
 	lnet_net_unlock(gateway->lp_cpt);
 
@@ -943,8 +943,8 @@ static void
 lnet_ping_router_locked(lnet_peer_t *rtr)
 {
 	lnet_rc_data_t *rcd = NULL;
-	unsigned long      now = cfs_time_current();
-	int	     secs;
+	unsigned long now = cfs_time_current();
+	int secs;
 
 	lnet_peer_addref_locked(rtr);
 
@@ -979,9 +979,9 @@ lnet_ping_router_locked(lnet_peer_t *rtr)
 	if (secs != 0 && !rtr->lp_ping_notsent &&
 	    cfs_time_after(now, cfs_time_add(rtr->lp_ping_timestamp,
 					     cfs_time_seconds(secs)))) {
-		int	       rc;
+		int rc;
 		lnet_process_id_t id;
-		lnet_handle_md_t  mdh;
+		lnet_handle_md_t mdh;
 
 		id.nid = rtr->lp_nid;
 		id.pid = LUSTRE_SRV_LNET_PID;
@@ -1013,8 +1013,8 @@ lnet_ping_router_locked(lnet_peer_t *rtr)
 int
 lnet_router_checker_start(void)
 {
-	int	  rc;
-	int	  eqsz;
+	int rc;
+	int eqsz;
 
 	LASSERT(the_lnet.ln_rc_state = LNET_RC_STATE_SHUTDOWN);
 
@@ -1085,11 +1085,11 @@ lnet_router_checker_stop(void)
 static void
 lnet_prune_rc_data(int wait_unlink)
 {
-	lnet_rc_data_t		*rcd;
-	lnet_rc_data_t		*tmp;
-	lnet_peer_t		*lp;
-	struct list_head		head;
-	int			i = 2;
+	lnet_rc_data_t *rcd;
+	lnet_rc_data_t *tmp;
+	lnet_peer_t *lp;
+	struct list_head head;
+	int i = 2;
 
 	if (likely(the_lnet.ln_rc_state = LNET_RC_STATE_RUNNING &&
 		   list_empty(&the_lnet.ln_rcd_deathrow) &&
@@ -1169,17 +1169,17 @@ lnet_prune_rc_data(int wait_unlink)
 static int
 lnet_router_checker(void *arg)
 {
-	lnet_peer_t       *rtr;
-	struct list_head	*entry;
+	lnet_peer_t *rtr;
+	struct list_head *entry;
 
 	cfs_block_allsigs();
 
 	LASSERT(the_lnet.ln_rc_state = LNET_RC_STATE_RUNNING);
 
 	while (the_lnet.ln_rc_state = LNET_RC_STATE_RUNNING) {
-		__u64	version;
-		int	cpt;
-		int	cpt2;
+		__u64 version;
+		int cpt;
+		int cpt2;
 
 		cpt = lnet_net_lock_current();
 rescan:
@@ -1245,11 +1245,11 @@ lnet_destroy_rtrbuf(lnet_rtrbuf_t *rb, int npages)
 static lnet_rtrbuf_t *
 lnet_new_rtrbuf(lnet_rtrbufpool_t *rbp, int cpt)
 {
-	int	    npages = rbp->rbp_npages;
-	int	    sz = offsetof(lnet_rtrbuf_t, rb_kiov[npages]);
-	struct page   *page;
+	int npages = rbp->rbp_npages;
+	int sz = offsetof(lnet_rtrbuf_t, rb_kiov[npages]);
+	struct page *page;
 	lnet_rtrbuf_t *rb;
-	int	    i;
+	int i;
 
 	LIBCFS_CPT_ALLOC(rb, lnet_cpt_table(), cpt, sz);
 	if (rb = NULL)
@@ -1280,9 +1280,9 @@ lnet_new_rtrbuf(lnet_rtrbufpool_t *rbp, int cpt)
 static void
 lnet_rtrpool_free_bufs(lnet_rtrbufpool_t *rbp)
 {
-	int		npages = rbp->rbp_npages;
-	int		nbuffers = 0;
-	lnet_rtrbuf_t	*rb;
+	int npages = rbp->rbp_npages;
+	int nbuffers = 0;
+	lnet_rtrbuf_t *rb;
 
 	if (rbp->rbp_nbuffers = 0) /* not initialized or already freed */
 		return;
@@ -1310,7 +1310,7 @@ static int
 lnet_rtrpool_alloc_bufs(lnet_rtrbufpool_t *rbp, int nbufs, int cpt)
 {
 	lnet_rtrbuf_t *rb;
-	int	    i;
+	int i;
 
 	if (rbp->rbp_nbuffers != 0) {
 		LASSERT(rbp->rbp_nbuffers = nbufs);
@@ -1355,7 +1355,7 @@ void
 lnet_rtrpools_free(void)
 {
 	lnet_rtrbufpool_t *rtrp;
-	int		  i;
+	int i;
 
 	if (the_lnet.ln_rtrpools = NULL) /* uninitialized or freed */
 		return;
@@ -1373,7 +1373,7 @@ lnet_rtrpools_free(void)
 static int
 lnet_nrb_tiny_calculate(int npages)
 {
-	int	nrbs = LNET_NRB_TINY;
+	int nrbs = LNET_NRB_TINY;
 
 	if (tiny_router_buffers < 0) {
 		LCONSOLE_ERROR_MSG(0x10c,
@@ -1392,7 +1392,7 @@ lnet_nrb_tiny_calculate(int npages)
 static int
 lnet_nrb_small_calculate(int npages)
 {
-	int	nrbs = LNET_NRB_SMALL;
+	int nrbs = LNET_NRB_SMALL;
 
 	if (small_router_buffers < 0) {
 		LCONSOLE_ERROR_MSG(0x10c,
@@ -1411,7 +1411,7 @@ lnet_nrb_small_calculate(int npages)
 static int
 lnet_nrb_large_calculate(int npages)
 {
-	int	nrbs = LNET_NRB_LARGE;
+	int nrbs = LNET_NRB_LARGE;
 
 	if (large_router_buffers < 0) {
 		LCONSOLE_ERROR_MSG(0x10c,
@@ -1431,13 +1431,13 @@ int
 lnet_rtrpools_alloc(int im_a_router)
 {
 	lnet_rtrbufpool_t *rtrp;
-	int	large_pages;
-	int	small_pages = 1;
-	int	nrb_tiny;
-	int	nrb_small;
-	int	nrb_large;
-	int	rc;
-	int	i;
+	int large_pages;
+	int small_pages = 1;
+	int nrb_tiny;
+	int nrb_small;
+	int nrb_large;
+	int rc;
+	int i;
 
 	large_pages = (LNET_MTU + PAGE_CACHE_SIZE - 1) >> PAGE_CACHE_SHIFT;
 
@@ -1507,9 +1507,9 @@ lnet_rtrpools_alloc(int im_a_router)
 int
 lnet_notify(lnet_ni_t *ni, lnet_nid_t nid, int alive, unsigned long when)
 {
-	struct lnet_peer	*lp = NULL;
-	unsigned long		now = cfs_time_current();
-	int			cpt = lnet_cpt_of_nid(nid);
+	struct lnet_peer *lp = NULL;
+	unsigned long now = cfs_time_current();
+	int cpt = lnet_cpt_of_nid(nid);
 
 	LASSERT(!in_interrupt ());
 
@@ -1591,13 +1591,13 @@ void
 lnet_router_checker(void)
 {
 	static time_t last;
-	static int    running;
+	static int running;
 
-	time_t	    now = get_seconds();
-	int	       interval = now - last;
-	int	       rc;
-	__u64	     version;
-	lnet_peer_t      *rtr;
+	time_t now = get_seconds();
+	int interval = now - last;
+	int rc;
+	__u64 version;
+	lnet_peer_t *rtr;
 
 	/* It's no use to call me again within a sec - all intervals and
 	 * timeouts are measured in seconds */
@@ -1625,7 +1625,7 @@ lnet_router_checker(void)
 
 	/* consume all pending events */
 	while (1) {
-		int	  i;
+		int i;
 		lnet_event_t ev;
 
 		/* NB ln_rc_eqh must be the 1st in 'eventqs' otherwise the
diff --git a/drivers/staging/lustre/lnet/lnet/router_proc.c b/drivers/staging/lustre/lnet/lnet/router_proc.c
index c055afc..ee902dc 100644
--- a/drivers/staging/lustre/lnet/lnet/router_proc.c
+++ b/drivers/staging/lustre/lnet/lnet/router_proc.c
@@ -112,11 +112,11 @@ static int proc_call_handler(void *data, int write, loff_t *ppos,
 static int __proc_lnet_stats(void *data, int write,
 			     loff_t pos, void __user *buffer, int nob)
 {
-	int	      rc;
+	int rc;
 	lnet_counters_t *ctrs;
-	int	      len;
-	char	    *tmpstr;
-	const int	tmpsiz = 256; /* 7 %u and 4 %llu */
+	int len;
+	char *tmpstr;
+	const int tmpsiz = 256; /* 7 %u and 4 %llu */
 
 	if (write) {
 		lnet_counters_reset();
@@ -167,13 +167,13 @@ static int proc_lnet_stats(struct ctl_table *table, int write,
 static int proc_lnet_routes(struct ctl_table *table, int write,
 			    void __user *buffer, size_t *lenp, loff_t *ppos)
 {
-	const int	tmpsiz = 256;
-	char		*tmpstr;
-	char		*s;
-	int		rc = 0;
-	int		len;
-	int		ver;
-	int		off;
+	const int tmpsiz = 256;
+	char *tmpstr;
+	char *s;
+	int rc = 0;
+	int len;
+	int ver;
+	int off;
 
 	CLASSERT(sizeof(loff_t) >= 4);
 
@@ -205,13 +205,13 @@ static int proc_lnet_routes(struct ctl_table *table, int write,
 		lnet_net_unlock(0);
 		*ppos = LNET_PROC_POS_MAKE(0, ver, 0, off);
 	} else {
-		struct list_head		*n;
-		struct list_head		*r;
-		lnet_route_t		*route = NULL;
-		lnet_remotenet_t	*rnet  = NULL;
-		int			skip  = off - 1;
-		struct list_head		*rn_list;
-		int			i;
+		struct list_head *n;
+		struct list_head *r;
+		lnet_route_t *route = NULL;
+		lnet_remotenet_t *rnet  = NULL;
+		int skip  = off - 1;
+		struct list_head *rn_list;
+		int i;
 
 		lnet_net_lock(0);
 
@@ -251,11 +251,11 @@ static int proc_lnet_routes(struct ctl_table *table, int write,
 		}
 
 		if (route != NULL) {
-			__u32        net	= rnet->lrn_net;
-			unsigned int hops	= route->lr_hops;
-			unsigned int priority	= route->lr_priority;
-			lnet_nid_t   nid	= route->lr_gateway->lp_nid;
-			int          alive	= route->lr_gateway->lp_alive;
+			__u32 net = rnet->lrn_net;
+			unsigned int hops = route->lr_hops;
+			unsigned int priority = route->lr_priority;
+			lnet_nid_t nid = route->lr_gateway->lp_nid;
+			int alive = route->lr_gateway->lp_alive;
 
 			s += snprintf(s, tmpstr + tmpsiz - s,
 				      "%-8s %4u %8u %7s %s\n",
@@ -293,13 +293,13 @@ static int proc_lnet_routes(struct ctl_table *table, int write,
 static int proc_lnet_routers(struct ctl_table *table, int write,
 			     void __user *buffer, size_t *lenp, loff_t *ppos)
 {
-	int	rc = 0;
-	char      *tmpstr;
-	char      *s;
-	const int  tmpsiz = 256;
-	int	len;
-	int	ver;
-	int	off;
+	int rc = 0;
+	char *tmpstr;
+	char *s;
+	const int tmpsiz = 256;
+	int len;
+	int ver;
+	int off;
 
 	off = LNET_PROC_HOFF_GET(*ppos);
 	ver = LNET_PROC_VER_GET(*ppos);
@@ -328,9 +328,9 @@ static int proc_lnet_routers(struct ctl_table *table, int write,
 		lnet_net_unlock(0);
 		*ppos = LNET_PROC_POS_MAKE(0, ver, 0, off);
 	} else {
-		struct list_head		*r;
-		struct lnet_peer	*peer = NULL;
-		int			skip = off - 1;
+		struct list_head *r;
+		struct lnet_peer *peer = NULL;
+		int skip = off - 1;
 
 		lnet_net_lock(0);
 
@@ -360,14 +360,14 @@ static int proc_lnet_routers(struct ctl_table *table, int write,
 			lnet_nid_t nid = peer->lp_nid;
 			unsigned long now = cfs_time_current();
 			unsigned long deadline = peer->lp_ping_deadline;
-			int nrefs     = peer->lp_refcount;
-			int nrtrrefs  = peer->lp_rtr_refcount;
+			int nrefs = peer->lp_refcount;
+			int nrtrrefs = peer->lp_rtr_refcount;
 			int alive_cnt = peer->lp_alive_count;
-			int alive     = peer->lp_alive;
-			int pingsent  = !peer->lp_ping_notsent;
+			int alive = peer->lp_alive;
+			int pingsent = !peer->lp_ping_notsent;
 			int last_ping = cfs_duration_sec(cfs_time_sub(now,
 						     peer->lp_ping_timestamp));
-			int down_ni   = 0;
+			int down_ni = 0;
 			lnet_route_t *rtr;
 
 			if ((peer->lp_ping_feats &
@@ -428,16 +428,16 @@ static int proc_lnet_routers(struct ctl_table *table, int write,
 static int proc_lnet_peers(struct ctl_table *table, int write,
 			   void __user *buffer, size_t *lenp, loff_t *ppos)
 {
-	const int		tmpsiz  = 256;
-	struct lnet_peer_table	*ptable;
-	char			*tmpstr;
-	char			*s;
-	int			cpt  = LNET_PROC_CPT_GET(*ppos);
-	int			ver  = LNET_PROC_VER_GET(*ppos);
-	int			hash = LNET_PROC_HASH_GET(*ppos);
-	int			hoff = LNET_PROC_HOFF_GET(*ppos);
-	int			rc = 0;
-	int			len;
+	const int tmpsiz  = 256;
+	struct lnet_peer_table *ptable;
+	char *tmpstr;
+	char *s;
+	int cpt  = LNET_PROC_CPT_GET(*ppos);
+	int ver  = LNET_PROC_VER_GET(*ppos);
+	int hash = LNET_PROC_HASH_GET(*ppos);
+	int hoff = LNET_PROC_HOFF_GET(*ppos);
+	int rc = 0;
+	int len;
 
 	CLASSERT(LNET_PROC_HASH_BITS >= LNET_PEER_HASH_BITS);
 	LASSERT(!write);
@@ -465,9 +465,9 @@ static int proc_lnet_peers(struct ctl_table *table, int write,
 
 		hoff++;
 	} else {
-		struct lnet_peer	*peer;
-		struct list_head		*p;
-		int			skip;
+		struct lnet_peer *peer;
+		struct list_head *p;
+		int skip;
  again:
 		p = NULL;
 		peer = NULL;
@@ -521,23 +521,23 @@ static int proc_lnet_peers(struct ctl_table *table, int write,
 		}
 
 		if (peer != NULL) {
-			lnet_nid_t nid       = peer->lp_nid;
-			int	nrefs     = peer->lp_refcount;
-			int	lastalive = -1;
-			char      *aliveness = "NA";
-			int	maxcr     = peer->lp_ni->ni_peertxcredits;
-			int	txcr      = peer->lp_txcredits;
-			int	mintxcr   = peer->lp_mintxcredits;
-			int	rtrcr     = peer->lp_rtrcredits;
-			int	minrtrcr  = peer->lp_minrtrcredits;
-			int	txqnob    = peer->lp_txqnob;
+			lnet_nid_t nid = peer->lp_nid;
+			int nrefs = peer->lp_refcount;
+			int lastalive = -1;
+			char *aliveness = "NA";
+			int maxcr = peer->lp_ni->ni_peertxcredits;
+			int txcr = peer->lp_txcredits;
+			int mintxcr = peer->lp_mintxcredits;
+			int rtrcr = peer->lp_rtrcredits;
+			int minrtrcr = peer->lp_minrtrcredits;
+			int txqnob = peer->lp_txqnob;
 
 			if (lnet_isrouter(peer) ||
 			    lnet_peer_aliveness_enabled(peer))
 				aliveness = peer->lp_alive ? "up" : "down";
 
 			if (lnet_peer_aliveness_enabled(peer)) {
-				unsigned long     now = cfs_time_current();
+				unsigned long now = cfs_time_current();
 				long delta;
 
 				delta = cfs_time_sub(now, peer->lp_last_alive);
@@ -595,13 +595,13 @@ static int proc_lnet_peers(struct ctl_table *table, int write,
 static int __proc_lnet_buffers(void *data, int write,
 			       loff_t pos, void __user *buffer, int nob)
 {
-	char	    *s;
-	char	    *tmpstr;
-	int		tmpsiz;
-	int		idx;
-	int		len;
-	int		rc;
-	int		i;
+	char *s;
+	char *tmpstr;
+	int tmpsiz;
+	int idx;
+	int len;
+	int rc;
+	int i;
 
 	LASSERT(!write);
 
@@ -660,11 +660,11 @@ static int proc_lnet_buffers(struct ctl_table *table, int write,
 static int proc_lnet_nis(struct ctl_table *table, int write,
 			 void __user *buffer, size_t *lenp, loff_t *ppos)
 {
-	int	tmpsiz = 128 * LNET_CPT_NUMBER;
-	int	rc = 0;
-	char      *tmpstr;
-	char      *s;
-	int	len;
+	int tmpsiz = 128 * LNET_CPT_NUMBER;
+	int rc = 0;
+	char *tmpstr;
+	char *s;
+	int len;
 
 	LASSERT(!write);
 
@@ -684,9 +684,9 @@ static int proc_lnet_nis(struct ctl_table *table, int write,
 			      "rtr", "max", "tx", "min");
 		LASSERT(tmpstr + tmpsiz - s > 0);
 	} else {
-		struct list_head	*n;
-		lnet_ni_t	 *ni   = NULL;
-		int		skip = *ppos - 1;
+		struct list_head *n;
+		lnet_ni_t *ni   = NULL;
+		int skip = *ppos - 1;
 
 		lnet_net_lock(0);
 
@@ -705,12 +705,12 @@ static int proc_lnet_nis(struct ctl_table *table, int write,
 		}
 
 		if (ni != NULL) {
-			struct lnet_tx_queue	*tq;
-			char	*stat;
-			long	now = get_seconds();
-			int	last_alive = -1;
-			int	i;
-			int	j;
+			struct lnet_tx_queue *tq;
+			char *stat;
+			long now = get_seconds();
+			int last_alive = -1;
+			int i;
+			int j;
 
 			if (the_lnet.ln_routing)
 				last_alive = now - ni->ni_last_alive;
@@ -777,9 +777,9 @@ static int proc_lnet_nis(struct ctl_table *table, int write,
 }
 
 struct lnet_portal_rotors {
-	int	     pr_value;
-	const char      *pr_name;
-	const char	*pr_desc;
+	int pr_value;
+	const char *pr_name;
+	const char *pr_desc;
 };
 
 static struct lnet_portal_rotors	portal_rotors[] = {
@@ -815,11 +815,11 @@ extern int portal_rotor;
 static int __proc_lnet_portal_rotor(void *data, int write,
 				    loff_t pos, void __user *buffer, int nob)
 {
-	const int	buf_len	= 128;
-	char		*buf;
-	char		*tmp;
-	int		rc;
-	int		i;
+	const int buf_len = 128;
+	char *buf;
+	char *tmp;
+	int rc;
+	int i;
 
 	LIBCFS_ALLOC(buf, buf_len);
 	if (buf = NULL)
@@ -887,38 +887,38 @@ static struct ctl_table lnet_table[] = {
 	 * to go via /proc for portability.
 	 */
 	{
-		.procname = "stats",
-		.mode     = 0644,
+		.procname     = "stats",
+		.mode         = 0644,
 		.proc_handler = &proc_lnet_stats,
 	},
 	{
-		.procname = "routes",
-		.mode     = 0444,
+		.procname     = "routes",
+		.mode         = 0444,
 		.proc_handler = &proc_lnet_routes,
 	},
 	{
-		.procname = "routers",
-		.mode     = 0444,
+		.procname     = "routers",
+		.mode         = 0444,
 		.proc_handler = &proc_lnet_routers,
 	},
 	{
-		.procname = "peers",
-		.mode     = 0444,
+		.procname     = "peers",
+		.mode         = 0444,
 		.proc_handler = &proc_lnet_peers,
 	},
 	{
-		.procname = "buffers",
-		.mode     = 0444,
+		.procname     = "buffers",
+		.mode         = 0444,
 		.proc_handler = &proc_lnet_buffers,
 	},
 	{
-		.procname = "nis",
-		.mode     = 0444,
+		.procname     = "nis",
+		.mode         = 0444,
 		.proc_handler = &proc_lnet_nis,
 	},
 	{
-		.procname = "portal_rotor",
-		.mode     = 0644,
+		.procname     = "portal_rotor",
+		.mode         = 0644,
 		.proc_handler = &proc_lnet_portal_rotor,
 	},
 	{
-- 
1.7.1

