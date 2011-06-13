From: Dan Carpenter <error27@gmail.com>
Date: Mon, 13 Jun 2011 20:07:11 +0000
Subject: [patch 1/4] SCSI: target: dereferencing ERR_PTRs
Message-Id: <20110613200711.GH3583@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: James Bottomley <jbottomley@parallels.com>, Kiran Patil <kiran.patil@intel.com>, Yi Zou <yi.zou@intel.com>, Joe Eykholt <jeykholt@cisco.com>, "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>, kernel-janitors@vger.kernel.org

transport_init_session() and core_tmr_alloc_req() never return NULL,
they only return ERR_PTRs on error.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/target/tcm_fc/tfc_sess.c b/drivers/target/tcm_fc/tfc_sess.c
index a3bd57f..03744c2 100644
--- a/drivers/target/tcm_fc/tfc_sess.c
+++ b/drivers/target/tcm_fc/tfc_sess.c
@@ -229,7 +229,7 @@ static struct ft_sess *ft_sess_create(struct ft_tport *tport, u32 port_id,
 		return NULL;
 
 	sess->se_sess = transport_init_session();
-	if (!sess->se_sess) {
+	if (IS_ERR(sess->se_sess)) {
 		kfree(sess);
 		return NULL;
 	}
diff --git a/drivers/target/loopback/tcm_loop.c b/drivers/target/loopback/tcm_loop.c
index dee2a2c..7329d0e 100644
--- a/drivers/target/loopback/tcm_loop.c
+++ b/drivers/target/loopback/tcm_loop.c
@@ -386,7 +386,7 @@ static int tcm_loop_device_reset(struct scsi_cmnd *sc)
 	 */
 	se_cmd->se_tmr_req = core_tmr_alloc_req(se_cmd, (void *)tl_tmr,
 				TMR_LUN_RESET);
-	if (!se_cmd->se_tmr_req)
+	if (IS_ERR(se_cmd->se_tmr_req))
 		goto release;
 	/*
 	 * Locate the underlying TCM struct se_lun from sc->device->lun
@@ -1033,7 +1033,7 @@ static int tcm_loop_make_nexus(
 	 * Initialize the struct se_session pointer
 	 */
 	tl_nexus->se_sess = transport_init_session();
-	if (!tl_nexus->se_sess)
+	if (IS_ERR(tl_nexus->se_sess))
 		goto out;
 	/*
 	 * Since we are running in 'demo mode' this call with generate a
