From: Quentin Deslandes <quentin.deslandes@itdev.co.uk>
Date: Thu, 28 Mar 2019 13:11:04 +0000
Subject: [PATCH] scsi: aic79xx: NULL check before some freeing functions is not needed.
Message-Id: <20190328131101.GA21866@qd-ubuntu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Reinecke <hare@suse.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Fix the following coccinelle warning by removing NULL check before
calling kfree:

NULL check before some freeing functions is not needed.

Signed-off-by: Quentin Deslandes <quentin.deslandes@itdev.co.uk>
---
 drivers/scsi/aic7xxx/aic79xx_core.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/scsi/aic7xxx/aic79xx_core.c b/drivers/scsi/aic7xxx/aic79xx_core.c
index 7e5044bf05c0..a61022db43ee 100644
--- a/drivers/scsi/aic7xxx/aic79xx_core.c
+++ b/drivers/scsi/aic7xxx/aic79xx_core.c
@@ -3664,8 +3664,6 @@ ahd_alloc_tstate(struct ahd_softc *ahd, u_int scsi_id, char channel)
 static void
 ahd_free_tstate(struct ahd_softc *ahd, u_int scsi_id, char channel, int force)
 {
-	struct ahd_tmode_tstate *tstate;
-
 	/*
 	 * Don't clean up our "master" tstate.
 	 * It has our default user settings.
@@ -3674,9 +3672,7 @@ ahd_free_tstate(struct ahd_softc *ahd, u_int scsi_id, char channel, int force)
 	 && force == FALSE)
 		return;
 
-	tstate = ahd->enabled_targets[scsi_id];
-	if (tstate != NULL)
-		kfree(tstate);
+	kfree(ahd->enabled_targets[scsi_id]);
 	ahd->enabled_targets[scsi_id] = NULL;
 }
 #endif
@@ -6138,8 +6134,7 @@ ahd_set_unit(struct ahd_softc *ahd, int unit)
 void
 ahd_set_name(struct ahd_softc *ahd, char *name)
 {
-	if (ahd->name != NULL)
-		kfree(ahd->name);
+	kfree(ahd->name);
 	ahd->name = name;
 }
 
@@ -6200,12 +6195,9 @@ ahd_free(struct ahd_softc *ahd)
 		kfree(ahd->black_hole);
 	}
 #endif
-	if (ahd->name != NULL)
-		kfree(ahd->name);
-	if (ahd->seep_config != NULL)
-		kfree(ahd->seep_config);
-	if (ahd->saved_stack != NULL)
-		kfree(ahd->saved_stack);
+	kfree(ahd->name);
+	kfree(ahd->seep_config);
+	kfree(ahd->saved_stack);
 #ifndef __FreeBSD__
 	kfree(ahd);
 #endif
-- 
2.17.1
