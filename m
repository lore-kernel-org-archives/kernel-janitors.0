From: Colin King <colin.king@canonical.com>
Date: Wed, 20 Nov 2019 13:50:31 +0000
Subject: [PATCH][next] scsi: pm80xx: fix logic to break out of loop when register value is 2 or 3
Message-Id: <20191120135031.270708-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Wang <jinpu.wang@cloud.ionos.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Deepak Ukey <Deepak.Ukey@microchip.com>, Viswas G <Viswas.G@microchip.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The condition (reg_val != 2) || (reg_val != 3) will always be true because
reg_val cannot be equal to two different values at the same time. Fix this
by replacing the || operator with && so that the loop will loop if reg_val
is not a 2 and not a 3 as was originally intended.

Addresses-Coverity: ("Constant expression result")
Fixes: 50dc2f221455 ("scsi: pm80xx: Modified the logic to collect fatal dump")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/pm8001/pm80xx_hwi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/pm8001/pm80xx_hwi.c b/drivers/scsi/pm8001/pm80xx_hwi.c
index 19601138e889..d41908b23760 100644
--- a/drivers/scsi/pm8001/pm80xx_hwi.c
+++ b/drivers/scsi/pm8001/pm80xx_hwi.c
@@ -348,7 +348,7 @@ ssize_t pm80xx_get_fatal_dump(struct device *cdev,
 			do {
 				reg_val = pm8001_mr32(fatal_table_address,
 					MPI_FATAL_EDUMP_TABLE_STATUS);
-			} while (((reg_val != 2) || (reg_val != 3)) &&
+			} while (((reg_val != 2) && (reg_val != 3)) &&
 					time_before(jiffies, start));
 
 			if (reg_val < 2) {
-- 
2.24.0
