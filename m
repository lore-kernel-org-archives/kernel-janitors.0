From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 15:51:12 +0000
Subject: [PATCH 11/11] staging: lustre: ptlrpc: Use kzalloc and kfree
Message-Id: <1430495482-933-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Replace OBD_ALLOC, OBD_ALLOC_WAIT, OBD_ALLOC_PTR, and OBD_ALLOC_PTR_WAIT by
kalloc/kcalloc, and OBD_FREE and OBD_FREE_PTR by kfree.

A simplified version of the semantic patch that makes these changes is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@ expression ptr,size; @@
- OBD_ALLOC(ptr,size)
+ ptr = kzalloc(size, GFP_NOFS)

@@ expression ptr, size; @@
- OBD_FREE(ptr, size);
+ kfree(ptr);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/ptlrpc/client.c       |   18 ++++----
 drivers/staging/lustre/lustre/ptlrpc/connection.c   |    6 +-
 drivers/staging/lustre/lustre/ptlrpc/lproc_ptlrpc.c |   24 +++++------
 drivers/staging/lustre/lustre/ptlrpc/nrs.c          |   18 ++++----
 drivers/staging/lustre/lustre/ptlrpc/nrs_fifo.c     |    2 
 drivers/staging/lustre/lustre/ptlrpc/pinger.c       |    6 +-
 drivers/staging/lustre/lustre/ptlrpc/ptlrpcd.c      |   14 +++---
 drivers/staging/lustre/lustre/ptlrpc/sec.c          |    2 
 drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c     |   17 +++-----
 drivers/staging/lustre/lustre/ptlrpc/sec_config.c   |   16 +++----
 drivers/staging/lustre/lustre/ptlrpc/sec_plain.c    |   10 ++--
 drivers/staging/lustre/lustre/ptlrpc/service.c      |   42 +++++++++-----------
 12 files changed, 84 insertions(+), 91 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/ptlrpc/service.c b/drivers/staging/lustre/lustre/ptlrpc/service.c
--- a/drivers/staging/lustre/lustre/ptlrpc/service.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/service.c
@@ -87,7 +87,7 @@ ptlrpc_alloc_rqbd(struct ptlrpc_service_
 	OBD_CPT_ALLOC_LARGE(rqbd->rqbd_buffer, svc->srv_cptable,
 			    svcpt->scp_cpt, svc->srv_buf_size);
 	if (rqbd->rqbd_buffer = NULL) {
-		OBD_FREE_PTR(rqbd);
+		kfree(rqbd);
 		return NULL;
 	}
 
@@ -113,7 +113,7 @@ ptlrpc_free_rqbd(struct ptlrpc_request_b
 	spin_unlock(&svcpt->scp_lock);
 
 	OBD_FREE_LARGE(rqbd->rqbd_buffer, svcpt->scp_service->srv_buf_size);
-	OBD_FREE_PTR(rqbd);
+	kfree(rqbd);
 }
 
 int
@@ -661,13 +661,12 @@ ptlrpc_service_part_init(struct ptlrpc_s
 
  failed:
 	if (array->paa_reqs_count != NULL) {
-		OBD_FREE(array->paa_reqs_count, sizeof(__u32) * size);
+		kfree(array->paa_reqs_count);
 		array->paa_reqs_count = NULL;
 	}
 
 	if (array->paa_reqs_array != NULL) {
-		OBD_FREE(array->paa_reqs_array,
-			 sizeof(struct list_head) * array->paa_size);
+		kfree(array->paa_reqs_array);
 		array->paa_reqs_array = NULL;
 	}
 
@@ -724,17 +723,18 @@ ptlrpc_register_service(struct ptlrpc_se
 				CERROR("%s: failed to parse CPT array %s: %d\n",
 				       conf->psc_name, cconf->cc_pattern, rc);
 				if (cpts != NULL)
-					OBD_FREE(cpts, sizeof(*cpts) * ncpts);
+					kfree(cpts);
 				return ERR_PTR(rc < 0 ? rc : -EINVAL);
 			}
 			ncpts = rc;
 		}
 	}
 
-	OBD_ALLOC(service, offsetof(struct ptlrpc_service, srv_parts[ncpts]));
+	service = kzalloc(offsetof(struct ptlrpc_service, srv_parts[ncpts]),
+			  GFP_NOFS);
 	if (service = NULL) {
 		if (cpts != NULL)
-			OBD_FREE(cpts, sizeof(*cpts) * ncpts);
+			kfree(cpts);
 		return ERR_PTR(-ENOMEM);
 	}
 
@@ -2291,7 +2291,7 @@ static int ptlrpc_main(void *arg)
 			goto out;
 	}
 
-	OBD_ALLOC_PTR(env);
+	env = kzalloc(sizeof(*env), GFP_NOFS);
 	if (env = NULL) {
 		rc = -ENOMEM;
 		goto out_srv_fini;
@@ -2414,7 +2414,7 @@ out_srv_fini:
 
 	if (env != NULL) {
 		lu_context_fini(&env->le_ctx);
-		OBD_FREE_PTR(env);
+		kfree(env);
 	}
 out:
 	CDEBUG(D_RPCTRACE, "service thread [ %p : %u ] %d exiting: rc %d\n",
@@ -2596,7 +2596,7 @@ static void ptlrpc_svcpt_stop_threads(st
 		thread = list_entry(zombie.next,
 					struct ptlrpc_thread, t_link);
 		list_del(&thread->t_link);
-		OBD_FREE_PTR(thread);
+		kfree(thread);
 	}
 }
 
@@ -2678,7 +2678,7 @@ int ptlrpc_start_thread(struct ptlrpc_se
 	spin_lock(&svcpt->scp_lock);
 	if (!ptlrpc_threads_increasable(svcpt)) {
 		spin_unlock(&svcpt->scp_lock);
-		OBD_FREE_PTR(thread);
+		kfree(thread);
 		return -EMFILE;
 	}
 
@@ -2687,7 +2687,7 @@ int ptlrpc_start_thread(struct ptlrpc_se
 		 * might require unique and contiguous t_id */
 		LASSERT(svcpt->scp_nthrs_starting = 1);
 		spin_unlock(&svcpt->scp_lock);
-		OBD_FREE_PTR(thread);
+		kfree(thread);
 		if (wait) {
 			CDEBUG(D_INFO, "Waiting for creating thread %s #%d\n",
 			       svc->srv_thread_name, svcpt->scp_thr_nextid);
@@ -2733,7 +2733,7 @@ int ptlrpc_start_thread(struct ptlrpc_se
 		} else {
 			list_del(&thread->t_link);
 			spin_unlock(&svcpt->scp_lock);
-			OBD_FREE_PTR(thread);
+			kfree(thread);
 		}
 		return rc;
 	}
@@ -2817,8 +2817,7 @@ void ptlrpc_hr_fini(void)
 
 	cfs_percpt_for_each(hrp, i, ptlrpc_hr.hr_partitions) {
 		if (hrp->hrp_thrs != NULL) {
-			OBD_FREE(hrp->hrp_thrs,
-				 hrp->hrp_nthrs * sizeof(hrp->hrp_thrs[0]));
+			kfree(hrp->hrp_thrs);
 		}
 	}
 
@@ -2999,26 +2998,23 @@ ptlrpc_service_free(struct ptlrpc_servic
 		array = &svcpt->scp_at_array;
 
 		if (array->paa_reqs_array != NULL) {
-			OBD_FREE(array->paa_reqs_array,
-				 sizeof(struct list_head) * array->paa_size);
+			kfree(array->paa_reqs_array);
 			array->paa_reqs_array = NULL;
 		}
 
 		if (array->paa_reqs_count != NULL) {
-			OBD_FREE(array->paa_reqs_count,
-				 sizeof(__u32) * array->paa_size);
+			kfree(array->paa_reqs_count);
 			array->paa_reqs_count = NULL;
 		}
 	}
 
 	ptlrpc_service_for_each_part(svcpt, i, svc)
-		OBD_FREE_PTR(svcpt);
+		kfree(svcpt);
 
 	if (svc->srv_cpts != NULL)
 		cfs_expr_list_values_free(svc->srv_cpts, svc->srv_ncpts);
 
-	OBD_FREE(svc, offsetof(struct ptlrpc_service,
-			       srv_parts[svc->srv_ncpts]));
+	kfree(svc);
 }
 
 int ptlrpc_unregister_service(struct ptlrpc_service *service)
diff -u -p a/drivers/staging/lustre/lustre/ptlrpc/sec_plain.c b/drivers/staging/lustre/lustre/ptlrpc/sec_plain.c
--- a/drivers/staging/lustre/lustre/ptlrpc/sec_plain.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/sec_plain.c
@@ -376,7 +376,7 @@ struct ptlrpc_cli_ctx *plain_sec_install
 {
 	struct ptlrpc_cli_ctx  *ctx, *ctx_new;
 
-	OBD_ALLOC_PTR(ctx_new);
+	ctx_new = kzalloc(sizeof(*ctx_new), GFP_NOFS);
 
 	write_lock(&plsec->pls_lock);
 
@@ -385,7 +385,7 @@ struct ptlrpc_cli_ctx *plain_sec_install
 		atomic_inc(&ctx->cc_refcount);
 
 		if (ctx_new)
-			OBD_FREE_PTR(ctx_new);
+			kfree(ctx_new);
 	} else if (ctx_new) {
 		ctx = ctx_new;
 
@@ -424,7 +424,7 @@ void plain_destroy_sec(struct ptlrpc_sec
 
 	class_import_put(sec->ps_import);
 
-	OBD_FREE_PTR(plsec);
+	kfree(plsec);
 }
 
 static
@@ -444,7 +444,7 @@ struct ptlrpc_sec *plain_create_sec(stru
 
 	LASSERT(SPTLRPC_FLVR_POLICY(sf->sf_rpc) = SPTLRPC_POLICY_PLAIN);
 
-	OBD_ALLOC_PTR(plsec);
+	plsec = kzalloc(sizeof(*plsec), GFP_NOFS);
 	if (plsec = NULL)
 		return NULL;
 
@@ -508,7 +508,7 @@ void plain_release_ctx(struct ptlrpc_sec
 	LASSERT(atomic_read(&ctx->cc_refcount) = 0);
 	LASSERT(ctx->cc_sec = sec);
 
-	OBD_FREE_PTR(ctx);
+	kfree(ctx);
 
 	atomic_dec(&sec->ps_nctx);
 	sptlrpc_sec_put(sec);
diff -u -p a/drivers/staging/lustre/lustre/ptlrpc/sec_config.c b/drivers/staging/lustre/lustre/ptlrpc/sec_config.c
--- a/drivers/staging/lustre/lustre/ptlrpc/sec_config.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/sec_config.c
@@ -242,8 +242,7 @@ void sptlrpc_rule_set_free(struct sptlrp
 		(rset->srs_nrule = 0 && rset->srs_rules = NULL));
 
 	if (rset->srs_nslot) {
-		OBD_FREE(rset->srs_rules,
-			 rset->srs_nslot * sizeof(*rset->srs_rules));
+		kfree(rset->srs_rules);
 		sptlrpc_rule_set_init(rset);
 	}
 }
@@ -265,7 +264,7 @@ int sptlrpc_rule_set_expand(struct sptlr
 	nslot = rset->srs_nslot + 8;
 
 	/* better use realloc() if available */
-	OBD_ALLOC(rules, nslot * sizeof(*rset->srs_rules));
+	rules = kcalloc(nslot, sizeof(*rset->srs_rules), GFP_NOFS);
 	if (rules = NULL)
 		return -ENOMEM;
 
@@ -274,8 +273,7 @@ int sptlrpc_rule_set_expand(struct sptlr
 		memcpy(rules, rset->srs_rules,
 		       rset->srs_nrule * sizeof(*rset->srs_rules));
 
-		OBD_FREE(rset->srs_rules,
-			 rset->srs_nslot * sizeof(*rset->srs_rules));
+		kfree(rset->srs_rules);
 	}
 
 	rset->srs_rules = rules;
@@ -509,7 +507,7 @@ static void sptlrpc_conf_free_rsets(stru
 				     &conf->sc_tgts, sct_list) {
 		sptlrpc_rule_set_free(&conf_tgt->sct_rset);
 		list_del(&conf_tgt->sct_list);
-		OBD_FREE_PTR(conf_tgt);
+		kfree(conf_tgt);
 	}
 	LASSERT(list_empty(&conf->sc_tgts));
 
@@ -523,7 +521,7 @@ static void sptlrpc_conf_free(struct spt
 
 	sptlrpc_conf_free_rsets(conf);
 	list_del(&conf->sc_list);
-	OBD_FREE_PTR(conf);
+	kfree(conf);
 }
 
 static
@@ -541,7 +539,7 @@ struct sptlrpc_conf_tgt *sptlrpc_conf_ge
 	if (!create)
 		return NULL;
 
-	OBD_ALLOC_PTR(conf_tgt);
+	conf_tgt = kzalloc(sizeof(*conf_tgt), GFP_NOFS);
 	if (conf_tgt) {
 		strlcpy(conf_tgt->sct_name, name, sizeof(conf_tgt->sct_name));
 		sptlrpc_rule_set_init(&conf_tgt->sct_rset);
@@ -565,7 +563,7 @@ struct sptlrpc_conf *sptlrpc_conf_get(co
 	if (!create)
 		return NULL;
 
-	OBD_ALLOC_PTR(conf);
+	conf = kzalloc(sizeof(*conf), GFP_NOFS);
 	if (conf = NULL)
 		return NULL;
 
diff -u -p a/drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c b/drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c
--- a/drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c
@@ -210,7 +210,7 @@ static void enc_pools_release_free_pages
 	/* free unused pools */
 	while (p_idx_max1 < p_idx_max2) {
 		LASSERT(page_pools.epp_pools[p_idx_max2]);
-		OBD_FREE(page_pools.epp_pools[p_idx_max2], PAGE_CACHE_SIZE);
+		kfree(page_pools.epp_pools[p_idx_max2]);
 		page_pools.epp_pools[p_idx_max2] = NULL;
 		p_idx_max2--;
 	}
@@ -294,7 +294,7 @@ static unsigned long enc_pools_cleanup(s
 					cleaned++;
 				}
 			}
-			OBD_FREE(pools[i], PAGE_CACHE_SIZE);
+			kfree(pools[i]);
 			pools[i] = NULL;
 		}
 	}
@@ -409,12 +409,12 @@ static int enc_pools_add_pages(int npage
 	page_pools.epp_st_grows++;
 
 	npools = npages_to_npools(npages);
-	OBD_ALLOC(pools, npools * sizeof(*pools));
+	pools = kcalloc(npools, sizeof(*pools), GFP_NOFS);
 	if (pools = NULL)
 		goto out;
 
 	for (i = 0; i < npools; i++) {
-		OBD_ALLOC(pools[i], PAGE_CACHE_SIZE);
+		pools[i] = kzalloc(PAGE_CACHE_SIZE, GFP_NOFS);
 		if (pools[i] = NULL)
 			goto out_pools;
 
@@ -435,7 +435,7 @@ static int enc_pools_add_pages(int npage
 
 out_pools:
 	enc_pools_cleanup(pools, npools);
-	OBD_FREE(pools, npools * sizeof(*pools));
+	kfree(pools);
 out:
 	if (rc) {
 		page_pools.epp_st_grow_fails++;
@@ -508,8 +508,8 @@ int sptlrpc_enc_pool_get_pages(struct pt
 	if (desc->bd_enc_iov != NULL)
 		return 0;
 
-	OBD_ALLOC(desc->bd_enc_iov,
-		  desc->bd_iov_count * sizeof(*desc->bd_enc_iov));
+	desc->bd_enc_iov = kcalloc(desc->bd_iov_count,
+				   sizeof(*desc->bd_enc_iov), GFP_NOFS);
 	if (desc->bd_enc_iov = NULL)
 		return -ENOMEM;
 
@@ -646,8 +646,7 @@ void sptlrpc_enc_pool_put_pages(struct p
 
 	spin_unlock(&page_pools.epp_lock);
 
-	OBD_FREE(desc->bd_enc_iov,
-		 desc->bd_iov_count * sizeof(*desc->bd_enc_iov));
+	kfree(desc->bd_enc_iov);
 	desc->bd_enc_iov = NULL;
 }
 EXPORT_SYMBOL(sptlrpc_enc_pool_put_pages);
diff -u -p a/drivers/staging/lustre/lustre/ptlrpc/sec.c b/drivers/staging/lustre/lustre/ptlrpc/sec.c
--- a/drivers/staging/lustre/lustre/ptlrpc/sec.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/sec.c
@@ -866,7 +866,7 @@ void sptlrpc_request_out_callback(struct
 	if (req->rq_pool || !req->rq_reqbuf)
 		return;
 
-	OBD_FREE(req->rq_reqbuf, req->rq_reqbuf_len);
+	kfree(req->rq_reqbuf);
 	req->rq_reqbuf = NULL;
 	req->rq_reqbuf_len = 0;
 }
diff -u -p a/drivers/staging/lustre/lustre/ptlrpc/ptlrpcd.c b/drivers/staging/lustre/lustre/ptlrpc/ptlrpcd.c
--- a/drivers/staging/lustre/lustre/ptlrpc/ptlrpcd.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/ptlrpcd.c
@@ -528,8 +528,9 @@ static int ptlrpcd_bind(int index, int m
 	}
 
 	if (rc = 0 && pc->pc_npartners > 0) {
-		OBD_ALLOC(pc->pc_partners,
-			  sizeof(struct ptlrpcd_ctl *) * pc->pc_npartners);
+		pc->pc_partners = kcalloc(pc->pc_npartners,
+					  sizeof(struct ptlrpcd_ctl *),
+					  GFP_NOFS);
 		if (pc->pc_partners = NULL) {
 			pc->pc_npartners = 0;
 			rc = -ENOMEM;
@@ -699,8 +700,7 @@ out:
 	if (pc->pc_npartners > 0) {
 		LASSERT(pc->pc_partners != NULL);
 
-		OBD_FREE(pc->pc_partners,
-			 sizeof(struct ptlrpcd_ctl *) * pc->pc_npartners);
+		kfree(pc->pc_partners);
 		pc->pc_partners = NULL;
 	}
 	pc->pc_npartners = 0;
@@ -717,7 +717,7 @@ static void ptlrpcd_fini(void)
 			ptlrpcd_free(&ptlrpcds->pd_threads[i]);
 		ptlrpcd_stop(&ptlrpcds->pd_thread_rcv, 0);
 		ptlrpcd_free(&ptlrpcds->pd_thread_rcv);
-		OBD_FREE(ptlrpcds, ptlrpcds->pd_size);
+		kfree(ptlrpcds);
 		ptlrpcds = NULL;
 	}
 }
@@ -738,7 +738,7 @@ static int ptlrpcd_init(void)
 		nthreads &= ~1; /* make sure it is even */
 
 	size = offsetof(struct ptlrpcd, pd_threads[nthreads]);
-	OBD_ALLOC(ptlrpcds, size);
+	ptlrpcds = kzalloc(size, GFP_NOFS);
 	if (ptlrpcds = NULL) {
 		rc = -ENOMEM;
 		goto out;
@@ -781,7 +781,7 @@ out:
 			ptlrpcd_free(&ptlrpcds->pd_threads[j]);
 		ptlrpcd_stop(&ptlrpcds->pd_thread_rcv, 0);
 		ptlrpcd_free(&ptlrpcds->pd_thread_rcv);
-		OBD_FREE(ptlrpcds, size);
+		kfree(ptlrpcds);
 		ptlrpcds = NULL;
 	}
 
diff -u -p a/drivers/staging/lustre/lustre/ptlrpc/pinger.c b/drivers/staging/lustre/lustre/ptlrpc/pinger.c
--- a/drivers/staging/lustre/lustre/ptlrpc/pinger.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/pinger.c
@@ -427,7 +427,7 @@ struct timeout_item *ptlrpc_new_timeout(
 {
 	struct timeout_item *ti;
 
-	OBD_ALLOC_PTR(ti);
+	ti = kzalloc(sizeof(*ti), GFP_NOFS);
 	if (!ti)
 		return NULL;
 
@@ -514,7 +514,7 @@ int ptlrpc_del_timeout_client(struct lis
 	LASSERTF(ti != NULL, "ti is NULL !\n");
 	if (list_empty(&ti->ti_obd_list)) {
 		list_del(&ti->ti_chain);
-		OBD_FREE_PTR(ti);
+		kfree(ti);
 	}
 	mutex_unlock(&pinger_mutex);
 	return 0;
@@ -529,7 +529,7 @@ int ptlrpc_pinger_remove_timeouts(void)
 	list_for_each_entry_safe(item, tmp, &timeout_list, ti_chain) {
 		LASSERT(list_empty(&item->ti_obd_list));
 		list_del(&item->ti_chain);
-		OBD_FREE_PTR(item);
+		kfree(item);
 	}
 	mutex_unlock(&pinger_mutex);
 	return 0;
diff -u -p a/drivers/staging/lustre/lustre/ptlrpc/nrs_fifo.c b/drivers/staging/lustre/lustre/ptlrpc/nrs_fifo.c
--- a/drivers/staging/lustre/lustre/ptlrpc/nrs_fifo.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/nrs_fifo.c
@@ -105,7 +105,7 @@ static void nrs_fifo_stop(struct ptlrpc_
 	LASSERT(head != NULL);
 	LASSERT(list_empty(&head->fh_list));
 
-	OBD_FREE_PTR(head);
+	kfree(head);
 }
 
 /**
diff -u -p a/drivers/staging/lustre/lustre/ptlrpc/nrs.c b/drivers/staging/lustre/lustre/ptlrpc/nrs.c
--- a/drivers/staging/lustre/lustre/ptlrpc/nrs.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/nrs.c
@@ -715,7 +715,7 @@ static int nrs_policy_unregister(struct
 	nrs_policy_fini(policy);
 
 	LASSERT(policy->pol_private = NULL);
-	OBD_FREE_PTR(policy);
+	kfree(policy);
 
 	return 0;
 }
@@ -761,7 +761,7 @@ static int nrs_policy_register(struct pt
 
 	rc = nrs_policy_init(policy);
 	if (rc != 0) {
-		OBD_FREE_PTR(policy);
+		kfree(policy);
 		return rc;
 	}
 
@@ -776,7 +776,7 @@ static int nrs_policy_register(struct pt
 
 		spin_unlock(&nrs->nrs_lock);
 		nrs_policy_fini(policy);
-		OBD_FREE_PTR(policy);
+		kfree(policy);
 
 		return -EEXIST;
 	}
@@ -1013,7 +1013,7 @@ again:
 	}
 
 	if (hp)
-		OBD_FREE_PTR(nrs);
+		kfree(nrs);
 }
 
 /**
@@ -1153,7 +1153,7 @@ int ptlrpc_nrs_policy_register(struct pt
 		goto fail;
 	}
 
-	OBD_ALLOC_PTR(desc);
+	desc = kzalloc(sizeof(*desc), GFP_NOFS);
 	if (desc = NULL) {
 		rc = -ENOMEM;
 		goto fail;
@@ -1210,7 +1210,7 @@ again:
 				 */
 				LASSERT(rc2 = 0);
 				mutex_unlock(&ptlrpc_all_services_mutex);
-				OBD_FREE_PTR(desc);
+				kfree(desc);
 				goto fail;
 			}
 
@@ -1233,7 +1233,7 @@ again:
 				 */
 				LASSERT(rc2 = 0);
 				mutex_unlock(&ptlrpc_all_services_mutex);
-				OBD_FREE_PTR(desc);
+				kfree(desc);
 				goto fail;
 			}
 		}
@@ -1301,7 +1301,7 @@ int ptlrpc_nrs_policy_unregister(struct
 	       conf->nc_name);
 
 	list_del(&desc->pd_list);
-	OBD_FREE_PTR(desc);
+	kfree(desc);
 
 fail:
 	mutex_unlock(&ptlrpc_all_services_mutex);
@@ -1747,7 +1747,7 @@ void ptlrpc_nrs_fini(void)
 	list_for_each_entry_safe(desc, tmp, &nrs_core.nrs_policies,
 				     pd_list) {
 		list_del_init(&desc->pd_list);
-		OBD_FREE_PTR(desc);
+		kfree(desc);
 	}
 }
 
diff -u -p a/drivers/staging/lustre/lustre/ptlrpc/lproc_ptlrpc.c b/drivers/staging/lustre/lustre/ptlrpc/lproc_ptlrpc.c
--- a/drivers/staging/lustre/lustre/ptlrpc/lproc_ptlrpc.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/lproc_ptlrpc.c
@@ -507,7 +507,7 @@ static int ptlrpc_lprocfs_nrs_seq_show(s
 	num_pols = svc->srv_parts[0]->scp_nrs_reg.nrs_num_pols;
 	spin_unlock(&nrs->nrs_lock);
 
-	OBD_ALLOC(infos, num_pols * sizeof(*infos));
+	infos = kcalloc(num_pols, sizeof(*infos), GFP_NOFS);
 	if (infos = NULL) {
 		rc = -ENOMEM;
 		goto out;
@@ -619,7 +619,7 @@ again:
 
 out:
 	if (infos)
-		OBD_FREE(infos, num_pols * sizeof(*infos));
+		kfree(infos);
 
 	mutex_unlock(&nrs_core.nrs_mutex);
 
@@ -655,7 +655,7 @@ static ssize_t ptlrpc_lprocfs_nrs_seq_wr
 		goto out;
 	}
 
-	OBD_ALLOC(cmd, LPROCFS_NRS_WR_MAX_CMD);
+	cmd = kzalloc(LPROCFS_NRS_WR_MAX_CMD, GFP_NOFS);
 	if (cmd = NULL) {
 		rc = -ENOMEM;
 		goto out;
@@ -717,7 +717,7 @@ default_queue:
 	mutex_unlock(&nrs_core.nrs_mutex);
 out:
 	if (cmd_copy)
-		OBD_FREE(cmd_copy, LPROCFS_NRS_WR_MAX_CMD);
+		kfree(cmd_copy);
 
 	return rc < 0 ? rc : count;
 }
@@ -825,7 +825,7 @@ ptlrpc_lprocfs_svc_req_history_start(str
 		return NULL;
 	}
 
-	OBD_ALLOC(srhi, sizeof(*srhi));
+	srhi = kzalloc(sizeof(*srhi), GFP_NOFS);
 	if (srhi = NULL)
 		return NULL;
 
@@ -851,7 +851,7 @@ ptlrpc_lprocfs_svc_req_history_start(str
 		}
 	}
 
-	OBD_FREE(srhi, sizeof(*srhi));
+	kfree(srhi);
 	return NULL;
 }
 
@@ -861,7 +861,7 @@ ptlrpc_lprocfs_svc_req_history_stop(stru
 	struct ptlrpc_srh_iterator *srhi = iter;
 
 	if (srhi != NULL)
-		OBD_FREE(srhi, sizeof(*srhi));
+		kfree(srhi);
 }
 
 static void *
@@ -895,7 +895,7 @@ ptlrpc_lprocfs_svc_req_history_next(stru
 		}
 	}
 
-	OBD_FREE(srhi, sizeof(*srhi));
+	kfree(srhi);
 	return NULL;
 }
 
@@ -1191,7 +1191,7 @@ int lprocfs_wr_evict_client(struct file
 	char	      *kbuf;
 	char	      *tmpbuf;
 
-	OBD_ALLOC(kbuf, BUFLEN);
+	kbuf = kzalloc(BUFLEN, GFP_NOFS);
 	if (kbuf = NULL)
 		return -ENOMEM;
 
@@ -1225,7 +1225,7 @@ int lprocfs_wr_evict_client(struct file
 	class_decref(obd, __func__, current);
 
 out:
-	OBD_FREE(kbuf, BUFLEN);
+	kfree(kbuf);
 	return count;
 }
 EXPORT_SYMBOL(lprocfs_wr_evict_client);
@@ -1275,7 +1275,7 @@ int lprocfs_wr_import(struct file *file,
 	if (count > PAGE_CACHE_SIZE - 1 || count <= prefix_len)
 		return -EINVAL;
 
-	OBD_ALLOC(kbuf, count + 1);
+	kbuf = kzalloc(count + 1, GFP_NOFS);
 	if (kbuf = NULL)
 		return -ENOMEM;
 
@@ -1319,7 +1319,7 @@ int lprocfs_wr_import(struct file *file,
 		ptlrpc_recover_import(imp, uuid, 1);
 
 out:
-	OBD_FREE(kbuf, count + 1);
+	kfree(kbuf);
 	return count;
 }
 EXPORT_SYMBOL(lprocfs_wr_import);
diff -u -p a/drivers/staging/lustre/lustre/ptlrpc/connection.c b/drivers/staging/lustre/lustre/ptlrpc/connection.c
--- a/drivers/staging/lustre/lustre/ptlrpc/connection.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/connection.c
@@ -54,7 +54,7 @@ ptlrpc_connection_get(lnet_process_id_t
 	if (conn)
 		goto out;
 
-	OBD_ALLOC_PTR(conn);
+	conn = kzalloc(sizeof(*conn), GFP_NOFS);
 	if (!conn)
 		return NULL;
 
@@ -76,7 +76,7 @@ ptlrpc_connection_get(lnet_process_id_t
 	/* coverity[overrun-buffer-val] */
 	conn2 = cfs_hash_findadd_unique(conn_hash, &peer, &conn->c_hash);
 	if (conn != conn2) {
-		OBD_FREE_PTR(conn);
+		kfree(conn);
 		conn = conn2;
 	}
 out:
@@ -227,7 +227,7 @@ conn_exit(struct cfs_hash *hs, struct hl
 	LASSERTF(atomic_read(&conn->c_refcount) = 0,
 		 "Busy connection with %d refs\n",
 		 atomic_read(&conn->c_refcount));
-	OBD_FREE_PTR(conn);
+	kfree(conn);
 }
 
 static cfs_hash_ops_t conn_hash_ops = {
diff -u -p a/drivers/staging/lustre/lustre/ptlrpc/client.c b/drivers/staging/lustre/lustre/ptlrpc/client.c
--- a/drivers/staging/lustre/lustre/ptlrpc/client.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/client.c
@@ -103,7 +103,8 @@ struct ptlrpc_bulk_desc *ptlrpc_new_bulk
 	struct ptlrpc_bulk_desc *desc;
 	int i;
 
-	OBD_ALLOC(desc, offsetof(struct ptlrpc_bulk_desc, bd_iov[npages]));
+	desc = kzalloc(offsetof(struct ptlrpc_bulk_desc, bd_iov[npages]),
+		       GFP_NOFS);
 	if (!desc)
 		return NULL;
 
@@ -205,8 +206,7 @@ void __ptlrpc_free_bulk(struct ptlrpc_bu
 			page_cache_release(desc->bd_iov[i].kiov_page);
 	}
 
-	OBD_FREE(desc, offsetof(struct ptlrpc_bulk_desc,
-				bd_iov[desc->bd_max_iov]));
+	kfree(desc);
 }
 EXPORT_SYMBOL(__ptlrpc_free_bulk);
 
@@ -439,7 +439,7 @@ void ptlrpc_free_rq_pool(struct ptlrpc_r
 		ptlrpc_request_cache_free(req);
 	}
 	spin_unlock(&pool->prp_lock);
-	OBD_FREE(pool, sizeof(*pool));
+	kfree(pool);
 }
 EXPORT_SYMBOL(ptlrpc_free_rq_pool);
 
@@ -498,7 +498,7 @@ ptlrpc_init_rq_pool(int num_rq, int msgs
 {
 	struct ptlrpc_request_pool *pool;
 
-	OBD_ALLOC(pool, sizeof(struct ptlrpc_request_pool));
+	pool = kzalloc(sizeof(struct ptlrpc_request_pool), GFP_NOFS);
 	if (!pool)
 		return NULL;
 
@@ -514,7 +514,7 @@ ptlrpc_init_rq_pool(int num_rq, int msgs
 
 	if (list_empty(&pool->prp_req_list)) {
 		/* have not allocated a single request for the pool */
-		OBD_FREE(pool, sizeof(struct ptlrpc_request_pool));
+		kfree(pool);
 		pool = NULL;
 	}
 	return pool;
@@ -856,7 +856,7 @@ struct ptlrpc_request_set *ptlrpc_prep_s
 {
 	struct ptlrpc_request_set *set;
 
-	OBD_ALLOC(set, sizeof(*set));
+	set = kzalloc(sizeof(*set), GFP_NOFS);
 	if (!set)
 		return NULL;
 	atomic_set(&set->set_refcount, 1);
@@ -970,7 +970,7 @@ int ptlrpc_set_add_cb(struct ptlrpc_requ
 {
 	struct ptlrpc_set_cbdata *cbdata;
 
-	OBD_ALLOC_PTR(cbdata);
+	cbdata = kzalloc(sizeof(*cbdata), GFP_NOFS);
 	if (cbdata = NULL)
 		return -ENOMEM;
 
@@ -2214,7 +2214,7 @@ int ptlrpc_set_wait(struct ptlrpc_reques
 			err = cbdata->psc_interpret(set, cbdata->psc_data, rc);
 			if (err && !rc)
 				rc = err;
-			OBD_FREE_PTR(cbdata);
+			kfree(cbdata);
 		}
 	}
 

