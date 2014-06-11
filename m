From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jun 2014 10:17:41 +0000
Subject: [patch v2] mfd: vexpress: fix error handling vexpress_syscfg_regmap_init()
Message-Id: <20140611101740.GA13148@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1402478542.3523.9.camel@hornet>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This function should be returning an ERR_PTR() on failure instead of
NULL.  Also there is a use after free bug if regmap_init() fails because
we free "func" and then dereference doing the return.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/vexpress-syscfg.c b/drivers/misc/vexpress-syscfg.c
index 73068e5..3250fc1 100644
--- a/drivers/misc/vexpress-syscfg.c
+++ b/drivers/misc/vexpress-syscfg.c
@@ -199,7 +199,7 @@ static struct regmap *vexpress_syscfg_regmap_init(struct device *dev,
 	func = kzalloc(sizeof(*func) + sizeof(*func->template) * num,
 			GFP_KERNEL);
 	if (!func)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	func->syscfg = syscfg;
 	func->num_templates = num;
@@ -231,10 +231,14 @@ static struct regmap *vexpress_syscfg_regmap_init(struct device *dev,
 	func->regmap = regmap_init(dev, NULL, func,
 			&vexpress_syscfg_regmap_config);
 
-	if (IS_ERR(func->regmap))
+	if (IS_ERR(func->regmap)) {
+		void *err = func->regmap;
+
 		kfree(func);
-	else
-		list_add(&func->list, &syscfg->funcs);
+		return err;
+	}
+
+	list_add(&func->list, &syscfg->funcs);
 
 	return func->regmap;
 }
