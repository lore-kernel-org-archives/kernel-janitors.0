From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Apr 2013 05:02:53 +0000
Subject: [patch] reset: NULL deref on allocation failure
Message-Id: <20130403050253.GA31179@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"rstc" is NULL here and we should use "rcdev" instead of "rstc->rcdev".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index a258277..d1b6089 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -181,7 +181,7 @@ struct reset_control *reset_control_get(struct device *dev, const char *id)
 
 	rstc = kzalloc(sizeof(*rstc), GFP_KERNEL);
 	if (!rstc) {
-		module_put(rstc->rcdev->owner);
+		module_put(rcdev->owner);
 		return ERR_PTR(-ENOMEM);
 	}
 
