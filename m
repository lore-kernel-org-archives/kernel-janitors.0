From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Nov 2013 08:04:20 +0000
Subject: [patch] mfd: pm8921: potential NULL dereference in pm8921_remove()
Message-Id: <20131107080420.GP21844@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Brown <davidb@codeaurora.org>, Abhijeet Dharmapurikar <adharmap@codeaurora.org>
Cc: Daniel Walker <dwalker@fifo99.com>, Bryan Huntsman <bryanh@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org

We assume that "pmic" could be NULL and then dereference it two lines
later.  I fix this by moving the dereference inside the NULL check.

Fixes: c013f0a56c56 ('mfd: Add pm8xxx irq support')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mfd/pm8921-core.c b/drivers/mfd/pm8921-core.c
index a6841f7..484fe66 100644
--- a/drivers/mfd/pm8921-core.c
+++ b/drivers/mfd/pm8921-core.c
@@ -171,11 +171,12 @@ static int pm8921_remove(struct platform_device *pdev)
 	drvdata = platform_get_drvdata(pdev);
 	if (drvdata)
 		pmic = drvdata->pm_chip_data;
-	if (pmic)
+	if (pmic) {
 		mfd_remove_devices(pmic->dev);
-	if (pmic->irq_chip) {
-		pm8xxx_irq_exit(pmic->irq_chip);
-		pmic->irq_chip = NULL;
+		if (pmic->irq_chip) {
+			pm8xxx_irq_exit(pmic->irq_chip);
+			pmic->irq_chip = NULL;
+		}
 	}
 
 	return 0;
