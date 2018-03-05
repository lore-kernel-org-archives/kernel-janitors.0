From: Thomas Avery <tavery321@gmail.com>
Date: Mon, 05 Mar 2018 19:33:49 +0000
Subject: [PATCH] staging: lustre: Remove yield() call
Message-Id: <20180305193349.nqygghai7mz72rbr@debian>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove yield() call. In this case it's use is considered broken, since
it is being assumed that yield() will let another process run that will
make the event true. 

Signed-off-by: Thomas Avery <tavery321@gmail.com>
---
 drivers/staging/lustre/lustre/obdclass/obd_config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/lustre/lustre/obdclass/obd_config.c b/drivers/staging/lustre/lustre/obdclass/obd_config.c
index 997c0f9aafb5..277576b586db 100644
--- a/drivers/staging/lustre/lustre/obdclass/obd_config.c
+++ b/drivers/staging/lustre/lustre/obdclass/obd_config.c
@@ -455,7 +455,7 @@ static int class_cleanup(struct obd_device *obd, struct lustre_cfg *lcfg)
 	spin_unlock(&obd->obd_dev_lock);
 
 	while (obd->obd_conn_inprogress > 0)
-		yield();
+		cond_resched();
 	smp_rmb();
 
 	if (lcfg->lcfg_bufcount >= 2 && LUSTRE_CFG_BUFLEN(lcfg, 1) > 0) {
-- 
2.11.0

