From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Mar 2016 10:09:41 +0000
Subject: [patch] tcm_loop: use after free on error
Message-Id: <20160302100941.GE5533@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, Christoph Hellwig <hch@lst.de>
Cc: Hannes Reinecke <hare@suse.de>, Bart Van Assche <bart.vanassche@sandisk.com>, Sheng Yang <sheng@yasker.org>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We dereference "tl_nexus" to get the error code.

Fixes: 1b418a8fcbc0 ('target: Convert demo-mode only drivers to target_alloc_session')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/target/loopback/tcm_loop.c b/drivers/target/loopback/tcm_loop.c
index 0216c75..e0ffb03 100644
--- a/drivers/target/loopback/tcm_loop.c
+++ b/drivers/target/loopback/tcm_loop.c
@@ -808,6 +808,7 @@ static int tcm_loop_make_nexus(
 {
 	struct tcm_loop_hba *tl_hba = tl_tpg->tl_hba;
 	struct tcm_loop_nexus *tl_nexus;
+	int ret;
 
 	if (tl_tpg->tl_nexus) {
 		pr_debug("tl_tpg->tl_nexus already exists\n");
@@ -824,8 +825,9 @@ static int tcm_loop_make_nexus(
 					TARGET_PROT_DIN_PASS | TARGET_PROT_DOUT_PASS,
 					name, tl_nexus, NULL);
 	if (IS_ERR(tl_nexus->se_sess)) {
+		ret = PTR_ERR(tl_nexus->se_sess);
 		kfree(tl_nexus);
-		return PTR_ERR(tl_nexus->se_sess);
+		return ret;
 	}
 
 	tl_tpg->tl_nexus = tl_nexus;
