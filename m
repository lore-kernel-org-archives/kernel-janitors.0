From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 Oct 2015 10:18:05 +0000
Subject: [patch] mfd: arizona: signedness bug in arizona_runtime_suspend()
Message-Id: <20151019101805.GE26688@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The "jd_active" variable needs to be signed for the error handling to
work.

Fixes: 143e5887ae57 ('mfd: arizona: factor out checking of jack detection state')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
index 4e49210..d474732 100644
--- a/drivers/mfd/arizona-core.c
+++ b/drivers/mfd/arizona-core.c
@@ -628,7 +628,7 @@ err:
 static int arizona_runtime_suspend(struct device *dev)
 {
 	struct arizona *arizona = dev_get_drvdata(dev);
-	unsigned int jd_active = 0;
+	int jd_active = 0;
 	int ret;
 
 	dev_dbg(arizona->dev, "Entering AoD mode\n");
