From: Colin King <colin.king@canonical.com>
Date: Mon, 14 Oct 2019 12:56:28 +0000
Subject: [PATCH] scsi: aic7xxx: fix unintended sign extension on left shifts
Message-Id: <20191014125628.30856-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181025151334.15622-1-colin.king@canonical.com>
In-Reply-To: <20181025151334.15622-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Reinecke <hare@suse.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Shifting a u8 left will cause the value to be promoted to an integer. If
the top bit of the u8 is set then the following conversion to an u64 will
sign extend the value causing the upper 32 bits to be set in the result.

Fix this by casting the u8 value to a u64 before the shift.  The commit
this fixes is pre-git history.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/aic7xxx/aic79xx_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/aic7xxx/aic79xx_core.c b/drivers/scsi/aic7xxx/aic79xx_core.c
index 7e5044bf05c0..fa440c1b9baa 100644
--- a/drivers/scsi/aic7xxx/aic79xx_core.c
+++ b/drivers/scsi/aic7xxx/aic79xx_core.c
@@ -622,7 +622,7 @@ ahd_inq(struct ahd_softc *ahd, u_int port)
 	return ((ahd_inb(ahd, port))
 	      | (ahd_inb(ahd, port+1) << 8)
 	      | (ahd_inb(ahd, port+2) << 16)
-	      | (ahd_inb(ahd, port+3) << 24)
+	      | (((uint64_t)ahd_inb(ahd, port+3)) << 24)
 	      | (((uint64_t)ahd_inb(ahd, port+4)) << 32)
 	      | (((uint64_t)ahd_inb(ahd, port+5)) << 40)
 	      | (((uint64_t)ahd_inb(ahd, port+6)) << 48)
-- 
2.20.1
