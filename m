From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Mar 2017 07:51:50 +0000
Subject: [patch] staging/atomisp: silence uninitialized variable warnings
Message-Id: <20170314075150.GA6111@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Alan Cox <alan@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

These print an uninitialized value for "opt".  Let's just remove the
printk.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_drvfs.c b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_drvfs.c
index 327a5c535fab..7f7c6d5133d2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_drvfs.c
+++ b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_drvfs.c
@@ -128,11 +128,9 @@ static ssize_t iunit_dbgfun_store(struct device_driver *drv, const char *buf,
 	unsigned int opt;
 	int ret;
 
-	if (kstrtouint(buf, 10, &opt)) {
-		dev_err(atomisp_dev, "%s setting %d value invalid\n",
-			__func__, opt);
-		return -EINVAL;
-	}
+	ret = kstrtouint(buf, 10, &opt);
+	if (ret)
+		return ret;
 
 	ret = atomisp_set_css_dbgfunc(iunit_debug.isp, opt);
 	if (ret)
@@ -154,11 +152,9 @@ static ssize_t iunit_dbgopt_store(struct device_driver *drv, const char *buf,
 	unsigned int opt;
 	int ret;
 
-	if (kstrtouint(buf, 10, &opt)) {
-		dev_err(atomisp_dev, "%s setting %d value invalid\n",
-			__func__, opt);
-		return -EINVAL;
-	}
+	ret = kstrtouint(buf, 10, &opt);
+	if (ret)
+		return ret;
 
 	iunit_debug.dbgopt = opt;
 	ret = iunit_dump_dbgopt(iunit_debug.isp, iunit_debug.dbgopt);
