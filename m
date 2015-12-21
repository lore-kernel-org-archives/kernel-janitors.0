From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Dec 2015 19:12:12 +0000
Subject: [PATCH v2 3/4] staging: lustre: Less checks in mgc_process_recover_log() after error detection
Message-Id: <56784F0C.6040007@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <566D7733.1030102@users.sourceforge.net>
 <56784D83.7080108@users.sourceforge.net>
In-Reply-To: <56784D83.7080108@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lustre-devel@lists.lustre.org, devel@driverdev.osuosl.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oleg Drokin <oleg.drokin@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Dec 2015 18:58:51 +0100

A few checks would be performed by the mgc_process_recover_log() function
even though it was determined that the passed variable "pages" contained
a null pointer or a call of the alloc_page() function failed.

1. Let us return directly if a call of the kcalloc() function failed.

2. Corresponding implementation details could be improved by adjustments
   for jump targets according to the Linux coding style convention.

3. Delete sanity checks then.

4. Move an assignment for the variable "eof" behind memory allocations.

5. The variable "req" will eventually be set to an appropriate pointer
   from a call of the ptlrpc_request_alloc() function.
   Thus let us omit the explicit initialisation before.

6. Apply a recommendation from the script "checkpatch.pl".

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/lustre/lustre/mgc/mgc_request.c | 51 +++++++++++--------------
 1 file changed, 23 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/lustre/lustre/mgc/mgc_request.c b/drivers/staging/lustre/lustre/mgc/mgc_request.c
index da130f4..5f581df 100644
--- a/drivers/staging/lustre/lustre/mgc/mgc_request.c
+++ b/drivers/staging/lustre/lustre/mgc/mgc_request.c
@@ -1285,14 +1285,14 @@ static int mgc_apply_recover_logs(struct obd_device *mgc,
 static int mgc_process_recover_log(struct obd_device *obd,
 				   struct config_llog_data *cld)
 {
-	struct ptlrpc_request *req = NULL;
+	struct ptlrpc_request *req;
 	struct config_llog_instance *cfg = &cld->cld_cfg;
 	struct mgs_config_body *body;
 	struct mgs_config_res  *res;
 	struct ptlrpc_bulk_desc *desc;
 	struct page **pages;
 	int nrpages;
-	bool eof = true;
+	bool eof;
 	bool mne_swab;
 	int i;
 	int ealen;
@@ -1309,19 +1309,18 @@ static int mgc_process_recover_log(struct obd_device *obd,
 		nrpages = CONFIG_READ_NRPAGES_INIT;
 
 	pages = kcalloc(nrpages, sizeof(*pages), GFP_KERNEL);
-	if (pages = NULL) {
-		rc = -ENOMEM;
-		goto out;
-	}
+	if (!pages)
+		return -ENOMEM;
 
 	for (i = 0; i < nrpages; i++) {
 		pages[i] = alloc_page(GFP_KERNEL);
 		if (pages[i] = NULL) {
 			rc = -ENOMEM;
-			goto out;
+			goto free_pages;
 		}
 	}
 
+	eof = true;
 again:
 	LASSERT(cld_is_recover(cld));
 	LASSERT(mutex_is_locked(&cld->cld_lock));
@@ -1329,12 +1328,12 @@ again:
 				   &RQF_MGS_CONFIG_READ);
 	if (req = NULL) {
 		rc = -ENOMEM;
-		goto out;
+		goto free_pages;
 	}
 
 	rc = ptlrpc_request_pack(req, LUSTRE_MGS_VERSION, MGS_CONFIG_READ);
 	if (rc)
-		goto out;
+		goto finish_request;
 
 	/* pack request */
 	body = req_capsule_client_get(&req->rq_pill, &RMF_MGS_CONFIG_BODY);
@@ -1343,7 +1342,7 @@ again:
 	if (strlcpy(body->mcb_name, cld->cld_logname, sizeof(body->mcb_name))
 	    >= sizeof(body->mcb_name)) {
 		rc = -E2BIG;
-		goto out;
+		goto finish_request;
 	}
 	body->mcb_offset = cfg->cfg_last_idx + 1;
 	body->mcb_type   = cld->cld_type;
@@ -1355,7 +1354,7 @@ again:
 				    MGS_BULK_PORTAL);
 	if (desc = NULL) {
 		rc = -ENOMEM;
-		goto out;
+		goto finish_request;
 	}
 
 	for (i = 0; i < nrpages; i++)
@@ -1364,12 +1363,12 @@ again:
 	ptlrpc_request_set_replen(req);
 	rc = ptlrpc_queue_wait(req);
 	if (rc)
-		goto out;
+		goto finish_request;
 
 	res = req_capsule_server_get(&req->rq_pill, &RMF_MGS_CONFIG_RES);
 	if (res->mcr_size < res->mcr_offset) {
 		rc = -EINVAL;
-		goto out;
+		goto finish_request;
 	}
 
 	/* always update the index even though it might have errors with
@@ -1383,18 +1382,18 @@ again:
 	ealen = sptlrpc_cli_unwrap_bulk_read(req, req->rq_bulk, 0);
 	if (ealen < 0) {
 		rc = ealen;
-		goto out;
+		goto finish_request;
 	}
 
 	if (ealen > nrpages << PAGE_CACHE_SHIFT) {
 		rc = -EINVAL;
-		goto out;
+		goto finish_request;
 	}
 
 	if (ealen = 0) { /* no logs transferred */
 		if (!eof)
 			rc = -EINVAL;
-		goto out;
+		goto finish_request;
 	}
 
 	mne_swab = !!ptlrpc_rep_need_swab(req);
@@ -1424,22 +1423,18 @@ again:
 
 		ealen -= PAGE_CACHE_SIZE;
 	}
-
-out:
-	if (req)
-		ptlrpc_req_finished(req);
+finish_request:
+	ptlrpc_req_finished(req);
 
 	if (rc = 0 && !eof)
 		goto again;
-
-	if (pages) {
-		for (i = 0; i < nrpages; i++) {
-			if (pages[i] = NULL)
-				break;
-			__free_page(pages[i]);
-		}
-		kfree(pages);
+free_pages:
+	for (i = 0; i < nrpages; i++) {
+		if (!(pages[i]))
+			break;
+		__free_page(pages[i]);
 	}
+	kfree(pages);
 	return rc;
 }
 
-- 
2.6.3

