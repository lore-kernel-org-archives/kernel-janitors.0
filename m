From: Leonardo Potenza <lpotenza@inwind.it>
Date: Tue, 01 Apr 2008 21:47:09 +0000
Subject: [PATCH] drivers/pcmcia/i82365.c: check request_irq return value
Message-Id: <200804012347.10108.lpotenza@inwind.it>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-pcmcia@lists.infradead.org, linux-kernel@vger.kernel.org

From: Leonardo Potenza <lpotenza@inwind.it>

Add a check for the request_irq() return value.

Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>
---

The aim of this patch is to remove the following warning message:
drivers/pcmcia/i82365.c: In function 'init_i82365':
drivers/pcmcia/i82365.c:1296: warning: ignoring return value of 'request_irq', declared with attribute warn_unused_result

--- linux-2.6.orig/drivers/pcmcia/i82365.c
+++ linux-2.6/drivers/pcmcia/i82365.c
@@ -1263,7 +1263,7 @@ static int __init init_i82365(void)
 
     ret = driver_register(&i82365_driver);
     if (ret)
-	return ret;
+	goto err_out;
 
     i82365_device = platform_device_alloc("i82365", 0);
     if (i82365_device) {
@@ -1273,10 +1273,8 @@ static int __init init_i82365(void)
     } else
 	    ret = -ENOMEM;
 
-    if (ret) {
-	driver_unregister(&i82365_driver);
-	return ret;
-    }
+    if (ret)
+	goto err_driver_unregister;
 
     printk(KERN_INFO "Intel ISA PCIC probe: ");
     sockets = 0;
@@ -1285,16 +1283,17 @@ static int __init init_i82365(void)
 
     if (sockets = 0) {
 	printk("not found.\n");
-	platform_device_unregister(i82365_device);
-	release_region(i365_base, 2);
-	driver_unregister(&i82365_driver);
-	return -ENODEV;
+	ret = -ENODEV;
+	goto err_dev_unregister;
     }
 
     /* Set up interrupt handler(s) */
     if (grab_irq != 0)
-	request_irq(cs_irq, pcic_interrupt, 0, "i82365", pcic_interrupt);
-    
+	ret = request_irq(cs_irq, pcic_interrupt, 0, "i82365", pcic_interrupt);
+
+    if (ret)
+	goto err_socket_release;
+
     /* register sockets with the pcmcia core */
     for (i = 0; i < sockets; i++) {
 	    socket[i].socket.dev.parent = &i82365_device->dev;
@@ -1324,7 +1323,23 @@ static int __init init_i82365(void)
     }
     
     return 0;
-    
+err_socket_release:
+    for (i = 0; i < sockets; i++) {
+	/* Turn off all interrupt sources! */
+	i365_set(i, I365_CSCINT, 0);
+	release_region(socket[i].ioaddr, 2);
+    }
+err_dev_unregister:
+    platform_device_unregister(i82365_device);
+    release_region(i365_base, 2);
+#ifdef CONFIG_PNP
+    if (i82365_pnpdev)
+	pnp_disable_dev(i82365_pnpdev);
+#endif
+err_driver_unregister:
+    driver_unregister(&i82365_driver);
+err_out:
+    return ret;
 } /* init_i82365 */
 
 static void __exit exit_i82365(void)
