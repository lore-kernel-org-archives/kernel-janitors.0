From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 19:37:47 +0000
Subject: [PATCH 20/20] staging: lustre: ptlrpc: service: remove unneeded null test before free
Message-Id: <1430509086-22132-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430509086-22132-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1430509086-22132-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Kfree can cope with a null argument, so drop null tests.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression ptr; @@

- if (ptr != NULL)
  kfree(ptr);

@@ expression ptr; @@

- if (ptr != NULL) {
  kfree(ptr);
  ptr = NULL;
- }
// </smpl>

In the first case, specific labels are introduced to free only what is needed.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/ptlrpc/service.c |   39 ++++++++-----------------
 1 file changed, 14 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/lustre/lustre/ptlrpc/service.c b/drivers/staging/lustre/lustre/ptlrpc/service.c
index d0758ab..d85db06 100644
--- a/drivers/staging/lustre/lustre/ptlrpc/service.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/service.c
@@ -641,7 +641,7 @@ ptlrpc_service_part_init(struct ptlrpc_service *svc,
 	OBD_CPT_ALLOC(array->paa_reqs_count,
 		      svc->srv_cptable, cpt, sizeof(__u32) * size);
 	if (array->paa_reqs_count = NULL)
-		goto failed;
+		goto free_reqs_array;
 
 	cfs_timer_init(&svcpt->scp_at_timer, ptlrpc_at_timer, svcpt);
 	/* At SOW, service time should be quick; 10s seems generous. If client
@@ -655,20 +655,16 @@ ptlrpc_service_part_init(struct ptlrpc_service *svc,
 	/* We shouldn't be under memory pressure at startup, so
 	 * fail if we can't allocate all our buffers at this time. */
 	if (rc != 0)
-		goto failed;
+		goto free_reqs_count;
 
 	return 0;
 
- failed:
-	if (array->paa_reqs_count != NULL) {
-		kfree(array->paa_reqs_count);
-		array->paa_reqs_count = NULL;
-	}
-
-	if (array->paa_reqs_array != NULL) {
-		kfree(array->paa_reqs_array);
-		array->paa_reqs_array = NULL;
-	}
+free_reqs_count:
+	kfree(array->paa_reqs_count);
+	array->paa_reqs_count = NULL;
+free_reqs_array:
+	kfree(array->paa_reqs_array);
+	array->paa_reqs_array = NULL;
 
 	return -ENOMEM;
 }
@@ -722,8 +718,7 @@ ptlrpc_register_service(struct ptlrpc_service_conf *conf,
 			if (rc <= 0) {
 				CERROR("%s: failed to parse CPT array %s: %d\n",
 				       conf->psc_name, cconf->cc_pattern, rc);
-				if (cpts != NULL)
-					kfree(cpts);
+				kfree(cpts);
 				return ERR_PTR(rc < 0 ? rc : -EINVAL);
 			}
 			ncpts = rc;
@@ -733,8 +728,7 @@ ptlrpc_register_service(struct ptlrpc_service_conf *conf,
 	service = kzalloc(offsetof(struct ptlrpc_service, srv_parts[ncpts]),
 			  GFP_NOFS);
 	if (service = NULL) {
-		if (cpts != NULL)
-			kfree(cpts);
+		kfree(cpts);
 		return ERR_PTR(-ENOMEM);
 	}
 
@@ -2997,15 +2991,10 @@ ptlrpc_service_free(struct ptlrpc_service *svc)
 		cfs_timer_disarm(&svcpt->scp_at_timer);
 		array = &svcpt->scp_at_array;
 
-		if (array->paa_reqs_array != NULL) {
-			kfree(array->paa_reqs_array);
-			array->paa_reqs_array = NULL;
-		}
-
-		if (array->paa_reqs_count != NULL) {
-			kfree(array->paa_reqs_count);
-			array->paa_reqs_count = NULL;
-		}
+		kfree(array->paa_reqs_array);
+		array->paa_reqs_array = NULL;
+		kfree(array->paa_reqs_count);
+		array->paa_reqs_count = NULL;
 	}
 
 	ptlrpc_service_for_each_part(svcpt, i, svc)

