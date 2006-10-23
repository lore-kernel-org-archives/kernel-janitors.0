From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 23 Oct 2006 20:15:33 +0000
Subject: [KJ] [Patch] kmemdup() cleanup in drivers/base
Message-Id: <1161634533.419.3.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1161634468.419.1.camel@alice>
In-Reply-To: <1161634468.419.1.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

replace open coded kmemdup() to save some screen space,
and allow inlining/not inlining to be triggered by gcc.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.19-rc2-git7/drivers/base/platform.c.orig	2006-10-23 20:59:48.000000000 +0200
+++ linux-2.6.19-rc2-git7/drivers/base/platform.c	2006-10-23 21:00:56.000000000 +0200
@@ -192,9 +192,8 @@ int platform_device_add_resources(struct
 {
 	struct resource *r;
 
-	r = kmalloc(sizeof(struct resource) * num, GFP_KERNEL);
+	r = kmemdup(res, sizeof(struct resource) * num, GFP_KERNEL);
 	if (r) {
-		memcpy(r, res, sizeof(struct resource) * num);
 		pdev->resource = r;
 		pdev->num_resources = num;
 	}
@@ -216,11 +215,10 @@ int platform_device_add_data(struct plat
 {
 	void *d;
 
-	d = kmalloc(size, GFP_KERNEL);
-	if (d) {
-		memcpy(d, data, size);
+	d = kmemdup(data, size, GFP_KERNEL);
+	if (d)
 		pdev->dev.platform_data = d;
-	}
+	
 	return d ? 0 : -ENOMEM;
 }
 EXPORT_SYMBOL_GPL(platform_device_add_data);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
