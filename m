From: Dan Carpenter <error27@gmail.com>
Date: Fri, 10 Dec 2010 12:38:30 +0000
Subject: [patch] pps: class_create() returns an ERR_PTR
Message-Id: <20101210123830.GA10623@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

class_create() returns an ERR_PTR and it doesn't return NULL.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/pps/pps.c b/drivers/pps/pps.c
index ca5183b..ef88108 100644
--- a/drivers/pps/pps.c
+++ b/drivers/pps/pps.c
@@ -285,9 +285,9 @@ static int __init pps_init(void)
 	int err;
 
 	pps_class = class_create(THIS_MODULE, "pps");
-	if (!pps_class) {
+	if (IS_ERR(pps_class)) {
 		printk(KERN_ERR "pps: failed to allocate class\n");
-		return -ENOMEM;
+		return PTR_ERR(pps_class);
 	}
 	pps_class->dev_attrs = pps_attrs;
 
