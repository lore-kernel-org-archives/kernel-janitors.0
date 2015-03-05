From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Mar 2015 11:24:17 +0000
Subject: [patch] xen/mce: fix up xen_late_init_mcelog() error handling
Message-Id: <20150305112417.GA13378@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Static checkers complain about the missing call to misc_deregister() if
bind_virq_for_mce() fails.

Also I reversed the tests so that we do error handling instead of
success handling.  That way we just have a series of function calls
instead of the more complicated nested if statements in the original
code.  Let's preserve the error codes as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/xen/mcelog.c b/drivers/xen/mcelog.c
index 6ab6a79..a493c7315 100644
--- a/drivers/xen/mcelog.c
+++ b/drivers/xen/mcelog.c
@@ -393,14 +393,25 @@ static int bind_virq_for_mce(void)
 
 static int __init xen_late_init_mcelog(void)
 {
+	int ret;
+
 	/* Only DOM0 is responsible for MCE logging */
-	if (xen_initial_domain()) {
-		/* register character device /dev/mcelog for xen mcelog */
-		if (misc_register(&xen_mce_chrdev_device))
-			return -ENODEV;
-		return bind_virq_for_mce();
-	}
+	if (!xen_initial_domain())
+		return -ENODEV;
+
+	/* register character device /dev/mcelog for xen mcelog */
+	ret = misc_register(&xen_mce_chrdev_device);
+	if (ret)
+		return ret;
+
+	ret = bind_virq_for_mce();
+	if (ret)
+		goto deregister;
 
-	return -ENODEV;
+	return 0;
+
+deregister:
+	misc_deregister(&xen_mce_chrdev_device);
+	return ret;
 }
 device_initcall(xen_late_init_mcelog);
