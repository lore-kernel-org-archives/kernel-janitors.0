From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 11 Jun 2015 12:02:58 +0000
Subject: [PATCH 7/7] lustre: ptlrpc: Replace uses of OBD_{ALLOC,FREE}_LARGE
Message-Id: <1434024178-8785-8-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434024178-8785-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1434024178-8785-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Replace uses of OBD_ALLOC_LARGE by libcfs_kvzalloc and OBD_FREE_LARGE by
kvfree.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression ptr,size;
@@

- OBD_ALLOC_LARGE(ptr,size)
+ ptr = libcfs_kvzalloc(size, GFP_NOFS)

@@
expression ptr,size;
@@

- OBD_FREE_LARGE(ptr, size);
+ kvfree(ptr);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/ptlrpc/client.c    |    4 ++--
 drivers/staging/lustre/lustre/ptlrpc/sec.c       |   10 +++++-----
 drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c  |   11 +++++------
 drivers/staging/lustre/lustre/ptlrpc/sec_null.c  |   16 ++++++++--------
 drivers/staging/lustre/lustre/ptlrpc/sec_plain.c |   16 ++++++++--------
 drivers/staging/lustre/lustre/ptlrpc/service.c   |   10 +++++-----
 6 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/lustre/lustre/ptlrpc/service.c b/drivers/staging/lustre/lustre/ptlrpc/service.c
index 25ccbcb..0d33154 100644
--- a/drivers/staging/lustre/lustre/ptlrpc/service.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/service.c
@@ -114,7 +114,7 @@ ptlrpc_free_rqbd(struct ptlrpc_request_buffer_desc *rqbd)
 	svcpt->scp_nrqbds_total--;
 	spin_unlock(&svcpt->scp_lock);
 
-	OBD_FREE_LARGE(rqbd->rqbd_buffer, svcpt->scp_service->srv_buf_size);
+	kvfree(rqbd->rqbd_buffer);
 	kfree(rqbd);
 }
 
@@ -1310,7 +1310,7 @@ static int ptlrpc_at_send_early_reply(struct ptlrpc_request *req)
 	reqcopy = ptlrpc_request_cache_alloc(GFP_NOFS);
 	if (reqcopy = NULL)
 		return -ENOMEM;
-	OBD_ALLOC_LARGE(reqmsg, req->rq_reqlen);
+	reqmsg = libcfs_kvzalloc(req->rq_reqlen, GFP_NOFS);
 	if (!reqmsg) {
 		rc = -ENOMEM;
 		goto out_free;
@@ -1374,7 +1374,7 @@ out_put:
 	class_export_put(reqcopy->rq_export);
 out:
 	sptlrpc_svc_ctx_decref(reqcopy);
-	OBD_FREE_LARGE(reqmsg, req->rq_reqlen);
+	kvfree(reqmsg);
 out_free:
 	ptlrpc_request_cache_free(reqcopy);
 	return rc;
@@ -2323,7 +2323,7 @@ static int ptlrpc_main(void *arg)
 	}
 
 	/* Alloc reply state structure for this one */
-	OBD_ALLOC_LARGE(rs, svc->srv_max_reply_size);
+	rs = libcfs_kvzalloc(svc->srv_max_reply_size, GFP_NOFS);
 	if (!rs) {
 		rc = -ENOMEM;
 		goto out_srv_fini;
@@ -2987,7 +2987,7 @@ ptlrpc_service_purge_all(struct ptlrpc_service *svc)
 					    struct ptlrpc_reply_state,
 					    rs_list);
 			list_del(&rs->rs_list);
-			OBD_FREE_LARGE(rs, svc->srv_max_reply_size);
+			kvfree(rs);
 		}
 	}
 }
diff --git a/drivers/staging/lustre/lustre/ptlrpc/sec_plain.c b/drivers/staging/lustre/lustre/ptlrpc/sec_plain.c
index ed39970..53ce0d1 100644
--- a/drivers/staging/lustre/lustre/ptlrpc/sec_plain.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/sec_plain.c
@@ -559,7 +559,7 @@ int plain_alloc_reqbuf(struct ptlrpc_sec *sec,
 		LASSERT(!req->rq_pool);
 
 		alloc_len = size_roundup_power2(alloc_len);
-		OBD_ALLOC_LARGE(req->rq_reqbuf, alloc_len);
+		req->rq_reqbuf = libcfs_kvzalloc(alloc_len, GFP_NOFS);
 		if (!req->rq_reqbuf)
 			return -ENOMEM;
 
@@ -584,7 +584,7 @@ void plain_free_reqbuf(struct ptlrpc_sec *sec,
 		       struct ptlrpc_request *req)
 {
 	if (!req->rq_pool) {
-		OBD_FREE_LARGE(req->rq_reqbuf, req->rq_reqbuf_len);
+		kvfree(req->rq_reqbuf);
 		req->rq_reqbuf = NULL;
 		req->rq_reqbuf_len = 0;
 	}
@@ -613,7 +613,7 @@ int plain_alloc_repbuf(struct ptlrpc_sec *sec,
 
 	alloc_len = size_roundup_power2(alloc_len);
 
-	OBD_ALLOC_LARGE(req->rq_repbuf, alloc_len);
+	req->rq_repbuf = libcfs_kvzalloc(alloc_len, GFP_NOFS);
 	if (!req->rq_repbuf)
 		return -ENOMEM;
 
@@ -625,7 +625,7 @@ static
 void plain_free_repbuf(struct ptlrpc_sec *sec,
 		       struct ptlrpc_request *req)
 {
-	OBD_FREE_LARGE(req->rq_repbuf, req->rq_repbuf_len);
+	kvfree(req->rq_repbuf);
 	req->rq_repbuf = NULL;
 	req->rq_repbuf_len = 0;
 }
@@ -664,7 +664,7 @@ int plain_enlarge_reqbuf(struct ptlrpc_sec *sec,
 	if (req->rq_reqbuf_len < newbuf_size) {
 		newbuf_size = size_roundup_power2(newbuf_size);
 
-		OBD_ALLOC_LARGE(newbuf, newbuf_size);
+		newbuf = libcfs_kvzalloc(newbuf_size, GFP_NOFS);
 		if (newbuf = NULL)
 			return -ENOMEM;
 
@@ -679,7 +679,7 @@ int plain_enlarge_reqbuf(struct ptlrpc_sec *sec,
 
 		memcpy(newbuf, req->rq_reqbuf, req->rq_reqbuf_len);
 
-		OBD_FREE_LARGE(req->rq_reqbuf, req->rq_reqbuf_len);
+		kvfree(req->rq_reqbuf);
 		req->rq_reqbuf = newbuf;
 		req->rq_reqbuf_len = newbuf_size;
 		req->rq_reqmsg = lustre_msg_buf(req->rq_reqbuf,
@@ -800,7 +800,7 @@ int plain_alloc_rs(struct ptlrpc_request *req, int msgsize)
 		/* pre-allocated */
 		LASSERT(rs->rs_size >= rs_size);
 	} else {
-		OBD_ALLOC_LARGE(rs, rs_size);
+		rs = libcfs_kvzalloc(rs_size, GFP_NOFS);
 		if (rs = NULL)
 			return -ENOMEM;
 
@@ -826,7 +826,7 @@ void plain_free_rs(struct ptlrpc_reply_state *rs)
 	atomic_dec(&rs->rs_svc_ctx->sc_refcount);
 
 	if (!rs->rs_prealloc)
-		OBD_FREE_LARGE(rs, rs->rs_size);
+		kvfree(rs);
 }
 
 static
diff --git a/drivers/staging/lustre/lustre/ptlrpc/sec_null.c b/drivers/staging/lustre/lustre/ptlrpc/sec_null.c
index 8c28b6b..ce1c563d 100644
--- a/drivers/staging/lustre/lustre/ptlrpc/sec_null.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/sec_null.c
@@ -159,7 +159,7 @@ int null_alloc_reqbuf(struct ptlrpc_sec *sec,
 		int alloc_size = size_roundup_power2(msgsize);
 
 		LASSERT(!req->rq_pool);
-		OBD_ALLOC_LARGE(req->rq_reqbuf, alloc_size);
+		req->rq_reqbuf = libcfs_kvzalloc(alloc_size, GFP_NOFS);
 		if (!req->rq_reqbuf)
 			return -ENOMEM;
 
@@ -186,7 +186,7 @@ void null_free_reqbuf(struct ptlrpc_sec *sec,
 			 "req %p: reqlen %d should smaller than buflen %d\n",
 			 req, req->rq_reqlen, req->rq_reqbuf_len);
 
-		OBD_FREE_LARGE(req->rq_reqbuf, req->rq_reqbuf_len);
+		kvfree(req->rq_reqbuf);
 		req->rq_reqbuf = NULL;
 		req->rq_reqbuf_len = 0;
 	}
@@ -202,7 +202,7 @@ int null_alloc_repbuf(struct ptlrpc_sec *sec,
 
 	msgsize = size_roundup_power2(msgsize);
 
-	OBD_ALLOC_LARGE(req->rq_repbuf, msgsize);
+	req->rq_repbuf = libcfs_kvzalloc(msgsize, GFP_NOFS);
 	if (!req->rq_repbuf)
 		return -ENOMEM;
 
@@ -216,7 +216,7 @@ void null_free_repbuf(struct ptlrpc_sec *sec,
 {
 	LASSERT(req->rq_repbuf);
 
-	OBD_FREE_LARGE(req->rq_repbuf, req->rq_repbuf_len);
+	kvfree(req->rq_repbuf);
 	req->rq_repbuf = NULL;
 	req->rq_repbuf_len = 0;
 }
@@ -247,7 +247,7 @@ int null_enlarge_reqbuf(struct ptlrpc_sec *sec,
 	if (req->rq_reqbuf_len < newmsg_size) {
 		alloc_size = size_roundup_power2(newmsg_size);
 
-		OBD_ALLOC_LARGE(newbuf, alloc_size);
+		newbuf = libcfs_kvzalloc(alloc_size, GFP_NOFS);
 		if (newbuf = NULL)
 			return -ENOMEM;
 
@@ -261,7 +261,7 @@ int null_enlarge_reqbuf(struct ptlrpc_sec *sec,
 			spin_lock(&req->rq_import->imp_lock);
 		memcpy(newbuf, req->rq_reqbuf, req->rq_reqlen);
 
-		OBD_FREE_LARGE(req->rq_reqbuf, req->rq_reqbuf_len);
+		kvfree(req->rq_reqbuf);
 		req->rq_reqbuf = req->rq_reqmsg = newbuf;
 		req->rq_reqbuf_len = alloc_size;
 
@@ -316,7 +316,7 @@ int null_alloc_rs(struct ptlrpc_request *req, int msgsize)
 		/* pre-allocated */
 		LASSERT(rs->rs_size >= rs_size);
 	} else {
-		OBD_ALLOC_LARGE(rs, rs_size);
+		rs = libcfs_kvzalloc(rs_size, GFP_NOFS);
 		if (rs = NULL)
 			return -ENOMEM;
 
@@ -341,7 +341,7 @@ void null_free_rs(struct ptlrpc_reply_state *rs)
 	atomic_dec(&rs->rs_svc_ctx->sc_refcount);
 
 	if (!rs->rs_prealloc)
-		OBD_FREE_LARGE(rs, rs->rs_size);
+		kvfree(rs);
 }
 
 static
diff --git a/drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c b/drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c
index ea35ca5..69d73c4 100644
--- a/drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c
@@ -689,9 +689,10 @@ EXPORT_SYMBOL(sptlrpc_enc_pool_del_user);
 static inline void enc_pools_alloc(void)
 {
 	LASSERT(page_pools.epp_max_pools);
-	OBD_ALLOC_LARGE(page_pools.epp_pools,
-			page_pools.epp_max_pools *
-			sizeof(*page_pools.epp_pools));
+	page_pools.epp_pools +		libcfs_kvzalloc(page_pools.epp_max_pools *
+				sizeof(*page_pools.epp_pools),
+				GFP_NOFS);
 }
 
 static inline void enc_pools_free(void)
@@ -699,9 +700,7 @@ static inline void enc_pools_free(void)
 	LASSERT(page_pools.epp_max_pools);
 	LASSERT(page_pools.epp_pools);
 
-	OBD_FREE_LARGE(page_pools.epp_pools,
-		       page_pools.epp_max_pools *
-		       sizeof(*page_pools.epp_pools));
+	kvfree(page_pools.epp_pools);
 }
 
 static struct shrinker pools_shrinker = {
diff --git a/drivers/staging/lustre/lustre/ptlrpc/sec.c b/drivers/staging/lustre/lustre/ptlrpc/sec.c
index 8798fab..b9821db 100644
--- a/drivers/staging/lustre/lustre/ptlrpc/sec.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/sec.c
@@ -469,7 +469,7 @@ int sptlrpc_req_ctx_switch(struct ptlrpc_request *req,
 	/* save request message */
 	reqmsg_size = req->rq_reqlen;
 	if (reqmsg_size != 0) {
-		OBD_ALLOC_LARGE(reqmsg, reqmsg_size);
+		reqmsg = libcfs_kvzalloc(reqmsg_size, GFP_NOFS);
 		if (reqmsg = NULL)
 			return -ENOMEM;
 		memcpy(reqmsg, req->rq_reqmsg, reqmsg_size);
@@ -497,7 +497,7 @@ int sptlrpc_req_ctx_switch(struct ptlrpc_request *req,
 			req->rq_flvr = old_flvr;
 		}
 
-		OBD_FREE_LARGE(reqmsg, reqmsg_size);
+		kvfree(reqmsg);
 	}
 	return rc;
 }
@@ -1093,7 +1093,7 @@ int sptlrpc_cli_unwrap_early_reply(struct ptlrpc_request *req,
 
 	early_size = req->rq_nob_received;
 	early_bufsz = size_roundup_power2(early_size);
-	OBD_ALLOC_LARGE(early_buf, early_bufsz);
+	early_buf = libcfs_kvzalloc(early_bufsz, GFP_NOFS);
 	if (early_buf = NULL) {
 		rc = -ENOMEM;
 		goto err_req;
@@ -1163,7 +1163,7 @@ int sptlrpc_cli_unwrap_early_reply(struct ptlrpc_request *req,
 err_ctx:
 	sptlrpc_cli_ctx_put(early_req->rq_cli_ctx, 1);
 err_buf:
-	OBD_FREE_LARGE(early_buf, early_bufsz);
+	kvfree(early_buf);
 err_req:
 	ptlrpc_request_cache_free(early_req);
 	return rc;
@@ -1181,7 +1181,7 @@ void sptlrpc_cli_finish_early_reply(struct ptlrpc_request *early_req)
 	LASSERT(early_req->rq_repmsg);
 
 	sptlrpc_cli_ctx_put(early_req->rq_cli_ctx, 1);
-	OBD_FREE_LARGE(early_req->rq_repbuf, early_req->rq_repbuf_len);
+	kvfree(early_req->rq_repbuf);
 	ptlrpc_request_cache_free(early_req);
 }
 
diff --git a/drivers/staging/lustre/lustre/ptlrpc/client.c b/drivers/staging/lustre/lustre/ptlrpc/client.c
index 35ebe0f..a12cd66 100644
--- a/drivers/staging/lustre/lustre/ptlrpc/client.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/client.c
@@ -435,7 +435,7 @@ void ptlrpc_free_rq_pool(struct ptlrpc_request_pool *pool)
 		list_del(&req->rq_list);
 		LASSERT(req->rq_reqbuf);
 		LASSERT(req->rq_reqbuf_len = pool->prp_rq_size);
-		OBD_FREE_LARGE(req->rq_reqbuf, pool->prp_rq_size);
+		kvfree(req->rq_reqbuf);
 		ptlrpc_request_cache_free(req);
 	}
 	spin_unlock(&pool->prp_lock);
@@ -469,7 +469,7 @@ void ptlrpc_add_rqs_to_pool(struct ptlrpc_request_pool *pool, int num_rq)
 		req = ptlrpc_request_cache_alloc(GFP_NOFS);
 		if (!req)
 			return;
-		OBD_ALLOC_LARGE(msg, size);
+		msg = libcfs_kvzalloc(size, GFP_NOFS);
 		if (!msg) {
 			ptlrpc_request_cache_free(req);
 			return;

