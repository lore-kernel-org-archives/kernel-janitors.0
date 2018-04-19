From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Thu, 19 Apr 2018 14:06:12 +0000
Subject: [PATCH 42/61] ptp: simplify getting .drvdata
Message-Id: <20180419140641.27926-43-wsa+renesas@sang-engineering.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org

We should get drvdata from struct device directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy. Please apply individually.

 drivers/ptp/ptp_dte.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/ptp/ptp_dte.c b/drivers/ptp/ptp_dte.c
index 6edd3b9c7f01..5481a27d4fec 100644
--- a/drivers/ptp/ptp_dte.c
+++ b/drivers/ptp/ptp_dte.c
@@ -287,8 +287,7 @@ static int ptp_dte_remove(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int ptp_dte_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct ptp_dte *ptp_dte = platform_get_drvdata(pdev);
+	struct ptp_dte *ptp_dte = dev_get_drvdata(dev);
 	u8 i;
 
 	for (i = 0; i < DTE_NUM_REGS_TO_RESTORE; i++) {
@@ -304,8 +303,7 @@ static int ptp_dte_suspend(struct device *dev)
 
 static int ptp_dte_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct ptp_dte *ptp_dte = platform_get_drvdata(pdev);
+	struct ptp_dte *ptp_dte = dev_get_drvdata(dev);
 	u8 i;
 
 	for (i = 0; i < DTE_NUM_REGS_TO_RESTORE; i++) {
-- 
2.11.0

