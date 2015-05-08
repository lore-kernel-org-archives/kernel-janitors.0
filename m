From: Mike Shuey <shuey@purdue.edu>
Date: Fri, 08 May 2015 12:00:53 +0000
Subject: [PATCH v2 1/8] staging: lustre: code cleanup - variable declaration spacing Clean up spacing in some
Message-Id: <1431086460-22455-9-git-send-email-shuey@purdue.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oleg.drokin@intel.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, Mike Shuey <shuey@purdue.edu>

Signed-off-by: Mike Shuey <shuey@purdue.edu>
---
 drivers/staging/lustre/lnet/lnet/acceptor.c |   32 ++--
 drivers/staging/lustre/lnet/lnet/api-ni.c   |  198 +++++++++++-----------
 drivers/staging/lustre/lnet/lnet/config.c   |  238 +++++++++++++-------------
 drivers/staging/lustre/lnet/lnet/lib-eq.c   |   42 +++---
 4 files changed, 255 insertions(+), 255 deletions(-)

diff --git a/drivers/staging/lustre/lnet/lnet/acceptor.c b/drivers/staging/lustre/lnet/lnet/acceptor.c
index 72fd1bf..69d4b19 100644
--- a/drivers/staging/lustre/lnet/lnet/acceptor.c
+++ b/drivers/staging/lustre/lnet/lnet/acceptor.c
@@ -143,10 +143,10 @@ lnet_connect(struct socket **sockp, lnet_nid_t peer_nid,
 	    __u32 local_ip, __u32 peer_ip, int peer_port)
 {
 	lnet_acceptor_connreq_t cr;
-	struct socket	   *sock;
-	int		     rc;
-	int		     port;
-	int		     fatal;
+	struct socket *sock;
+	int rc;
+	int port;
+	int fatal;
 
 	CLASSERT(sizeof(cr) <= 16);	    /* not too big to be on the stack */
 
@@ -211,12 +211,12 @@ static int
 lnet_accept(struct socket *sock, __u32 magic)
 {
 	lnet_acceptor_connreq_t cr;
-	__u32		   peer_ip;
-	int		     peer_port;
-	int		     rc;
-	int		     flip;
-	lnet_ni_t	      *ni;
-	char		   *str;
+	__u32 peer_ip;
+	int peer_port;
+	int rc;
+	int flip;
+	lnet_ni_t *ni;
+	char *str;
 
 	LASSERT(sizeof(cr) <= 16);	     /* not too big for the stack */
 
@@ -333,11 +333,11 @@ static int
 lnet_acceptor(void *arg)
 {
 	struct socket *newsock;
-	int	    rc;
-	__u32	  magic;
-	__u32	  peer_ip;
-	int	    peer_port;
-	int	    secure = (int)((long_ptr_t)arg);
+	int rc;
+	__u32 magic;
+	__u32 peer_ip;
+	int peer_port;
+	int secure = (int)((long_ptr_t)arg);
 
 	LASSERT(lnet_acceptor_state.pta_sock = NULL);
 
@@ -444,7 +444,7 @@ accept2secure(const char *acc, long *sec)
 int
 lnet_acceptor_start(void)
 {
-	int  rc;
+	int rc;
 	long rc2;
 	long secure;
 
diff --git a/drivers/staging/lustre/lnet/lnet/api-ni.c b/drivers/staging/lustre/lnet/lnet/api-ni.c
index 4a14e51..6910f56 100644
--- a/drivers/staging/lustre/lnet/lnet/api-ni.c
+++ b/drivers/staging/lustre/lnet/lnet/api-ni.c
@@ -41,7 +41,7 @@
 
 #define D_LNI D_CONSOLE
 
-lnet_t      the_lnet;			   /* THE state of the network */
+lnet_t the_lnet;			   /* THE state of the network */
 EXPORT_SYMBOL(the_lnet);
 
 
@@ -70,8 +70,8 @@ lnet_get_routes(void)
 static char *
 lnet_get_networks(void)
 {
-	char   *nets;
-	int     rc;
+	char *nets;
+	int rc;
 
 	if (*networks != 0 && *ip2nets != 0) {
 		LCONSOLE_ERROR_MSG(0x101, "Please specify EITHER 'networks' or 'ip2nets' but not both at once\n");
@@ -107,8 +107,8 @@ lnet_fini_locks(void)
 static int
 lnet_create_remote_nets_table(void)
 {
-	int		i;
-	struct list_head	*hash;
+	int i;
+	struct list_head *hash;
 
 	LASSERT(the_lnet.ln_remote_nets_hash = NULL);
 	LASSERT(the_lnet.ln_remote_nets_hbits > 0);
@@ -273,8 +273,8 @@ static void lnet_assert_wire_constants(void)
 static lnd_t *
 lnet_find_lnd_by_type(int type)
 {
-	lnd_t	      *lnd;
-	struct list_head	 *tmp;
+	lnd_t *lnd;
+	struct list_head *tmp;
 
 	/* holding lnd mutex */
 	list_for_each(tmp, &the_lnet.ln_lnds) {
@@ -325,7 +325,7 @@ void
 lnet_counters_get(lnet_counters_t *counters)
 {
 	lnet_counters_t *ctr;
-	int		i;
+	int i;
 
 	memset(counters, 0, sizeof(*counters));
 
@@ -353,7 +353,7 @@ void
 lnet_counters_reset(void)
 {
 	lnet_counters_t *counters;
-	int		i;
+	int i;
 
 	lnet_net_lock(LNET_LOCK_EX);
 
@@ -396,8 +396,8 @@ lnet_freelist_init(lnet_freelist_t *fl, int n, int size)
 void
 lnet_freelist_fini(lnet_freelist_t *fl)
 {
-	struct list_head       *el;
-	int	       count;
+	struct list_head *el;
+	int count;
 
 	if (fl->fl_nobjs = 0)
 		return;
@@ -441,7 +441,7 @@ lnet_res_type2str(int type)
 static void
 lnet_res_container_cleanup(struct lnet_res_container *rec)
 {
-	int	count = 0;
+	int count = 0;
 
 	if (rec->rec_type = 0) /* not set yet, it's uninitialized */
 		return;
@@ -486,8 +486,8 @@ static int
 lnet_res_container_setup(struct lnet_res_container *rec,
 			 int cpt, int type, int objnum, int objsz)
 {
-	int	rc = 0;
-	int	i;
+	int rc = 0;
+	int i;
 
 	LASSERT(rec->rec_type = 0);
 
@@ -525,8 +525,8 @@ out:
 static void
 lnet_res_containers_destroy(struct lnet_res_container **recs)
 {
-	struct lnet_res_container	*rec;
-	int				i;
+	struct lnet_res_container *rec;
+	int i;
 
 	cfs_percpt_for_each(rec, i, recs)
 		lnet_res_container_cleanup(rec);
@@ -537,10 +537,10 @@ lnet_res_containers_destroy(struct lnet_res_container **recs)
 static struct lnet_res_container **
 lnet_res_containers_create(int type, int objnum, int objsz)
 {
-	struct lnet_res_container	**recs;
-	struct lnet_res_container	*rec;
-	int				rc;
-	int				i;
+	struct lnet_res_container **recs;
+	struct lnet_res_container *rec;
+	int rc;
+	int i;
 
 	recs = cfs_percpt_alloc(lnet_cpt_table(), sizeof(*rec));
 	if (recs = NULL) {
@@ -564,9 +564,9 @@ lnet_libhandle_t *
 lnet_res_lh_lookup(struct lnet_res_container *rec, __u64 cookie)
 {
 	/* ALWAYS called with lnet_res_lock held */
-	struct list_head		*head;
-	lnet_libhandle_t	*lh;
-	unsigned int		hash;
+	struct list_head *head;
+	lnet_libhandle_t *lh;
+	unsigned int hash;
 
 	if ((cookie & LNET_COOKIE_MASK) != rec->rec_type)
 		return NULL;
@@ -586,8 +586,8 @@ void
 lnet_res_lh_initialize(struct lnet_res_container *rec, lnet_libhandle_t *lh)
 {
 	/* ALWAYS called with lnet_res_lock held */
-	unsigned int	ibits = LNET_COOKIE_TYPE_BITS + LNET_CPT_BITS;
-	unsigned int	hash;
+	unsigned int ibits = LNET_COOKIE_TYPE_BITS + LNET_CPT_BITS;
+	unsigned int hash;
 
 	lh->lh_cookie = rec->rec_lh_cookie;
 	rec->rec_lh_cookie += 1 << ibits;
@@ -605,7 +605,7 @@ lnet_prepare(lnet_pid_t requested_pid)
 {
 	/* Prepare to bring up the network */
 	struct lnet_res_container **recs;
-	int			  rc = 0;
+	int rc = 0;
 
 	LASSERT(the_lnet.ln_refcount = 0);
 
@@ -725,8 +725,8 @@ lnet_unprepare(void)
 lnet_ni_t  *
 lnet_net2ni_locked(__u32 net, int cpt)
 {
-	struct list_head	*tmp;
-	lnet_ni_t	*ni;
+	struct list_head *tmp;
+	lnet_ni_t *ni;
 
 	LASSERT(cpt != LNET_LOCK_EX);
 
@@ -758,8 +758,8 @@ EXPORT_SYMBOL(lnet_net2ni);
 static unsigned int
 lnet_nid_cpt_hash(lnet_nid_t nid, unsigned int number)
 {
-	__u64		key = nid;
-	unsigned int	val;
+	__u64 key = nid;
+	unsigned int val;
 
 	LASSERT(number >= 1 && number <= LNET_CPT_NUMBER);
 
@@ -801,8 +801,8 @@ lnet_cpt_of_nid_locked(lnet_nid_t nid)
 int
 lnet_cpt_of_nid(lnet_nid_t nid)
 {
-	int	cpt;
-	int	cpt2;
+	int cpt;
+	int cpt2;
 
 	if (LNET_CPT_NUMBER = 1)
 		return 0; /* the only one */
@@ -821,8 +821,8 @@ EXPORT_SYMBOL(lnet_cpt_of_nid);
 int
 lnet_islocalnet(__u32 net)
 {
-	struct lnet_ni	*ni;
-	int		cpt;
+	struct lnet_ni *ni;
+	int cpt;
 
 	cpt = lnet_net_lock_current();
 
@@ -838,8 +838,8 @@ lnet_islocalnet(__u32 net)
 lnet_ni_t  *
 lnet_nid2ni_locked(lnet_nid_t nid, int cpt)
 {
-	struct lnet_ni	*ni;
-	struct list_head	*tmp;
+	struct lnet_ni *ni;
+	struct list_head *tmp;
 
 	LASSERT(cpt != LNET_LOCK_EX);
 
@@ -858,8 +858,8 @@ lnet_nid2ni_locked(lnet_nid_t nid, int cpt)
 int
 lnet_islocalnid(lnet_nid_t nid)
 {
-	struct lnet_ni	*ni;
-	int		cpt;
+	struct lnet_ni *ni;
+	int cpt;
 
 	cpt = lnet_net_lock_current();
 	ni = lnet_nid2ni_locked(nid, cpt);
@@ -874,10 +874,10 @@ int
 lnet_count_acceptor_nis(void)
 {
 	/* Return the # of NIs that need the acceptor. */
-	int		count = 0;
-	struct list_head	*tmp;
-	struct lnet_ni	*ni;
-	int		cpt;
+	int count = 0;
+	struct list_head *tmp;
+	struct lnet_ni *ni;
+	int cpt;
 
 	cpt = lnet_net_lock_current();
 	list_for_each(tmp, &the_lnet.ln_nis) {
@@ -895,7 +895,7 @@ lnet_count_acceptor_nis(void)
 static int
 lnet_ni_tq_credits(lnet_ni_t *ni)
 {
-	int	credits;
+	int credits;
 
 	LASSERT(ni->ni_ncpts >= 1);
 
@@ -912,9 +912,9 @@ lnet_ni_tq_credits(lnet_ni_t *ni)
 static void
 lnet_shutdown_lndnis(void)
 {
-	int		i;
-	int		islo;
-	lnet_ni_t	 *ni;
+	int i;
+	int islo;
+	lnet_ni_t *ni;
 
 	/* NB called holding the global mutex */
 
@@ -968,8 +968,8 @@ lnet_shutdown_lndnis(void)
 	 * and shut them down in guaranteed thread context */
 	i = 2;
 	while (!list_empty(&the_lnet.ln_nis_zombie)) {
-		int	*ref;
-		int	j;
+		int *ref;
+		int j;
 
 		ni = list_entry(the_lnet.ln_nis_zombie.next,
 				    lnet_ni_t, ni_list);
@@ -1029,15 +1029,15 @@ lnet_shutdown_lndnis(void)
 static int
 lnet_startup_lndnis(void)
 {
-	lnd_t			*lnd;
-	struct lnet_ni		*ni;
-	struct lnet_tx_queue	*tq;
-	struct list_head		nilist;
-	int			i;
-	int		rc = 0;
-	int		lnd_type;
-	int		nicount = 0;
-	char	      *nets = lnet_get_networks();
+	lnd_t *lnd;
+	struct lnet_ni *ni;
+	struct lnet_tx_queue *tq;
+	struct list_head nilist;
+	int i;
+	int rc = 0;
+	int lnd_type;
+	int nicount = 0;
+	char *nets = lnet_get_networks();
 
 	INIT_LIST_HEAD(&nilist);
 
@@ -1181,7 +1181,7 @@ lnet_startup_lndnis(void)
 int
 LNetInit(void)
 {
-	int	rc;
+	int rc;
 
 	lnet_assert_wire_constants();
 	LASSERT(!the_lnet.ln_init);
@@ -1277,8 +1277,8 @@ EXPORT_SYMBOL(LNetFini);
 int
 LNetNIInit(lnet_pid_t requested_pid)
 {
-	int	 im_a_router = 0;
-	int	 rc;
+	int im_a_router = 0;
+	int rc;
 
 	LNET_MUTEX_LOCK(&the_lnet.ln_api_mutex);
 
@@ -1413,9 +1413,9 @@ int
 LNetCtl(unsigned int cmd, void *arg)
 {
 	struct libcfs_ioctl_data *data = arg;
-	lnet_process_id_t	 id = {0};
-	lnet_ni_t		*ni;
-	int		       rc;
+	lnet_process_id_t id = {0};
+	lnet_ni_t *ni;
+	int rc;
 
 	LASSERT(the_lnet.ln_init);
 	LASSERT(the_lnet.ln_refcount > 0);
@@ -1531,10 +1531,10 @@ EXPORT_SYMBOL(LNetCtl);
 int
 LNetGetId(unsigned int index, lnet_process_id_t *id)
 {
-	struct lnet_ni	*ni;
-	struct list_head	*tmp;
-	int		cpt;
-	int		rc = -ENOENT;
+	struct lnet_ni *ni;
+	struct list_head *tmp;
+	int cpt;
+	int rc = -ENOENT;
 
 	LASSERT(the_lnet.ln_init);
 
@@ -1575,11 +1575,11 @@ EXPORT_SYMBOL(LNetSnprintHandle);
 static int
 lnet_create_ping_info(void)
 {
-	int	       i;
-	int	       n;
-	int	       rc;
-	unsigned int      infosz;
-	lnet_ni_t	*ni;
+	int i;
+	int n;
+	int rc;
+	unsigned int infosz;
+	lnet_ni_t *ni;
 	lnet_process_id_t id;
 	lnet_ping_info_t *pinfo;
 
@@ -1633,7 +1633,7 @@ lnet_create_ping_info(void)
 static void
 lnet_destroy_ping_info(void)
 {
-	struct lnet_ni	*ni;
+	struct lnet_ni *ni;
 
 	lnet_net_lock(0);
 
@@ -1654,12 +1654,12 @@ lnet_destroy_ping_info(void)
 int
 lnet_ping_target_init(void)
 {
-	lnet_md_t	 md = { NULL };
-	lnet_handle_me_t  meh;
+	lnet_md_t md = { NULL };
+	lnet_handle_me_t meh;
 	lnet_process_id_t id;
-	int	       rc;
-	int	       rc2;
-	int	       infosz;
+	int rc;
+	int rc2;
+	int infosz;
 
 	rc = lnet_create_ping_info();
 	if (rc != 0)
@@ -1722,11 +1722,11 @@ lnet_ping_target_init(void)
 void
 lnet_ping_target_fini(void)
 {
-	lnet_event_t    event;
-	int	     rc;
-	int	     which;
-	int	     timeout_ms = 1000;
-	sigset_t    blocked = cfs_block_allsigs();
+	lnet_event_t event;
+	int rc;
+	int which;
+	int timeout_ms = 1000;
+	sigset_t blocked = cfs_block_allsigs();
 
 	LNetMDUnlink(the_lnet.ln_ping_target_md);
 	/* NB md could be busy; this just starts the unlink */
@@ -1759,22 +1759,22 @@ lnet_ping_target_fini(void)
 int
 lnet_ping(lnet_process_id_t id, int timeout_ms, lnet_process_id_t *ids, int n_ids)
 {
-	lnet_handle_eq_t     eqh;
-	lnet_handle_md_t     mdh;
-	lnet_event_t	 event;
-	lnet_md_t	    md = { NULL };
-	int		  which;
-	int		  unlinked = 0;
-	int		  replied = 0;
-	const int	    a_long_time = 60000; /* mS */
-	int		  infosz = offsetof(lnet_ping_info_t, pi_ni[n_ids]);
-	lnet_ping_info_t    *info;
-	lnet_process_id_t    tmpid;
-	int		  i;
-	int		  nob;
-	int		  rc;
-	int		  rc2;
-	sigset_t	 blocked;
+	lnet_handle_eq_t eqh;
+	lnet_handle_md_t mdh;
+	lnet_event_t event;
+	lnet_md_t md = { NULL };
+	int which;
+	int unlinked = 0;
+	int replied = 0;
+	const int a_long_time = 60000; /* mS */
+	int infosz = offsetof(lnet_ping_info_t, pi_ni[n_ids]);
+	lnet_ping_info_t *info;
+	lnet_process_id_t tmpid;
+	int i;
+	int nob;
+	int rc;
+	int rc2;
+	sigset_t blocked;
 
 	if (n_ids <= 0 ||
 	    id.nid = LNET_NID_ANY ||
diff --git a/drivers/staging/lustre/lnet/lnet/config.c b/drivers/staging/lustre/lnet/lnet/config.c
index 2dc4c4a..70bc809 100644
--- a/drivers/staging/lustre/lnet/lnet/config.c
+++ b/drivers/staging/lustre/lnet/lnet/config.c
@@ -38,9 +38,9 @@
 #include "../../include/linux/lnet/lib-lnet.h"
 
 struct lnet_text_buf_t {	    /* tmp struct for parsing routes */
-	struct list_head	 ltb_list;	/* stash on lists */
-	int		ltb_size;	/* allocated size */
-	char	       ltb_text[0];     /* text buffer */
+	struct list_head ltb_list;	/* stash on lists */
+	int ltb_size;	/* allocated size */
+	char ltb_text[0];     /* text buffer */
 };
 
 static int lnet_tbnob;			/* track text buf allocation */
@@ -80,8 +80,8 @@ lnet_issep(char c)
 static int
 lnet_net_unique(__u32 net, struct list_head *nilist)
 {
-	struct list_head       *tmp;
-	lnet_ni_t	*ni;
+	struct list_head *tmp;
+	lnet_ni_t *ni;
 
 	list_for_each(tmp, nilist) {
 		ni = list_entry(tmp, lnet_ni_t, ni_list);
@@ -111,10 +111,10 @@ lnet_ni_free(struct lnet_ni *ni)
 static lnet_ni_t *
 lnet_ni_alloc(__u32 net, struct cfs_expr_list *el, struct list_head *nilist)
 {
-	struct lnet_tx_queue	*tq;
-	struct lnet_ni		*ni;
-	int			rc;
-	int			i;
+	struct lnet_tx_queue *tq;
+	struct lnet_ni *ni;
+	int rc;
+	int i;
 
 	if (!lnet_net_unique(net, nilist)) {
 		LCONSOLE_ERROR_MSG(0x111, "Duplicate network specified: %s\n",
@@ -178,13 +178,13 @@ int
 lnet_parse_networks(struct list_head *nilist, char *networks)
 {
 	struct cfs_expr_list *el = NULL;
-	int		tokensize = strlen(networks) + 1;
-	char		*tokens;
-	char		*str;
-	char		*tmp;
-	struct lnet_ni	*ni;
-	__u32		net;
-	int		nnets = 0;
+	int tokensize = strlen(networks) + 1;
+	char *tokens;
+	char *str;
+	char *tmp;
+	struct lnet_ni *ni;
+	__u32 net;
+	int nnets = 0;
 
 	if (strlen(networks) > LNET_SINGLE_TEXTBUF_NOB) {
 		/* _WAY_ conservative */
@@ -210,12 +210,12 @@ lnet_parse_networks(struct list_head *nilist, char *networks)
 		goto failed;
 
 	while (str != NULL && *str != 0) {
-		char	*comma = strchr(str, ',');
-		char	*bracket = strchr(str, '(');
-		char	*square = strchr(str, '[');
-		char	*iface;
-		int	niface;
-		int	rc;
+		char *comma = strchr(str, ',');
+		char *bracket = strchr(str, '(');
+		char *square = strchr(str, '[');
+		char *iface;
+		int niface;
+		int rc;
 
 		/* NB we don't check interface conflicts here; it's the LNDs
 		 * responsibility (if it cares at all) */
@@ -369,7 +369,7 @@ static struct lnet_text_buf_t *
 lnet_new_text_buf(int str_len)
 {
 	struct lnet_text_buf_t *ltb;
-	int	      nob;
+	int nob;
 
 	/* NB allocate space for the terminating 0 */
 	nob = offsetof(struct lnet_text_buf_t, ltb_text[str_len + 1]);
@@ -404,7 +404,7 @@ lnet_free_text_buf(struct lnet_text_buf_t *ltb)
 static void
 lnet_free_text_bufs(struct list_head *tbs)
 {
-	struct lnet_text_buf_t  *ltb;
+	struct lnet_text_buf_t *ltb;
 
 	while (!list_empty(tbs)) {
 		ltb = list_entry(tbs->next, struct lnet_text_buf_t, ltb_list);
@@ -417,11 +417,11 @@ lnet_free_text_bufs(struct list_head *tbs)
 static int
 lnet_str2tbs_sep(struct list_head *tbs, char *str)
 {
-	struct list_head	pending;
-	char	     *sep;
-	int	       nob;
-	int	       i;
-	struct lnet_text_buf_t  *ltb;
+	struct list_head pending;
+	char *sep;
+	int nob;
+	int i;
+	struct lnet_text_buf_t *ltb;
 
 	INIT_LIST_HEAD(&pending);
 
@@ -477,8 +477,8 @@ lnet_expand1tb(struct list_head *list,
 	       char *str, char *sep1, char *sep2,
 	       char *item, int itemlen)
 {
-	int	      len1 = (int)(sep1 - str);
-	int	      len2 = strlen(sep2 + 1);
+	int len1 = (int)(sep1 - str);
+	int len2 = strlen(sep2 + 1);
 	struct lnet_text_buf_t *ltb;
 
 	LASSERT(*sep1 = '[');
@@ -500,18 +500,18 @@ lnet_expand1tb(struct list_head *list,
 static int
 lnet_str2tbs_expand(struct list_head *tbs, char *str)
 {
-	char	      num[16];
-	struct list_head	pending;
-	char	     *sep;
-	char	     *sep2;
-	char	     *parsed;
-	char	     *enditem;
-	int	       lo;
-	int	       hi;
-	int	       stride;
-	int	       i;
-	int	       nob;
-	int	       scanned;
+	char num[16];
+	struct list_head pending;
+	char *sep;
+	char *sep2;
+	char *parsed;
+	char *enditem;
+	int lo;
+	int hi;
+	int stride;
+	int i;
+	int nob;
+	int scanned;
 
 	INIT_LIST_HEAD(&pending);
 
@@ -584,8 +584,8 @@ lnet_str2tbs_expand(struct list_head *tbs, char *str)
 static int
 lnet_parse_hops(char *str, unsigned int *hops)
 {
-	int     len = strlen(str);
-	int     nob = len;
+	int len = strlen(str);
+	int nob = len;
 
 	return (sscanf(str, "%u%n", hops, &nob) >= 1 &&
 		nob = len &&
@@ -597,9 +597,9 @@ lnet_parse_hops(char *str, unsigned int *hops)
 static int
 lnet_parse_priority(char *str, unsigned int *priority, char **token)
 {
-	int   nob;
+	int nob;
 	char *sep;
-	int   len;
+	int len;
 
 	sep = strchr(str, LNET_PRIORITY_SEPARATOR);
 	if (sep = NULL) {
@@ -628,23 +628,23 @@ static int
 lnet_parse_route(char *str, int *im_a_router)
 {
 	/* static scratch buffer OK (single threaded) */
-	static char       cmd[LNET_SINGLE_TEXTBUF_NOB];
-
-	struct list_head	nets;
-	struct list_head	gateways;
-	struct list_head       *tmp1;
-	struct list_head       *tmp2;
-	__u32	     net;
-	lnet_nid_t	nid;
-	struct lnet_text_buf_t  *ltb;
-	int	       rc;
-	char	     *sep;
-	char	     *token = str;
-	int	       ntokens = 0;
-	int	       myrc = -1;
-	unsigned int      hops;
-	int	       got_hops = 0;
-	unsigned int	  priority = 0;
+	static char cmd[LNET_SINGLE_TEXTBUF_NOB];
+
+	struct list_head nets;
+	struct list_head gateways;
+	struct list_head *tmp1;
+	struct list_head *tmp2;
+	__u32 net;
+	lnet_nid_t nid;
+	struct lnet_text_buf_t *ltb;
+	int rc;
+	char *sep;
+	char *token = str;
+	int ntokens = 0;
+	int myrc = -1;
+	unsigned int hops;
+	int got_hops = 0;
+	unsigned int priority = 0;
 
 	INIT_LIST_HEAD(&gateways);
 	INIT_LIST_HEAD(&nets);
@@ -772,7 +772,7 @@ lnet_parse_route(char *str, int *im_a_router)
 static int
 lnet_parse_route_tbs(struct list_head *tbs, int *im_a_router)
 {
-	struct lnet_text_buf_t   *ltb;
+	struct lnet_text_buf_t *ltb;
 
 	while (!list_empty(tbs)) {
 		ltb = list_entry(tbs->next, struct lnet_text_buf_t, ltb_list);
@@ -792,8 +792,8 @@ lnet_parse_route_tbs(struct list_head *tbs, int *im_a_router)
 int
 lnet_parse_routes(char *routes, int *im_a_router)
 {
-	struct list_head	tbs;
-	int	       rc = 0;
+	struct list_head tbs;
+	int rc = 0;
 
 	*im_a_router = 0;
 
@@ -814,8 +814,8 @@ static int
 lnet_match_network_token(char *token, int len, __u32 *ipaddrs, int nip)
 {
 	LIST_HEAD(list);
-	int		rc;
-	int		i;
+	int rc;
+	int i;
 
 	rc = cfs_ip_addr_parse(token, len, &list);
 	if (rc != 0)
@@ -834,13 +834,13 @@ lnet_match_network_tokens(char *net_entry, __u32 *ipaddrs, int nip)
 {
 	static char tokens[LNET_SINGLE_TEXTBUF_NOB];
 
-	int   matched = 0;
-	int   ntokens = 0;
-	int   len;
+	int matched = 0;
+	int ntokens = 0;
+	int len;
 	char *net = NULL;
 	char *sep;
 	char *token;
-	int   rc;
+	int rc;
 
 	LASSERT(strlen(net_entry) < sizeof(tokens));
 
@@ -889,8 +889,8 @@ lnet_match_network_tokens(char *net_entry, __u32 *ipaddrs, int nip)
 static __u32
 lnet_netspec2net(char *netspec)
 {
-	char   *bracket = strchr(netspec, '(');
-	__u32   net;
+	char *bracket = strchr(netspec, '(');
+	__u32 net;
 
 	if (bracket != NULL)
 		*bracket = 0;
@@ -906,15 +906,15 @@ lnet_netspec2net(char *netspec)
 static int
 lnet_splitnets(char *source, struct list_head *nets)
 {
-	int	       offset = 0;
-	int	       offset2;
-	int	       len;
-	struct lnet_text_buf_t  *tb;
-	struct lnet_text_buf_t  *tb2;
-	struct list_head       *t;
-	char	     *sep;
-	char	     *bracket;
-	__u32	     net;
+	int offset = 0;
+	int offset2;
+	int len;
+	struct lnet_text_buf_t *tb;
+	struct lnet_text_buf_t *tb2;
+	struct list_head *t;
+	char *sep;
+	char *bracket;
+	__u32 net;
 
 	LASSERT(!list_empty(nets));
 	LASSERT(nets->next = nets->prev);     /* single entry */
@@ -986,22 +986,22 @@ lnet_splitnets(char *source, struct list_head *nets)
 static int
 lnet_match_networks(char **networksp, char *ip2nets, __u32 *ipaddrs, int nip)
 {
-	static char	networks[LNET_SINGLE_TEXTBUF_NOB];
-	static char	source[LNET_SINGLE_TEXTBUF_NOB];
-
-	struct list_head	  raw_entries;
-	struct list_head	  matched_nets;
-	struct list_head	  current_nets;
-	struct list_head	 *t;
-	struct list_head	 *t2;
-	struct lnet_text_buf_t    *tb;
-	struct lnet_text_buf_t    *tb2;
-	__u32	       net1;
-	__u32	       net2;
-	int		 len;
-	int		 count;
-	int		 dup;
-	int		 rc;
+	static char networks[LNET_SINGLE_TEXTBUF_NOB];
+	static char source[LNET_SINGLE_TEXTBUF_NOB];
+
+	struct list_head raw_entries;
+	struct list_head matched_nets;
+	struct list_head current_nets;
+	struct list_head *t;
+	struct list_head *t2;
+	struct lnet_text_buf_t *tb;
+	struct lnet_text_buf_t *tb2;
+	__u32 net1;
+	__u32 net2;
+	int len;
+	int count;
+	int dup;
+	int rc;
 
 	INIT_LIST_HEAD(&raw_entries);
 	if (lnet_str2tbs_sep(&raw_entries, ip2nets) < 0) {
@@ -1112,15 +1112,15 @@ lnet_ipaddr_free_enumeration(__u32 *ipaddrs, int nip)
 static int
 lnet_ipaddr_enumerate(__u32 **ipaddrsp)
 {
-	int	up;
-	__u32      netmask;
-	__u32     *ipaddrs;
-	__u32     *ipaddrs2;
-	int	nip;
-	char     **ifnames;
-	int	nif = libcfs_ipif_enumerate(&ifnames);
-	int	i;
-	int	rc;
+	int up;
+	__u32 netmask;
+	__u32 *ipaddrs;
+	__u32 *ipaddrs2;
+	int nip;
+	char **ifnames;
+	int nif = libcfs_ipif_enumerate(&ifnames);
+	int i;
+	int rc;
 
 	if (nif <= 0)
 		return nif;
@@ -1178,9 +1178,9 @@ lnet_ipaddr_enumerate(__u32 **ipaddrsp)
 int
 lnet_parse_ip2nets(char **networksp, char *ip2nets)
 {
-	__u32     *ipaddrs = NULL;
-	int	nip = lnet_ipaddr_enumerate(&ipaddrs);
-	int	rc;
+	__u32 *ipaddrs = NULL;
+	int nip = lnet_ipaddr_enumerate(&ipaddrs);
+	int rc;
 
 	if (nip < 0) {
 		LCONSOLE_ERROR_MSG(0x117,
@@ -1215,14 +1215,14 @@ lnet_parse_ip2nets(char **networksp, char *ip2nets)
 int
 lnet_set_ip_niaddr(lnet_ni_t *ni)
 {
-	__u32  net = LNET_NIDNET(ni->ni_nid);
+	__u32 net = LNET_NIDNET(ni->ni_nid);
 	char **names;
-	int    n;
-	__u32  ip;
-	__u32  netmask;
-	int    up;
-	int    i;
-	int    rc;
+	int n;
+	__u32 ip;
+	__u32 netmask;
+	int up;
+	int i;
+	int rc;
 
 	/* Convenience for LNDs that use the IP address of a local interface as
 	 * the local address part of their NID */
diff --git a/drivers/staging/lustre/lnet/lnet/lib-eq.c b/drivers/staging/lustre/lnet/lnet/lib-eq.c
index 5470148..368bde9 100644
--- a/drivers/staging/lustre/lnet/lnet/lib-eq.c
+++ b/drivers/staging/lustre/lnet/lnet/lib-eq.c
@@ -70,7 +70,7 @@ int
 LNetEQAlloc(unsigned int count, lnet_eq_handler_t callback,
 	    lnet_handle_eq_t *handle)
 {
-	lnet_eq_t     *eq;
+	lnet_eq_t *eq;
 
 	LASSERT(the_lnet.ln_init);
 	LASSERT(the_lnet.ln_refcount > 0);
@@ -151,13 +151,13 @@ EXPORT_SYMBOL(LNetEQAlloc);
 int
 LNetEQFree(lnet_handle_eq_t eqh)
 {
-	struct lnet_eq	*eq;
-	lnet_event_t	*events = NULL;
-	int		**refs = NULL;
-	int		*ref;
-	int		rc = 0;
-	int		size = 0;
-	int		i;
+	struct lnet_eq *eq;
+	lnet_event_t *events = NULL;
+	int **refs = NULL;
+	int *ref;
+	int rc = 0;
+	int size = 0;
+	int i;
 
 	LASSERT(the_lnet.ln_init);
 	LASSERT(the_lnet.ln_refcount > 0);
@@ -185,9 +185,9 @@ LNetEQFree(lnet_handle_eq_t eqh)
 	}
 
 	/* stash for free after lock dropped */
-	events	= eq->eq_events;
-	size	= eq->eq_size;
-	refs	= eq->eq_refs;
+	events = eq->eq_events;
+	size = eq->eq_size;
+	refs = eq->eq_refs;
 
 	lnet_res_lh_invalidate(&eq->eq_lh);
 	list_del(&eq->eq_list);
@@ -237,9 +237,9 @@ lnet_eq_enqueue_event(lnet_eq_t *eq, lnet_event_t *ev)
 static int
 lnet_eq_dequeue_event(lnet_eq_t *eq, lnet_event_t *ev)
 {
-	int		new_index = eq->eq_deq_seq & (eq->eq_size - 1);
-	lnet_event_t	*new_event = &eq->eq_events[new_index];
-	int		rc;
+	int new_index = eq->eq_deq_seq & (eq->eq_size - 1);
+	lnet_event_t *new_event = &eq->eq_events[new_index];
+	int rc;
 
 	/* must called with lnet_eq_wait_lock hold */
 	if (LNET_SEQ_GT(eq->eq_deq_seq, new_event->sequence))
@@ -323,10 +323,10 @@ static int
 lnet_eq_wait_locked(int *timeout_ms)
 __must_hold(&the_lnet.ln_eq_wait_lock)
 {
-	int		tms = *timeout_ms;
-	int		wait;
-	wait_queue_t  wl;
-	unsigned long      now;
+	int tms = *timeout_ms;
+	int wait;
+	wait_queue_t wl;
+	unsigned long now;
 
 	if (tms = 0)
 		return -1; /* don't want to wait and no new event */
@@ -392,9 +392,9 @@ int
 LNetEQPoll(lnet_handle_eq_t *eventqs, int neq, int timeout_ms,
 	   lnet_event_t *event, int *which)
 {
-	int	wait = 1;
-	int	rc;
-	int	i;
+	int wait = 1;
+	int rc;
+	int i;
 
 	LASSERT(the_lnet.ln_init);
 	LASSERT(the_lnet.ln_refcount > 0);
-- 
1.7.1

