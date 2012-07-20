From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Jul 2012 11:30:57 +0000
Subject: [patch] [SCSI] aic79xx: NULL dereference in debug code
Message-Id: <20120720113057.GC22245@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Reinecke <hare@suse.de>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"ahd" can be NULL here and it gets dereferenced inside the call to
ahd_name().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/aic7xxx/aic79xx_core.c b/drivers/scsi/aic7xxx/aic79xx_core.c
index 25417d0..5db8925 100644
--- a/drivers/scsi/aic7xxx/aic79xx_core.c
+++ b/drivers/scsi/aic7xxx/aic79xx_core.c
@@ -6120,7 +6120,8 @@ ahd_alloc(void *platform_arg, char *name)
 #ifdef AHD_DEBUG
 	if ((ahd_debug & AHD_SHOW_MEMORY) != 0) {
 		printk("%s: scb size = 0x%x, hscb size = 0x%x\n",
-		       ahd_name(ahd), (u_int)sizeof(struct scb),
+		       ahd ? ahd_name(ahd) : "(null)",
+		       (u_int)sizeof(struct scb),
 		       (u_int)sizeof(struct hardware_scb));
 	}
 #endif
