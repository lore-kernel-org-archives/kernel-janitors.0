From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 28 Sep 2015 09:56:36 +0000
Subject: [patch] mfd: 64 bit bug in bxtwc_val_store()
Message-Id: <20150928095636.GB11367@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The call to kstrtoul() will corrupt memory on 64 bit systems because an
int is 4 bytes and a long is 8.

Also it's not a good idea to let users trigger a dev_err() because it
just ends up flooding /var/log/messages so I removed the printk.

Fixes: 2ddd2086ea9c ('mfd: add Intel Broxton Whiskey Cove PMIC driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mfd/intel_soc_pmic_bxtwc.c b/drivers/mfd/intel_soc_pmic_bxtwc.c
index 40acaff..b942876 100644
--- a/drivers/mfd/intel_soc_pmic_bxtwc.c
+++ b/drivers/mfd/intel_soc_pmic_bxtwc.c
@@ -297,10 +297,9 @@ static ssize_t bxtwc_val_store(struct device *dev,
 	unsigned int val;
 	struct intel_soc_pmic *pmic = dev_get_drvdata(dev);
 
-	if (kstrtoul(buf, 0, (unsigned long *)&val)) {
-		dev_err(dev, "Invalid register value\n");
-		return -EINVAL;
-	}
+	ret = kstrtouint(buf, 0, &val);
+	if (ret)
+		return ret;
 
 	ret = regmap_write(pmic->regmap, bxtwc_reg_addr, val);
 	if (ret) {
