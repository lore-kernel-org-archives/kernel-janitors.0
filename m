From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jun 2014 06:07:25 +0000
Subject: [patch] mfd: vexpress: use after free in vexpress_syscfg_regmap_init()
Message-Id: <20140611060725.GC7569@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Lee Jones <lee.jones@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We should return NULL if regmap_init() fails instead of continuing.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/vexpress-syscfg.c b/drivers/misc/vexpress-syscfg.c
index 73068e5..2c0ddb2 100644
--- a/drivers/misc/vexpress-syscfg.c
+++ b/drivers/misc/vexpress-syscfg.c
@@ -231,10 +231,12 @@ static struct regmap *vexpress_syscfg_regmap_init(struct device *dev,
 	func->regmap = regmap_init(dev, NULL, func,
 			&vexpress_syscfg_regmap_config);
 
-	if (IS_ERR(func->regmap))
+	if (IS_ERR(func->regmap)) {
 		kfree(func);
-	else
-		list_add(&func->list, &syscfg->funcs);
+		return NULL;
+	}
+
+	list_add(&func->list, &syscfg->funcs);
 
 	return func->regmap;
 }
