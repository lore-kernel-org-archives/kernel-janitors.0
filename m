From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 03 May 2015 14:07:17 +0000
Subject: [PATCH 1/3 v2] staging: lustre: ptlrpc: nrs: Replace OBD_CPT_ALLOC etc by kzalloc_node
Message-Id: <1430662039-26557-2-git-send-email-Julia.Lawall@lip6.fr>
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

 drivers/staging/lustre/lustre/ptlrpc/nrs.c |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/lustre/lustre/ptlrpc/nrs.c b/drivers/staging/lustre/lustre/ptlrpc/nrs.c
index 68c754f..63a05f4 100644
--- a/drivers/staging/lustre/lustre/ptlrpc/nrs.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/nrs.c
@@ -746,8 +746,9 @@ static int nrs_policy_register(struct ptlrpc_nrs *nrs,
 	LASSERT(desc->pd_ops->op_req_dequeue != NULL);
 	LASSERT(desc->pd_compat != NULL);
 
-	OBD_CPT_ALLOC_GFP(policy, svcpt->scp_service->srv_cptable,
-			  svcpt->scp_cpt, sizeof(*policy), GFP_NOFS);
+	policy = kzalloc_node(sizeof(*policy), GFP_NOFS,
+			cfs_cpt_spread_node(svcpt->scp_service->srv_cptable,
+					    svcpt->scp_cpt));
 	if (policy = NULL)
 		return -ENOMEM;
 
@@ -961,9 +962,10 @@ static int nrs_svcpt_setup_locked(struct ptlrpc_service_part *svcpt)
 	if (svcpt->scp_service->srv_ops.so_hpreq_handler = NULL)
 		goto out;
 
-	OBD_CPT_ALLOC_PTR(svcpt->scp_nrs_hp,
-			  svcpt->scp_service->srv_cptable,
-			  svcpt->scp_cpt);
+	svcpt->scp_nrs_hp +		kzalloc_node(sizeof(*svcpt->scp_nrs_hp), GFP_NOFS,
+			cfs_cpt_spread_node(svcpt->scp_service->srv_cptable,
+					    svcpt->scp_cpt));
 	if (svcpt->scp_nrs_hp = NULL) {
 		rc = -ENOMEM;
 		goto out;

