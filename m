From: Dan Carpenter <error27@gmail.com>
Date: Thu, 09 Dec 2010 13:48:20 +0000
Subject: [patch] c2port: class_create() returns an ERR_PTR
Message-Id: <20101209134819.GW10623@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: giometti@linux.it
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

class_create() returns an ERR_PTR and it doesn't return a NULL.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/misc/c2port/core.c b/drivers/misc/c2port/core.c
index 19fc7c1..f428d86 100644
--- a/drivers/misc/c2port/core.c
+++ b/drivers/misc/c2port/core.c
@@ -984,9 +984,9 @@ static int __init c2port_init(void)
 		" - (C) 2007 Rodolfo Giometti\n");
 
 	c2port_class = class_create(THIS_MODULE, "c2port");
-	if (!c2port_class) {
+	if (IS_ERR(c2port_class)) {
 		printk(KERN_ERR "c2port: failed to allocate class\n");
-		return -ENOMEM;
+		return PTR_ERR(c2port_class);
 	}
 	c2port_class->dev_attrs = c2port_attrs;
 
