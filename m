From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Dec 2018 06:00:46 +0000
Subject: [PATCH v3] ptp: fix an IS_ERR() vs NULL check
Message-Id: <20181207060046.GA3943@unbuntlaptop>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20181206135719.GA18607@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

We recently modified pps_register_source() to return error pointers
instead of NULL but it seems like there was a merge issue and part of
the commit was lost.  Anyway, the ptp_clock_register() function needs to
be updated to check for IS_ERR() as well.

Fixes: 3b1ad360acad ("pps: using ERR_PTR instead of NULL while pps_register_source fails")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2:  Use the correct Fixes tag.
v3:  Add Greg to the CC list for real this time.

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
