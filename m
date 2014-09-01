From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 01 Sep 2014 20:21:10 +0000
Subject: [PATCH 2/2] staging: lustre: ldlm: simplify rc initialization
Message-Id: <1409602870-4642-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, "Dilger, Andreas" <andreas.dilger@intel.com>, "Drokin, Oleg" <oleg.drokin@intel.com>, Peng Tao <bergwolf@gmail.com>

From: Julia Lawall <Julia.Lawall@lip6.fr>

Simplify initialization of rc to take advantage of the fact that it is done
at statement level.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/ldlm/ldlm_request.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/lustre/lustre/ldlm/ldlm_request.c b/drivers/staging/lustre/lustre/ldlm/ldlm_request.c
index 655a1c7..9ce437b 100644
--- a/drivers/staging/lustre/lustre/ldlm/ldlm_request.c
+++ b/drivers/staging/lustre/lustre/ldlm/ldlm_request.c
@@ -569,7 +569,8 @@ int ldlm_cli_enqueue_fini(struct obd_export *exp, struct ptlrpc_request *req,
 		if (lvb_len != 0)
 			rc = ldlm_fill_lvb(lock, &req->rq_pill, RCL_SERVER,
 					   lvb, size);
-		rc = (rc != 0 ? rc : ELDLM_LOCK_ABORTED);
+		if (rc = 0)
+			rc = ELDLM_LOCK_ABORTED;
 		goto cleanup;
 	}
 

