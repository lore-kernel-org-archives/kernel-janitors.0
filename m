From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 03 May 2015 14:07:19 +0000
Subject: [PATCH 3/3 v2] staging: lustre: ptlrpc: service: Replace OBD_CPT_ALLOC etc by kzalloc_node
Message-Id: <1430662039-26557-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430662039-26557-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1430662039-26557-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Replace OBD_CPT_ALLOC, OBD_CPT_ALLOC_PTR, and OBD_CPT_ALLOC_GFP by
corresponding calls to kzalloc_node.  The semantic patch for the
OBD_CPT_ALLOC case is as follows: (http://coccinelle.lip6.fr/).

// <smpl>
@@ expression ptr,cptab,cpt,size; @@
- OBD_CPT_ALLOC(ptr, cptab, cpt, size)
+ ptr = kzalloc_node(size, GFP_NOFS, cfs_cpt_spread_node(cptab, cpt))
// </smpl>

Note that the original OBD macros would check if the cptab argument was
NULL and fall back on kzalloc in that case.  Oleg Drokin argues that this
test is not needed because the code containing these calls is only invoked
after initialization has been completed, in which case the possible cptab
arguments are not NULL.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---

v2: improve the subject line

 drivers/staging/lustre/lustre/ptlrpc/service.c |   27 ++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/lustre/lustre/ptlrpc/service.c b/drivers/staging/lustre/lustre/ptlrpc/service.c
index d85db06..3fa52f1 100644
--- a/drivers/staging/lustre/lustre/ptlrpc/service.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/service.c
@@ -75,7 +75,9 @@ ptlrpc_alloc_rqbd(struct ptlrpc_service_part *svcpt)
 	struct ptlrpc_service		  *svc = svcpt->scp_service;
 	struct ptlrpc_request_buffer_desc *rqbd;
 
-	OBD_CPT_ALLOC_PTR(rqbd, svc->srv_cptable, svcpt->scp_cpt);
+	rqbd = kzalloc_node(sizeof(*rqbd), GFP_NOFS,
+			    cfs_cpt_spread_node(svc->srv_cptable,
+						svcpt->scp_cpt));
 	if (rqbd = NULL)
 		return NULL;
 
@@ -630,16 +632,18 @@ ptlrpc_service_part_init(struct ptlrpc_service *svc,
 	array->paa_deadline = -1;
 
 	/* allocate memory for scp_at_array (ptlrpc_at_array) */
-	OBD_CPT_ALLOC(array->paa_reqs_array,
-		      svc->srv_cptable, cpt, sizeof(struct list_head) * size);
+	array->paa_reqs_array +		kzalloc_node(sizeof(struct list_head) * size, GFP_NOFS,
+			     cfs_cpt_spread_node(svc->srv_cptable, cpt));
 	if (array->paa_reqs_array = NULL)
 		return -ENOMEM;
 
 	for (index = 0; index < size; index++)
 		INIT_LIST_HEAD(&array->paa_reqs_array[index]);
 
-	OBD_CPT_ALLOC(array->paa_reqs_count,
-		      svc->srv_cptable, cpt, sizeof(__u32) * size);
+	array->paa_reqs_count +		kzalloc_node(sizeof(__u32) * size, GFP_NOFS,
+			     cfs_cpt_spread_node(svc->srv_cptable, cpt));
 	if (array->paa_reqs_count = NULL)
 		goto free_reqs_array;
 
@@ -772,7 +776,8 @@ ptlrpc_register_service(struct ptlrpc_service_conf *conf,
 		else
 			cpt = cpts != NULL ? cpts[i] : i;
 
-		OBD_CPT_ALLOC(svcpt, cptable, cpt, sizeof(*svcpt));
+		svcpt = kzalloc_node(sizeof(*svcpt), GFP_NOFS,
+				     cfs_cpt_spread_node(cptable, cpt));
 		if (svcpt = NULL) {
 			rc = -ENOMEM;
 			goto failed;
@@ -2664,7 +2669,9 @@ int ptlrpc_start_thread(struct ptlrpc_service_part *svcpt, int wait)
 	     svcpt->scp_nthrs_running = svc->srv_nthrs_cpt_init - 1))
 		return -EMFILE;
 
-	OBD_CPT_ALLOC_PTR(thread, svc->srv_cptable, svcpt->scp_cpt);
+	thread = kzalloc_node(sizeof(*thread), GFP_NOFS,
+			      cfs_cpt_spread_node(svc->srv_cptable,
+						  svcpt->scp_cpt));
 	if (thread = NULL)
 		return -ENOMEM;
 	init_waitqueue_head(&thread->t_ctl_waitq);
@@ -2774,8 +2781,10 @@ int ptlrpc_hr_init(void)
 		hrp->hrp_nthrs /= weight;
 
 		LASSERT(hrp->hrp_nthrs > 0);
-		OBD_CPT_ALLOC(hrp->hrp_thrs, ptlrpc_hr.hr_cpt_table, i,
-			      hrp->hrp_nthrs * sizeof(*hrt));
+		hrp->hrp_thrs +			kzalloc_node(hrp->hrp_nthrs * sizeof(*hrt), GFP_NOFS,
+				cfs_cpt_spread_node(ptlrpc_hr.hr_cpt_table,
+						    i));
 		if (hrp->hrp_thrs = NULL) {
 			rc = -ENOMEM;
 			goto out;

