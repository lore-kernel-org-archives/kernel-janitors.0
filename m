From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 09 May 2020 10:04:08 +0000
Subject: [PATCH] scsi: scsi_debug: fix an error handling bug in sdeb_zbc_model_str()
Message-Id: <20200509100408.GA5555@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <jejb@linux.ibm.com>, Douglas Gilbert <dgilbert@interlog.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

This test is checking the wrong variable.  It should be testing "ret".
The "sdeb_zbc_model" variable is an enum (unsigned in this situation)
and we never assign negative values to it.

Fixes: 9267e0eb41fe ("scsi: scsi_debug: Add ZBC module parameter")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/scsi_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
index 105e563d87b4e..73847366dc495 100644
--- a/drivers/scsi/scsi_debug.c
+++ b/drivers/scsi/scsi_debug.c
@@ -6460,7 +6460,7 @@ static int sdeb_zbc_model_str(const char *cp)
 		res = sysfs_match_string(zbc_model_strs_b, cp);
 		if (res < 0) {
 			res = sysfs_match_string(zbc_model_strs_c, cp);
-			if (sdeb_zbc_model < 0)
+			if (res < 0)
 				return -EINVAL;
 		}
 	}
-- 
2.26.2
