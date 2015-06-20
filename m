From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 20 Jun 2015 16:59:10 +0000
Subject: [PATCH 12/12] staging: lustre: ptlrpc: Use !x to check for kzalloc failure
Message-Id: <1434819550-3193-13-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434819550-3193-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1434819550-3193-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

!x is more normal for kzalloc failure in the kernel.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x;
statement S1, S2;
@@

x = kzalloc(...);
if (
- x = NULL
+ !x
 ) S1 else S2
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/ptlrpc/client.c       |    2 +-
 drivers/staging/lustre/lustre/ptlrpc/lproc_ptlrpc.c |    8 ++++----
 drivers/staging/lustre/lustre/ptlrpc/nrs.c          |    2 +-
 drivers/staging/lustre/lustre/ptlrpc/ptlrpcd.c      |    2 +-
 drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c     |    2 +-
 drivers/staging/lustre/lustre/ptlrpc/sec_config.c   |    2 +-
 drivers/staging/lustre/lustre/ptlrpc/sec_plain.c    |    2 +-
 drivers/staging/lustre/lustre/ptlrpc/service.c      |    4 ++--
 8 files changed, 12 insertions(+), 12 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/ptlrpc/service.c b/drivers/staging/lustre/lustre/ptlrpc/service.c
--- a/drivers/staging/lustre/lustre/ptlrpc/service.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/service.c
@@ -732,7 +732,7 @@ ptlrpc_register_service(struct ptlrpc_se
 
 	service = kzalloc(offsetof(struct ptlrpc_service, srv_parts[ncpts]),
 			  GFP_NOFS);
-	if (service = NULL) {
+	if (!service) {
 		kfree(cpts);
 		return ERR_PTR(-ENOMEM);
 	}
@@ -2298,7 +2298,7 @@ static int ptlrpc_main(void *arg)
 	}
 
 	env = kzalloc(sizeof(*env), GFP_NOFS);
-	if (env = NULL) {
+	if (!env) {
 		rc = -ENOMEM;
 		goto out_srv_fini;
 	}
diff -u -p a/drivers/staging/lustre/lustre/ptlrpc/sec_plain.c b/drivers/staging/lustre/lustre/ptlrpc/sec_plain.c
--- a/drivers/staging/lustre/lustre/ptlrpc/sec_plain.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/sec_plain.c
@@ -444,7 +444,7 @@ struct ptlrpc_sec *plain_create_sec(stru
 	LASSERT(SPTLRPC_FLVR_POLICY(sf->sf_rpc) = SPTLRPC_POLICY_PLAIN);
 
 	plsec = kzalloc(sizeof(*plsec), GFP_NOFS);
-	if (plsec = NULL)
+	if (!plsec)
 		return NULL;
 
 	/*
diff -u -p a/drivers/staging/lustre/lustre/ptlrpc/sec_config.c b/drivers/staging/lustre/lustre/ptlrpc/sec_config.c
--- a/drivers/staging/lustre/lustre/ptlrpc/sec_config.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/sec_config.c
@@ -564,7 +564,7 @@ struct sptlrpc_conf *sptlrpc_conf_get(co
 		return NULL;
 
 	conf = kzalloc(sizeof(*conf), GFP_NOFS);
-	if (conf = NULL)
+	if (!conf)
 		return NULL;
 
 	strcpy(conf->sc_fsname, fsname);
diff -u -p a/drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c b/drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c
--- a/drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c
@@ -415,7 +415,7 @@ static int enc_pools_add_pages(int npage
 
 	for (i = 0; i < npools; i++) {
 		pools[i] = kzalloc(PAGE_CACHE_SIZE, GFP_NOFS);
-		if (pools[i] = NULL)
+		if (!pools[i])
 			goto out_pools;
 
 		for (j = 0; j < PAGES_PER_POOL && alloced < npages; j++) {
diff -u -p a/drivers/staging/lustre/lustre/ptlrpc/ptlrpcd.c b/drivers/staging/lustre/lustre/ptlrpc/ptlrpcd.c
--- a/drivers/staging/lustre/lustre/ptlrpc/ptlrpcd.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/ptlrpcd.c
@@ -739,7 +739,7 @@ static int ptlrpcd_init(void)
 
 	size = offsetof(struct ptlrpcd, pd_threads[nthreads]);
 	ptlrpcds = kzalloc(size, GFP_NOFS);
-	if (ptlrpcds = NULL) {
+	if (!ptlrpcds) {
 		rc = -ENOMEM;
 		goto out;
 	}
diff -u -p a/drivers/staging/lustre/lustre/ptlrpc/nrs.c b/drivers/staging/lustre/lustre/ptlrpc/nrs.c
--- a/drivers/staging/lustre/lustre/ptlrpc/nrs.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/nrs.c
@@ -1156,7 +1156,7 @@ int ptlrpc_nrs_policy_register(struct pt
 	}
 
 	desc = kzalloc(sizeof(*desc), GFP_NOFS);
-	if (desc = NULL) {
+	if (!desc) {
 		rc = -ENOMEM;
 		goto fail;
 	}
diff -u -p a/drivers/staging/lustre/lustre/ptlrpc/lproc_ptlrpc.c b/drivers/staging/lustre/lustre/ptlrpc/lproc_ptlrpc.c
--- a/drivers/staging/lustre/lustre/ptlrpc/lproc_ptlrpc.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/lproc_ptlrpc.c
@@ -652,7 +652,7 @@ static ssize_t ptlrpc_lprocfs_nrs_seq_wr
 		return -EINVAL;
 
 	cmd = kzalloc(LPROCFS_NRS_WR_MAX_CMD, GFP_NOFS);
-	if (cmd = NULL)
+	if (!cmd)
 		return -ENOMEM;
 	/**
 	 * strsep() modifies its argument, so keep a copy
@@ -819,7 +819,7 @@ ptlrpc_lprocfs_svc_req_history_start(str
 	}
 
 	srhi = kzalloc(sizeof(*srhi), GFP_NOFS);
-	if (srhi = NULL)
+	if (!srhi)
 		return NULL;
 
 	srhi->srhi_seq = 0;
@@ -1219,7 +1219,7 @@ int lprocfs_wr_evict_client(struct file
 	char *tmpbuf;
 
 	kbuf = kzalloc(BUFLEN, GFP_NOFS);
-	if (kbuf = NULL)
+	if (!kbuf)
 		return -ENOMEM;
 
 	/*
@@ -1303,7 +1303,7 @@ int lprocfs_wr_import(struct file *file,
 		return -EINVAL;
 
 	kbuf = kzalloc(count + 1, GFP_NOFS);
-	if (kbuf = NULL)
+	if (!kbuf)
 		return -ENOMEM;
 
 	if (copy_from_user(kbuf, buffer, count)) {
diff -u -p a/drivers/staging/lustre/lustre/ptlrpc/client.c b/drivers/staging/lustre/lustre/ptlrpc/client.c
--- a/drivers/staging/lustre/lustre/ptlrpc/client.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/client.c
@@ -971,7 +971,7 @@ int ptlrpc_set_add_cb(struct ptlrpc_requ
 	struct ptlrpc_set_cbdata *cbdata;
 
 	cbdata = kzalloc(sizeof(*cbdata), GFP_NOFS);
-	if (cbdata = NULL)
+	if (!cbdata)
 		return -ENOMEM;
 
 	cbdata->psc_interpret = fn;

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
