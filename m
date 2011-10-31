From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 31 Oct 2011 07:03:15 +0000
Subject: [patch] target: blk_make_request() returns an ERR_PTR()
Message-Id: <20111031070315.GA13640@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

The check is wrong here because blk_make_request() returns an
ERR_PTR() and it doesn't return NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/target/target_core_pscsi.c b/drivers/target/target_core_pscsi.c
index b452efe..ed32e1e 100644
--- a/drivers/target/target_core_pscsi.c
+++ b/drivers/target/target_core_pscsi.c
@@ -1092,7 +1092,7 @@ static int pscsi_do_task(struct se_task *task)
 
 		req = blk_make_request(pdv->pdv_sd->request_queue, hbio,
 				       GFP_KERNEL);
-		if (!req) {
+		if (IS_ERR(req)) {
 			pr_err("pSCSI: blk_make_request() failed\n");
 			goto fail;
 		}
