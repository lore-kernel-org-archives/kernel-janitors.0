From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Nov 2018 12:58:34 +0000
Subject: [PATCH] ptp: fix an IS_ERR() vs NULL check
Message-Id: <20181130125834.u42dhxgof66rhya2@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The pps_register_source() function doesn't return NULL, it returns
error pointers.

Fixes: d94ba80ebbea ("ptp: Added a brand new class driver for ptp clocks.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/ptp/ptp_clock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ptp/ptp_clock.c b/drivers/ptp/ptp_clock.c
index 8a81eecc0ecd..48f3594a7458 100644
--- a/drivers/ptp/ptp_clock.c
+++ b/drivers/ptp/ptp_clock.c
@@ -265,8 +265,8 @@ struct ptp_clock *ptp_clock_register(struct ptp_clock_info *info,
 		pps.mode = PTP_PPS_MODE;
 		pps.owner = info->owner;
 		ptp->pps_source = pps_register_source(&pps, PTP_PPS_DEFAULTS);
-		if (!ptp->pps_source) {
-			err = -EINVAL;
+		if (IS_ERR(ptp->pps_source)) {
+			err = PTR_ERR(ptp->pps_source);
 			pr_err("failed to register pps source\n");
 			goto no_pps;
 		}
-- 
2.11.0
