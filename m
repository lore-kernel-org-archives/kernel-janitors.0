From: Mike Shuey <shuey@purdue.edu>
Date: Thu, 21 May 2015 19:50:49 +0000
Subject: [PATCH 13/13] staging: lustre: lnet: selftest: checkpatch.pl fixes
Message-Id: <1432237849-53947-27-git-send-email-shuey@purdue.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
In-Reply-To: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oleg.drokin@intel.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, lustre-deve@lists.lustre.org, Mike Shuey <shuey@purdue.edu>

Cleaning up more checkpatch.pl issues.

Signed-off-by: Mike Shuey <shuey@purdue.edu>
---
 drivers/staging/lustre/lnet/selftest/brw_test.c  |    3 +-
 drivers/staging/lustre/lnet/selftest/conctl.c    |    4 +-
 drivers/staging/lustre/lnet/selftest/conrpc.c    |   41 ++++++++--------
 drivers/staging/lustre/lnet/selftest/conrpc.h    |    7 ++-
 drivers/staging/lustre/lnet/selftest/console.c   |   33 ++++++------
 drivers/staging/lustre/lnet/selftest/console.h   |   14 +++--
 drivers/staging/lustre/lnet/selftest/framework.c |   46 ++++++++---------
 drivers/staging/lustre/lnet/selftest/module.c    |    3 +-
 drivers/staging/lustre/lnet/selftest/ping_test.c |    1 -
 drivers/staging/lustre/lnet/selftest/rpc.c       |   29 +++++------
 drivers/staging/lustre/lnet/selftest/selftest.h  |   58 ++++++++++------------
 drivers/staging/lustre/lnet/selftest/timer.h     |    2 +-
 12 files changed, 119 insertions(+), 122 deletions(-)

diff --git a/drivers/staging/lustre/lnet/selftest/brw_test.c b/drivers/staging/lustre/lnet/selftest/brw_test.c
index de11f1b..fd3383f 100644
--- a/drivers/staging/lustre/lnet/selftest/brw_test.c
+++ b/drivers/staging/lustre/lnet/selftest/brw_test.c
@@ -463,7 +463,8 @@ brw_server_handle(struct srpc_server_rpc *rpc)
 		npg = reqst->brw_len >> PAGE_CACHE_SHIFT;
 
 	} else {
-		npg = (reqst->brw_len + PAGE_CACHE_SIZE - 1) >> PAGE_CACHE_SHIFT;
+		npg = (reqst->brw_len + PAGE_CACHE_SIZE - 1) >>
+		      PAGE_CACHE_SHIFT;
 	}
 
 	replymsg->msg_ses_feats = reqstmsg->msg_ses_feats;
diff --git a/drivers/staging/lustre/lnet/selftest/conctl.c b/drivers/staging/lustre/lnet/selftest/conctl.c
index 1a7870e..86cb031 100644
--- a/drivers/staging/lustre/lnet/selftest/conctl.c
+++ b/drivers/staging/lustre/lnet/selftest/conctl.c
@@ -752,7 +752,8 @@ static int lst_test_add_ioctl(lstio_test_args_t *args)
 	/* have parameter, check if parameter length is valid */
 	if (args->lstio_tes_param != NULL &&
 	    (args->lstio_tes_param_len <= 0 ||
-	     args->lstio_tes_param_len > PAGE_CACHE_SIZE - sizeof(lstcon_test_t)))
+	     args->lstio_tes_param_len > PAGE_CACHE_SIZE -
+	     sizeof(lstcon_test_t)))
 		return -EINVAL;
 
 	LIBCFS_ALLOC(batch_name, args->lstio_tes_bat_nmlen + 1);
@@ -925,5 +926,4 @@ out:
 
 	return rc;
 }
-
 EXPORT_SYMBOL(lstcon_ioctl_entry);
diff --git a/drivers/staging/lustre/lnet/selftest/conrpc.c b/drivers/staging/lustre/lnet/selftest/conrpc.c
index a1a4e08..c0ad353 100644
--- a/drivers/staging/lustre/lnet/selftest/conrpc.c
+++ b/drivers/staging/lustre/lnet/selftest/conrpc.c
@@ -455,14 +455,13 @@ lstcon_rpc_trans_stat(lstcon_rpc_trans_t *trans, lstcon_trans_stat_t *stat)
 		      lstcon_session_feats_check(trans->tas_features);
 	}
 
-	CDEBUG(D_NET, "transaction %s : success %d, failure %d, total %d, RPC error(%d), Framework error(%d)\n",
+	CDEBUG(D_NET,
+	       "transaction %s : success %d, failure %d, total %d, RPC error(%d), Framework error(%d)\n",
 	       lstcon_rpc_trans_name(trans->tas_opc),
 	       lstcon_rpc_stat_success(stat, 0),
 	       lstcon_rpc_stat_failure(stat, 0),
 	       lstcon_rpc_stat_total(stat, 0),
 	       stat->trs_rpc_errno, stat->trs_fwk_errno);
-
-	return;
 }
 
 int
@@ -564,10 +563,10 @@ lstcon_rpc_trans_destroy(lstcon_rpc_trans_t *trans)
 			continue;
 		}
 
-		/* rpcs can be still not callbacked (even LNetMDUnlink is called)
-		 * because huge timeout for inaccessible network, don't make
-		 * user wait for them, just abandon them, they will be recycled
-		 * in callback */
+		/* rpcs can be still not callbacked (even LNetMDUnlink is
+		 * called) because huge timeout for inaccessible network,
+		 * don't make user wait for them, just abandon them, they
+		 * will be recycled in callback */
 
 		LASSERT(crpc->crp_status != 0);
 
@@ -591,8 +590,6 @@ lstcon_rpc_trans_destroy(lstcon_rpc_trans_t *trans)
 	       lstcon_rpc_trans_name(trans->tas_opc), count);
 
 	LIBCFS_FREE(trans, sizeof(*trans));
-
-	return;
 }
 
 int
@@ -947,9 +944,10 @@ lstcon_sesnew_stat_reply(lstcon_rpc_trans_t *trans,
 	}
 
 	if (reply->msg_ses_feats != trans->tas_features) {
-		CNETERR("Framework features %x from %s is different with features on this transaction: %x\n",
-			 reply->msg_ses_feats, libcfs_nid2str(nd->nd_id.nid),
-			 trans->tas_features);
+		CNETERR(
+			"Framework features %x from %s is different with features on this transaction: %x\n",
+			reply->msg_ses_feats, libcfs_nid2str(nd->nd_id.nid),
+			trans->tas_features);
 		status = mksn_rep->mksn_status = EPROTO;
 	}
 
@@ -1077,8 +1075,6 @@ lstcon_rpc_stat_reply(lstcon_rpc_trans_t *trans, srpc_msg_t *msg,
 
 	if (stat->trs_fwk_errno = 0)
 		stat->trs_fwk_errno = rc;
-
-	return;
 }
 
 int
@@ -1111,8 +1107,9 @@ lstcon_rpc_trans_ndlist(struct list_head *ndlist,
 			continue;
 
 		if (rc < 0) {
-			CDEBUG(D_NET, "Condition error while creating RPC for transaction %d: %d\n",
-					transop, rc);
+			CDEBUG(D_NET,
+			       "Condition error while creating RPC for transaction %d: %d\n",
+			       transop, rc);
 			break;
 		}
 
@@ -1278,7 +1275,8 @@ lstcon_rpc_pinger(void *arg)
 
 	CDEBUG(D_NET, "Ping %d nodes in session\n", count);
 
-	ptimer->stt_expires = (unsigned long)(get_seconds() + LST_PING_INTERVAL);
+	ptimer->stt_expires = (unsigned long)(get_seconds() +
+			      LST_PING_INTERVAL);
 	stt_add_timer(ptimer);
 
 	mutex_unlock(&console_session.ses_mutex);
@@ -1301,7 +1299,8 @@ lstcon_rpc_pinger_start(void)
 	}
 
 	ptimer = &console_session.ses_ping_timer;
-	ptimer->stt_expires = (unsigned long)(get_seconds() + LST_PING_INTERVAL);
+	ptimer->stt_expires = (unsigned long)(get_seconds() +
+			      LST_PING_INTERVAL);
 
 	stt_add_timer(ptimer);
 
@@ -1349,7 +1348,8 @@ lstcon_rpc_cleanup_wait(void)
 
 		mutex_unlock(&console_session.ses_mutex);
 
-		CWARN("Session is shutting down, waiting for termination of transactions\n");
+		CWARN(
+		      "Session is shutting down, waiting for termination of transactions\n");
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		schedule_timeout(cfs_time_seconds(1));
 
@@ -1381,7 +1381,8 @@ lstcon_rpc_module_init(void)
 {
 	INIT_LIST_HEAD(&console_session.ses_ping_timer.stt_list);
 	console_session.ses_ping_timer.stt_func = lstcon_rpc_pinger;
-	console_session.ses_ping_timer.stt_data = &console_session.ses_ping_timer;
+	console_session.ses_ping_timer.stt_data +		&console_session.ses_ping_timer;
 
 	console_session.ses_ping = NULL;
 
diff --git a/drivers/staging/lustre/lnet/selftest/conrpc.h b/drivers/staging/lustre/lnet/selftest/conrpc.h
index 7d33cf9..5afb679 100644
--- a/drivers/staging/lustre/lnet/selftest/conrpc.h
+++ b/drivers/staging/lustre/lnet/selftest/conrpc.h
@@ -54,7 +54,8 @@
 #define LST_TRANS_TIMEOUT       30
 #define LST_TRANS_MIN_TIMEOUT   3
 
-#define LST_VALIDATE_TIMEOUT(t) min(max(t, LST_TRANS_MIN_TIMEOUT), LST_TRANS_TIMEOUT)
+#define LST_VALIDATE_TIMEOUT(t) min(max(t, LST_TRANS_MIN_TIMEOUT), \
+					LST_TRANS_TIMEOUT)
 
 #define LST_PING_INTERVAL       8
 
@@ -105,8 +106,8 @@ typedef struct lstcon_rpc_trans {
 
 #define LST_TRANS_STATQRY       0x21
 
-typedef int (* lstcon_rpc_cond_func_t)(int, struct lstcon_node *, void *);
-typedef int (* lstcon_rpc_readent_func_t)(int, srpc_msg_t *, lstcon_rpc_ent_t *);
+typedef int (*lstcon_rpc_cond_func_t)(int, struct lstcon_node *, void *);
+typedef int (*lstcon_rpc_readent_func_t)(int, srpc_msg_t *, lstcon_rpc_ent_t *);
 
 int  lstcon_sesrpc_prep(struct lstcon_node *nd, int transop,
 			unsigned version, lstcon_rpc_t **crpc);
diff --git a/drivers/staging/lustre/lnet/selftest/console.c b/drivers/staging/lustre/lnet/selftest/console.c
index f47c8f2..ed9c38f 100644
--- a/drivers/staging/lustre/lnet/selftest/console.c
+++ b/drivers/staging/lustre/lnet/selftest/console.c
@@ -77,7 +77,8 @@ lstcon_node_find(lnet_process_id_t id, lstcon_node_t **ndpp, int create)
 
 	LASSERT(id.nid != LNET_NID_ANY);
 
-	list_for_each_entry(ndl, &console_session.ses_ndl_hash[idx], ndl_hlink) {
+	list_for_each_entry(ndl, &console_session.ses_ndl_hash[idx],
+			    ndl_hlink) {
 		if (ndl->ndl_node->nd_id.nid != id.nid ||
 		    ndl->ndl_node->nd_id.pid != id.pid)
 			continue;
@@ -253,9 +254,8 @@ lstcon_group_decref(lstcon_group_t *grp)
 
 	lstcon_group_drain(grp, 0);
 
-	for (i = 0; i < LST_NODE_HASHSIZE; i++) {
+	for (i = 0; i < LST_NODE_HASHSIZE; i++)
 		LASSERT(list_empty(&grp->grp_ndl_hash[i]));
-	}
 
 	LIBCFS_FREE(grp, offsetof(lstcon_group_t,
 				  grp_ndl_hash[LST_NODE_HASHSIZE]));
@@ -308,7 +308,7 @@ lstcon_group_ndlink_release(lstcon_group_t *grp, lstcon_ndlink_t *ndl)
 {
 	list_del_init(&ndl->ndl_link);
 	lstcon_ndlink_release(ndl);
-	grp->grp_nnode --;
+	grp->grp_nnode--;
 }
 
 static void
@@ -320,13 +320,11 @@ lstcon_group_ndlink_move(lstcon_group_t *old,
 
 	list_del(&ndl->ndl_hlink);
 	list_del(&ndl->ndl_link);
-	old->grp_nnode --;
+	old->grp_nnode--;
 
 	list_add_tail(&ndl->ndl_hlink, &new->grp_ndl_hash[idx]);
 	list_add_tail(&ndl->ndl_link, &new->grp_ndl_list);
 	new->grp_nnode++;
-
-	return;
 }
 
 static void
@@ -527,7 +525,7 @@ lstcon_group_add(char *name)
 	lstcon_group_t *grp;
 	int rc;
 
-	rc = (lstcon_group_find(name, &grp) = 0)? -EEXIST: 0;
+	rc = (lstcon_group_find(name, &grp) = 0) ? -EEXIST : 0;
 	if (rc != 0) {
 		/* find a group with same name */
 		lstcon_group_put(grp);
@@ -816,7 +814,7 @@ lstcon_group_info(char *name, lstcon_ndlist_ent_t *gents_p,
 		LST_NODE_STATE_COUNTER(ndl->ndl_node, gentp);
 
 	rc = copy_to_user(gents_p, gentp,
-			      sizeof(lstcon_ndlist_ent_t)) ? -EFAULT: 0;
+			      sizeof(lstcon_ndlist_ent_t)) ? -EFAULT : 0;
 
 	LIBCFS_FREE(gentp, sizeof(lstcon_ndlist_ent_t));
 
@@ -847,7 +845,7 @@ lstcon_batch_add(char *name)
 	int i;
 	int rc;
 
-	rc = (lstcon_batch_find(name, &bat) = 0)? -EEXIST: 0;
+	rc = (lstcon_batch_find(name, &bat) = 0) ? -EEXIST : 0;
 	if (rc != 0) {
 		CDEBUG(D_NET, "Batch %s already exists\n", name);
 		return rc;
@@ -911,7 +909,7 @@ lstcon_batch_list(int index, int len, char *name_up)
 	list_for_each_entry(bat, &console_session.ses_bat_list, bat_link) {
 		if (index-- = 0) {
 			return copy_to_user(name_up, bat->bat_name, len) ?
-			       -EFAULT: 0;
+			       -EFAULT : 0;
 		}
 	}
 
@@ -956,7 +954,7 @@ lstcon_batch_info(char *name, lstcon_test_batch_ent_t *ent_up, int server,
 				  &test->tes_dst_grp->grp_ndl_list;
 
 	if (dents_up != NULL) {
-		rc = lstcon_nodes_getent((server ? srvlst: clilst),
+		rc = lstcon_nodes_getent((server ? srvlst : clilst),
 					 index_p, ndent_p, dents_up);
 		return rc;
 	}
@@ -1208,7 +1206,8 @@ again:
 
 		lstcon_rpc_trans_destroy(trans);
 		/* return if any error */
-		CDEBUG(D_NET, "Failed to add test %s, RPC error %d, framework error %d\n",
+		CDEBUG(D_NET,
+		       "Failed to add test %s, RPC error %d, framework error %d\n",
 		       transop = LST_TRANS_TSBCLIADD ? "client" : "server",
 		       lstcon_trans_stat()->trs_rpc_errno,
 		       lstcon_trans_stat()->trs_fwk_errno);
@@ -1683,7 +1682,7 @@ int
 lstcon_session_match(lst_sid_t sid)
 {
 	return (console_session.ses_id.ses_nid   = sid.ses_nid &&
-		console_session.ses_id.ses_stamp = sid.ses_stamp) ?  1: 0;
+		console_session.ses_id.ses_stamp = sid.ses_stamp) ? 1 : 0;
 }
 
 static void
@@ -1884,7 +1883,8 @@ lstcon_session_feats_check(unsigned feats)
 	spin_unlock(&console_session.ses_rpc_lock);
 
 	if (rc != 0) {
-		CERROR("remote features %x do not match with session features %x of console\n",
+		CERROR(
+		       "remote features %x do not match with session features %x of console\n",
 		       feats, console_session.ses_features);
 	}
 
@@ -2083,9 +2083,8 @@ lstcon_console_fini(void)
 	LASSERT(list_empty(&console_session.ses_bat_list));
 	LASSERT(list_empty(&console_session.ses_trans_list));
 
-	for (i = 0; i < LST_NODE_HASHSIZE; i++) {
+	for (i = 0; i < LST_NODE_HASHSIZE; i++)
 		LASSERT(list_empty(&console_session.ses_ndl_hash[i]));
-	}
 
 	LIBCFS_FREE(console_session.ses_ndl_hash,
 		    sizeof(struct list_head) * LST_GLOBAL_HASHSIZE);
diff --git a/drivers/staging/lustre/lnet/selftest/console.h b/drivers/staging/lustre/lnet/selftest/console.h
index c4cf0ae..7638042 100644
--- a/drivers/staging/lustre/lnet/selftest/console.h
+++ b/drivers/staging/lustre/lnet/selftest/console.h
@@ -116,9 +116,11 @@ typedef struct lstcon_test {
 	int              tes_oneside;    /* one-sided test */
 	int              tes_concur;     /* concurrency */
 	int              tes_loop;       /* loop count */
-	int              tes_dist;       /* nodes distribution of target group */
+	int              tes_dist;       /* nodes distribution of target
+					  * group */
 	int              tes_span;       /* nodes span of target group */
-	int              tes_cliidx;     /* client index, used for RPC creating */
+	int              tes_cliidx;     /* client index, used for RPC
+					  * creating */
 
 	struct list_head tes_trans_list; /* transaction list */
 	lstcon_group_t   *tes_src_grp;   /* group run the test */
@@ -177,7 +179,7 @@ lstcon_trans_stat(void)
 }
 
 static inline struct list_head *
-lstcon_id2hash (lnet_process_id_t id, struct list_head *hash)
+lstcon_id2hash(lnet_process_id_t id, struct list_head *hash)
 {
 	unsigned int idx = LNET_NIDADDR(id.nid) % LST_NODE_HASHSIZE;
 
@@ -191,7 +193,8 @@ extern int lstcon_session_match(lst_sid_t sid);
 extern int lstcon_session_new(char *name, int key, unsigned version,
 			      int timeout, int flags, lst_sid_t *sid_up);
 extern int lstcon_session_info(lst_sid_t *sid_up, int *key, unsigned *verp,
-			       lstcon_ndlist_ent_t *entp, char *name_up, int len);
+			       lstcon_ndlist_ent_t *entp, char *name_up,
+			       int len);
 extern int lstcon_session_end(void);
 extern int lstcon_session_debug(int timeout, struct list_head *result_up);
 extern int lstcon_session_feats_check(unsigned feats);
@@ -210,7 +213,8 @@ extern int lstcon_nodes_add(char *name, int nnd, lnet_process_id_t *nds_up,
 extern int lstcon_nodes_remove(char *name, int nnd, lnet_process_id_t *nds_up,
 			       struct list_head *result_up);
 extern int lstcon_group_info(char *name, lstcon_ndlist_ent_t *gent_up,
-			     int *index_p, int *ndent_p, lstcon_node_ent_t *ndents_up);
+			     int *index_p, int *ndent_p,
+			     lstcon_node_ent_t *ndents_up);
 extern int lstcon_group_list(int idx, int len, char *name_up);
 extern int lstcon_batch_add(char *name);
 extern int lstcon_batch_run(char *name, int timeout,
diff --git a/drivers/staging/lustre/lnet/selftest/framework.c b/drivers/staging/lustre/lnet/selftest/framework.c
index 7c5185a..8d948e2 100644
--- a/drivers/staging/lustre/lnet/selftest/framework.c
+++ b/drivers/staging/lustre/lnet/selftest/framework.c
@@ -173,7 +173,6 @@ sfw_add_session_timer(void)
 	timer->stt_expires = cfs_time_add(sn->sn_timeout,
 					  get_seconds());
 	stt_add_timer(timer);
-	return;
 }
 
 static int
@@ -203,7 +202,8 @@ sfw_deactivate_session(void)
 	sfw_batch_t *tsb;
 	sfw_test_case_t *tsc;
 
-	if (sn = NULL) return;
+	if (sn = NULL)
+		return;
 
 	LASSERT(!sn->sn_timer_active);
 
@@ -298,7 +298,6 @@ sfw_server_rpc_done(struct srpc_server_rpc *rpc)
 
 	if (rpc->srpc_bulk != NULL)
 		sfw_free_pages(rpc);
-	return;
 }
 
 static void
@@ -573,7 +572,8 @@ sfw_load_test(struct sfw_test_instance *tsi)
 
 	rc = srpc_service_add_buffers(svc, nbuf);
 	if (rc != 0) {
-		CWARN("Failed to reserve enough buffers: service %s, %d needed: %d\n",
+		CWARN(
+		      "Failed to reserve enough buffers: service %s, %d needed: %d\n",
 		      svc->sv_name, nbuf, rc);
 		/* NB: this error handler is not strictly correct, because
 		 * it may release more buffers than already allocated,
@@ -604,7 +604,6 @@ sfw_unload_test(struct sfw_test_instance *tsi)
 	 * some buffers behind, but never mind... */
 	srpc_service_remove_buffers(tsc->tsc_srv_service,
 				    sfw_test_buffers(tsi));
-	return;
 }
 
 static void
@@ -613,7 +612,8 @@ sfw_destroy_test_instance(sfw_test_instance_t *tsi)
 	srpc_client_rpc_t *rpc;
 	sfw_test_unit_t *tsu;
 
-	if (!tsi->tsi_is_client) goto clean;
+	if (!tsi->tsi_is_client)
+		goto clean;
 
 	tsi->tsi_ops->tso_fini(tsi);
 
@@ -638,7 +638,6 @@ sfw_destroy_test_instance(sfw_test_instance_t *tsi)
 clean:
 	sfw_unload_test(tsi);
 	LIBCFS_FREE(tsi, sizeof(*tsi));
-	return;
 }
 
 static void
@@ -657,7 +656,6 @@ sfw_destroy_batch(sfw_batch_t *tsb)
 	}
 
 	LIBCFS_FREE(tsb, sizeof(sfw_batch_t));
-	return;
 }
 
 void
@@ -677,7 +675,6 @@ sfw_destroy_session(sfw_session_t *sn)
 
 	LIBCFS_FREE(sn, sizeof(*sn));
 	atomic_dec(&sfw_data.fw_nzombies);
-	return;
 }
 
 static void
@@ -722,7 +719,6 @@ sfw_unpack_addtest_req(srpc_msg_t *msg)
 	}
 
 	LBUG();
-	return;
 }
 
 static int
@@ -785,7 +781,8 @@ sfw_add_test_instance(sfw_batch_t *tsb, srpc_server_rpc_t *rpc)
 		lnet_process_id_packed_t id;
 		int j;
 
-		dests = page_address(bk->bk_iovs[i / SFW_ID_PER_PAGE].kiov_page);
+		dests = page_address(bk->bk_iovs[i /
+						 SFW_ID_PER_PAGE].kiov_page);
 		LASSERT(dests != NULL);  /* my pages are within KVM always */
 		id = dests[i % SFW_ID_PER_PAGE];
 		if (msg->msg_magic != SRPC_MSG_MAGIC)
@@ -860,7 +857,6 @@ sfw_test_unit_done(sfw_test_unit_t *tsu)
 	spin_unlock(&sfw_data.fw_lock);
 
 	sfw_destroy_session(sn);
-	return;
 }
 
 static void
@@ -896,7 +892,6 @@ sfw_test_rpc_done(srpc_client_rpc_t *rpc)
 	}
 
 	sfw_test_unit_done(tsu);
-	return;
 }
 
 int
@@ -1019,7 +1014,7 @@ sfw_run_batch(sfw_batch_t *tsb)
 			tsu->tsu_loop = tsi->tsi_loop;
 			wi = &tsu->tsu_worker;
 			swi_init_workitem(wi, tsu, sfw_run_test,
-					  lst_sched_test[\
+					  lst_sched_test[
 					  lnet_cpt_of_nid(tsu->tsu_dest.nid)]);
 			swi_schedule_workitem(wi);
 		}
@@ -1268,7 +1263,8 @@ sfw_handle_server_rpc(struct srpc_server_rpc *rpc)
 
 		if (sn != NULL &&
 		    sn->sn_features != request->msg_ses_feats) {
-			CNETERR("Features of framework RPC don't match features of current session: %x/%x\n",
+			CNETERR(
+				"Features of framework RPC don't match features of current session: %x/%x\n",
 				request->msg_ses_feats, sn->sn_features);
 			reply->msg_body.reply.status = EPROTO;
 			reply->msg_body.reply.sid    = sn->sn_id;
@@ -1345,7 +1341,8 @@ sfw_bulk_ready(struct srpc_server_rpc *rpc, int status)
 	spin_lock(&sfw_data.fw_lock);
 
 	if (status != 0) {
-		CERROR("Bulk transfer failed for RPC: service %s, peer %s, status %d\n",
+		CERROR(
+		       "Bulk transfer failed for RPC: service %s, peer %s, status %d\n",
 		       sv->sv_name, libcfs_id2str(rpc->srpc_peer), status);
 		spin_unlock(&sfw_data.fw_lock);
 		return -EIO;
@@ -1556,7 +1553,6 @@ sfw_unpack_message(srpc_msg_t *msg)
 	}
 
 	LBUG();
-	return;
 }
 
 void
@@ -1568,7 +1564,6 @@ sfw_abort_rpc(srpc_client_rpc_t *rpc)
 	spin_lock(&rpc->crpc_lock);
 	srpc_abort_rpc(rpc, -EINTR);
 	spin_unlock(&rpc->crpc_lock);
-	return;
 }
 
 void
@@ -1585,7 +1580,6 @@ sfw_post_rpc(srpc_client_rpc_t *rpc)
 	srpc_post_rpc(rpc);
 
 	spin_unlock(&rpc->crpc_lock);
-	return;
 }
 
 static srpc_service_t sfw_services[] = {
@@ -1660,7 +1654,8 @@ sfw_startup(void)
 	}
 
 	if (session_timeout = 0)
-		CWARN("Zero session_timeout specified - test sessions never expire.\n");
+		CWARN(
+		      "Zero session_timeout specified - test sessions never expire.\n");
 
 	if (rpc_timeout = 0)
 		CWARN("Zero rpc_timeout specified - test RPC never expire.\n");
@@ -1700,7 +1695,8 @@ sfw_startup(void)
 
 	for (i = 0; ; i++) {
 		sv = &sfw_services[i];
-		if (sv->sv_name = NULL) break;
+		if (sv->sv_name = NULL)
+			break;
 
 		sv->sv_bulk_ready = NULL;
 		sv->sv_handler    = sfw_handle_server_rpc;
@@ -1717,11 +1713,13 @@ sfw_startup(void)
 		}
 
 		/* about to sfw_shutdown, no need to add buffer */
-		if (error) continue;
+		if (error)
+			continue;
 
 		rc = srpc_service_add_buffers(sv, sv->sv_wi_total);
 		if (rc != 0) {
-			CWARN("Failed to reserve enough buffers: service %s, %d needed: %d\n",
+			CWARN(
+			      "Failed to reserve enough buffers: service %s, %d needed: %d\n",
 			      sv->sv_name, sv->sv_wi_total, rc);
 			error = -ENOMEM;
 		}
@@ -1799,6 +1797,4 @@ sfw_shutdown(void)
 		list_del(&tsc->tsc_list);
 		LIBCFS_FREE(tsc, sizeof(*tsc));
 	}
-
-	return;
 }
diff --git a/drivers/staging/lustre/lnet/selftest/module.c b/drivers/staging/lustre/lnet/selftest/module.c
index 09b8f46..1afc581 100644
--- a/drivers/staging/lustre/lnet/selftest/module.c
+++ b/drivers/staging/lustre/lnet/selftest/module.c
@@ -118,7 +118,8 @@ lnet_selftest_init(void)
 		rc = cfs_wi_sched_create("lst_t", lnet_cpt_table(), i,
 					 nthrs, &lst_sched_test[i]);
 		if (rc != 0) {
-			CERROR("Failed to create CPT affinity WI scheduler %d for LST\n",
+			CERROR(
+			       "Failed to create CPT affinity WI scheduler %d for LST\n",
 			       i);
 			goto error;
 		}
diff --git a/drivers/staging/lustre/lnet/selftest/ping_test.c b/drivers/staging/lustre/lnet/selftest/ping_test.c
index 1dab998..6d48e06 100644
--- a/drivers/staging/lustre/lnet/selftest/ping_test.c
+++ b/drivers/staging/lustre/lnet/selftest/ping_test.c
@@ -165,7 +165,6 @@ ping_client_done_rpc(sfw_test_unit_t *tsu, srpc_client_rpc_t *rpc)
 	CDEBUG(D_NET, "%d reply in %u usec\n", reply->pnr_seq,
 		(unsigned)((tv.tv_sec - (unsigned)reqst->pnr_time_sec) * 1000000
 			   + (tv.tv_usec - reqst->pnr_time_usec)));
-	return;
 }
 
 static int
diff --git a/drivers/staging/lustre/lnet/selftest/rpc.c b/drivers/staging/lustre/lnet/selftest/rpc.c
index 59cf01f..41a09fa 100644
--- a/drivers/staging/lustre/lnet/selftest/rpc.c
+++ b/drivers/staging/lustre/lnet/selftest/rpc.c
@@ -118,7 +118,6 @@ srpc_free_bulk(srpc_bulk_t *bk)
 	}
 
 	LIBCFS_FREE(bk, offsetof(srpc_bulk_t, bk_iovs[bk->bk_niov]));
-	return;
 }
 
 srpc_bulk_t *
@@ -145,7 +144,8 @@ srpc_alloc_bulk(int cpt, unsigned bulk_npg, unsigned bulk_len, int sink)
 		struct page *pg;
 		int nob;
 
-		pg = alloc_pages_node(cfs_cpt_spread_node(lnet_cpt_table(), cpt),
+		pg = alloc_pages_node(cfs_cpt_spread_node(lnet_cpt_table(),
+							  cpt),
 				      GFP_IOFS, 0);
 		if (pg = NULL) {
 			CERROR("Can't allocate page %d of %d\n", i, bulk_npg);
@@ -680,7 +680,8 @@ srpc_finish_service(struct srpc_service *sv)
 
 		rpc = list_entry(scd->scd_rpc_active.next,
 				     struct srpc_server_rpc, srpc_list);
-		CNETERR("Active RPC %p on shutdown: sv %s, peer %s, wi %s scheduled %d running %d, ev fired %d type %d status %d lnet %d\n",
+		CNETERR(
+			"Active RPC %p on shutdown: sv %s, peer %s, wi %s scheduled %d running %d, ev fired %d type %d status %d lnet %d\n",
 			rpc, sv->sv_name, libcfs_id2str(rpc->srpc_peer),
 			swi_state2str(rpc->srpc_wi.swi_state),
 			rpc->srpc_wi.swi_workitem.wi_scheduled,
@@ -952,7 +953,6 @@ srpc_server_rpc_done(srpc_server_rpc_t *rpc, int status)
 	}
 
 	spin_unlock(&scd->scd_lock);
-	return;
 }
 
 /* handles an incoming RPC */
@@ -1103,7 +1103,6 @@ srpc_add_client_rpc_timer(srpc_client_rpc_t *rpc)
 	timer->stt_expires = cfs_time_add(rpc->crpc_timeout,
 					  get_seconds());
 	stt_add_timer(timer);
-	return;
 }
 
 /*
@@ -1166,7 +1165,6 @@ srpc_client_rpc_done(srpc_client_rpc_t *rpc, int status)
 	spin_unlock(&rpc->crpc_lock);
 
 	(*rpc->crpc_done)(rpc);
-	return;
 }
 
 /* sends an outgoing RPC */
@@ -1244,7 +1242,8 @@ srpc_send_rpc(swi_workitem_t *wi)
 		if (reply->msg_type != type ||
 		    (reply->msg_magic != SRPC_MSG_MAGIC &&
 		     reply->msg_magic != __swab32(SRPC_MSG_MAGIC))) {
-			CWARN("Bad message from %s: type %u (%d expected), magic %u (%d expected).\n",
+			CWARN(
+			      "Bad message from %s: type %u (%d expected), magic %u (%d expected).\n",
 			      libcfs_id2str(rpc->crpc_dest),
 			      reply->msg_type, type,
 			      reply->msg_magic, SRPC_MSG_MAGIC);
@@ -1253,7 +1252,8 @@ srpc_send_rpc(swi_workitem_t *wi)
 		}
 
 		if (do_bulk && reply->msg_body.reply.status != 0) {
-			CWARN("Remote error %d at %s, unlink bulk buffer in case peer didn't initiate bulk transfer\n",
+			CWARN(
+			      "Remote error %d at %s, unlink bulk buffer in case peer didn't initiate bulk transfer\n",
 			      reply->msg_body.reply.status,
 			      libcfs_id2str(rpc->crpc_dest));
 			LNetMDUnlink(rpc->crpc_bulk.bk_mdh);
@@ -1336,7 +1336,6 @@ srpc_abort_rpc(srpc_client_rpc_t *rpc, int why)
 	rpc->crpc_aborted = 1;
 	rpc->crpc_status  = why;
 	swi_schedule_workitem(&rpc->crpc_wi);
-	return;
 }
 
 /* called with rpc->crpc_lock held */
@@ -1352,7 +1351,6 @@ srpc_post_rpc(srpc_client_rpc_t *rpc)
 
 	srpc_add_client_rpc_timer(rpc);
 	swi_schedule_workitem(&rpc->crpc_wi);
-	return;
 }
 
 
@@ -1440,11 +1438,13 @@ srpc_lnet_ev_handler(lnet_event_t *ev)
 		if (rpcev != &crpc->crpc_reqstev &&
 		    rpcev != &crpc->crpc_replyev &&
 		    rpcev != &crpc->crpc_bulkev) {
-			CERROR("rpcev %p, crpc %p, reqstev %p, replyev %p, bulkev %p\n",
+			CERROR(
+			       "rpcev %p, crpc %p, reqstev %p, replyev %p, bulkev %p\n",
 			       rpcev, crpc, &crpc->crpc_reqstev,
 			       &crpc->crpc_replyev, &crpc->crpc_bulkev);
 			CERROR("Bad event: status %d, type %d, lnet %d\n",
-			       rpcev->ev_status, rpcev->ev_type, rpcev->ev_lnet);
+			       rpcev->ev_status, rpcev->ev_type,
+			       rpcev->ev_lnet);
 			LBUG();
 		}
 
@@ -1511,7 +1511,8 @@ srpc_lnet_ev_handler(lnet_event_t *ev)
 		     msg->msg_type != __swab32(type)) ||
 		    (msg->msg_magic != SRPC_MSG_MAGIC &&
 		     msg->msg_magic != __swab32(SRPC_MSG_MAGIC))) {
-			CERROR("Dropping RPC (%s) from %s: status %d mlength %d type %u magic %u.\n",
+			CERROR(
+			       "Dropping RPC (%s) from %s: status %d mlength %d type %u magic %u.\n",
 			       sv->sv_name, libcfs_id2str(ev->initiator),
 			       ev->status, ev->mlength,
 			       msg->msg_type, msg->msg_magic);
@@ -1668,6 +1669,4 @@ srpc_shutdown(void)
 	case SRPC_STATE_NI_INIT:
 		LNetNIFini();
 	}
-
-	return;
 }
diff --git a/drivers/staging/lustre/lnet/selftest/selftest.h b/drivers/staging/lustre/lnet/selftest/selftest.h
index 7939e4e..7a2b3d1 100644
--- a/drivers/staging/lustre/lnet/selftest/selftest.h
+++ b/drivers/staging/lustre/lnet/selftest/selftest.h
@@ -95,11 +95,11 @@ struct sfw_test_instance;
 #define SRPC_RDMA_PORTAL              52
 
 static inline srpc_msg_type_t
-srpc_service2request (int service)
+srpc_service2request(int service)
 {
 	switch (service) {
 	default:
-		LBUG ();
+		LBUG();
 	case SRPC_SERVICE_DEBUG:
 		return SRPC_MSG_DEBUG_REQST;
 
@@ -130,7 +130,7 @@ srpc_service2request (int service)
 }
 
 static inline srpc_msg_type_t
-srpc_service2reply (int service)
+srpc_service2reply(int service)
 {
 	return srpc_service2request(service) + 1;
 }
@@ -319,8 +319,8 @@ typedef struct srpc_service {
 	 * - sv_handler: process incoming RPC request
 	 * - sv_bulk_ready: notify bulk data
 	 */
-	int                     (*sv_handler) (srpc_server_rpc_t *);
-	int                     (*sv_bulk_ready) (srpc_server_rpc_t *, int);
+	int                     (*sv_handler)(srpc_server_rpc_t *);
+	int                     (*sv_bulk_ready)(srpc_server_rpc_t *, int);
 } srpc_service_t;
 
 typedef struct {
@@ -416,7 +416,7 @@ typedef struct sfw_test_case {
 srpc_client_rpc_t *
 sfw_create_rpc(lnet_process_id_t peer, int service,
 	       unsigned features, int nbulkiov, int bulklen,
-	       void (*done) (srpc_client_rpc_t *), void *priv);
+	       void (*done)(srpc_client_rpc_t *), void *priv);
 int sfw_create_test_rpc(sfw_test_unit_t *tsu,
 			lnet_process_id_t peer, unsigned features,
 			int nblk, int blklen, srpc_client_rpc_t **rpc);
@@ -428,7 +428,7 @@ void sfw_free_pages(srpc_server_rpc_t *rpc);
 void sfw_add_bulk_page(srpc_bulk_t *bk, struct page *pg, int i);
 int sfw_alloc_pages(srpc_server_rpc_t *rpc, int cpt, int npages, int len,
 		    int sink);
-int sfw_make_session (srpc_mksn_reqst_t *request, srpc_mksn_reply_t *reply);
+int sfw_make_session(srpc_mksn_reqst_t *request, srpc_mksn_reply_t *reply);
 
 srpc_client_rpc_t *
 srpc_create_client_rpc(lnet_process_id_t peer, int service,
@@ -504,26 +504,23 @@ void sfw_shutdown(void);
 void srpc_shutdown(void);
 
 static inline void
-srpc_destroy_client_rpc (srpc_client_rpc_t *rpc)
+srpc_destroy_client_rpc(srpc_client_rpc_t *rpc)
 {
 	LASSERT(rpc != NULL);
 	LASSERT(!srpc_event_pending(rpc));
 	LASSERT(atomic_read(&rpc->crpc_refcount) = 0);
 
-	if (rpc->crpc_fini = NULL) {
+	if (rpc->crpc_fini = NULL)
 		LIBCFS_FREE(rpc, srpc_client_rpc_size(rpc));
-	} else {
+	else
 		(*rpc->crpc_fini) (rpc);
-	}
-
-	return;
 }
 
 static inline void
-srpc_init_client_rpc (srpc_client_rpc_t *rpc, lnet_process_id_t peer,
-		      int service, int nbulkiov, int bulklen,
-		      void (*rpc_done)(srpc_client_rpc_t *),
-		      void (*rpc_fini)(srpc_client_rpc_t *), void *priv)
+srpc_init_client_rpc(srpc_client_rpc_t *rpc, lnet_process_id_t peer,
+		     int service, int nbulkiov, int bulklen,
+		     void (*rpc_done)(srpc_client_rpc_t *),
+		     void (*rpc_fini)(srpc_client_rpc_t *), void *priv)
 {
 	LASSERT(nbulkiov <= LNET_MAX_IOV);
 
@@ -555,24 +552,23 @@ srpc_init_client_rpc (srpc_client_rpc_t *rpc, lnet_process_id_t peer,
 	rpc->crpc_reqstmsg.msg_magic   = SRPC_MSG_MAGIC;
 	rpc->crpc_reqstmsg.msg_version = SRPC_MSG_VERSION;
 	rpc->crpc_reqstmsg.msg_type    = srpc_service2request(service);
-	return;
 }
 
 static inline const char *
-swi_state2str (int state)
+swi_state2str(int state)
 {
 #define STATE2STR(x) case x: return #x
-	switch(state) {
-		default:
-			LBUG();
-		STATE2STR(SWI_STATE_NEWBORN);
-		STATE2STR(SWI_STATE_REPLY_SUBMITTED);
-		STATE2STR(SWI_STATE_REPLY_SENT);
-		STATE2STR(SWI_STATE_REQUEST_SUBMITTED);
-		STATE2STR(SWI_STATE_REQUEST_SENT);
-		STATE2STR(SWI_STATE_REPLY_RECEIVED);
-		STATE2STR(SWI_STATE_BULK_STARTED);
-		STATE2STR(SWI_STATE_DONE);
+	switch (state) {
+	default:
+		LBUG();
+	STATE2STR(SWI_STATE_NEWBORN);
+	STATE2STR(SWI_STATE_REPLY_SUBMITTED);
+	STATE2STR(SWI_STATE_REPLY_SENT);
+	STATE2STR(SWI_STATE_REQUEST_SUBMITTED);
+	STATE2STR(SWI_STATE_REQUEST_SENT);
+	STATE2STR(SWI_STATE_REPLY_RECEIVED);
+	STATE2STR(SWI_STATE_BULK_STARTED);
+	STATE2STR(SWI_STATE_DONE);
 	}
 #undef STATE2STR
 }
@@ -607,7 +603,7 @@ srpc_wait_service_shutdown(srpc_service_t *sv)
 
 	while (srpc_finish_service(sv) = 0) {
 		i++;
-		CDEBUG (((i & -i) = i) ? D_WARNING : D_NET,
+		CDEBUG(((i & -i) = i) ? D_WARNING : D_NET,
 			"Waiting for %s service to shutdown...\n",
 			sv->sv_name);
 		selftest_wait_events();
diff --git a/drivers/staging/lustre/lnet/selftest/timer.h b/drivers/staging/lustre/lnet/selftest/timer.h
index 2a8803d..e2b1a57 100644
--- a/drivers/staging/lustre/lnet/selftest/timer.h
+++ b/drivers/staging/lustre/lnet/selftest/timer.h
@@ -41,7 +41,7 @@
 typedef struct {
 	struct list_head stt_list;
 	unsigned long    stt_expires;
-	void             (*stt_func) (void *);
+	void             (*stt_func)(void *);
 	void             *stt_data;
 } stt_timer_t;
 
-- 
1.7.1

