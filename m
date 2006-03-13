From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Mon, 13 Mar 2006 11:56:52 +0000
Subject: [KJ][Patch] check return value of request_irq in i82365.c
Message-Id: <1142251014.7791.54.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50054800748585215=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141029654.7765.6.camel@localhost.localdomain>
In-Reply-To: <1141029654.7765.6.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============50054800748585215==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list

i82365.c calls request_irq without checking the return value @ line
1297.

The patch below checks the return value, and serialises the error path,
which is currently a little confusing.

This file also has 4 space indenting(what is up with pcmcia drivers?),
so I might follow with a patch fixing the coding style for it
too.(tomorrow)

This patch is compile tested.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc5/drivers/pcmcia/i82365.c.orig	2006-03-13 17:49:26.000000000 +1100
+++ linux-2.6.16-rc5/drivers/pcmcia/i82365.c	2006-03-13 22:52:56.000000000 +1100
@@ -1264,20 +1264,17 @@ static int __init init_i82365(void)
 
     ret = driver_register(&i82365_driver);
     if (ret)
-	return ret;
+	goto out;
 
     i82365_device = platform_device_alloc("i82365", 0);
-    if (i82365_device) {
-	    ret = platform_device_add(i82365_device);
-	    if (ret)
-		    platform_device_put(i82365_device);
-    } else
-	    ret = -ENOMEM;
-
-    if (ret) {
-	driver_unregister(&i82365_driver);
-	return ret;
+    if (!i82365_device) {
+	ret = -ENOMEM;
+	goto ur_out;
     }
+   
+    ret = platform_device_add(i82365_device);
+    if (ret)
+	goto pdp_out;
 
     printk(KERN_INFO "Intel ISA PCIC probe: ");
     sockets = 0;
@@ -1286,15 +1283,18 @@ static int __init init_i82365(void)
 
     if (sockets == 0) {
 	printk("not found.\n");
-	platform_device_unregister(i82365_device);
-	release_region(i365_base, 2);
-	driver_unregister(&i82365_driver);
-	return -ENODEV;
+	ret = -ENODEV;
+	goto r_out;
     }
 
     /* Set up interrupt handler(s) */
     if (grab_irq != 0)
-	request_irq(cs_irq, pcic_interrupt, 0, "i82365", pcic_interrupt);
+	if (request_irq(cs_irq, pcic_interrupt, 0, "i82365", pcic_interrupt)< 0)
+	{
+	    printk(KERN_ERR "init_i82365 could not request_irq");
+	    ret = -EBUSY;
+	    goto r_out;
+	}
     
     /* register sockets with the pcmcia core */
     for (i = 0; i < sockets; i++) {
@@ -1325,6 +1325,16 @@ static int __init init_i82365(void)
     }
     
     return 0;
+
+r_out:
+    release_region(i365_base, 2);
+    platform_device_del(i82365_device);
+pdp_out:
+    platform_device_put(i82365_device);
+ur_out:
+    driver_unregister(&i82365_driver);
+out:
+    return ret;
     
 } /* init_i82365 */
 



--===============50054800748585215==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50054800748585215==--
