From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 15 Mar 2006 07:02:59 +0000
Subject: Re: [KJ][Patch] check return value of request_irq in i82365.c
Message-Id: <1142406179.7781.17.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53436463572337178=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141029654.7765.6.camel@localhost.localdomain>
In-Reply-To: <1141029654.7765.6.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============53436463572337178==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2006-03-14 at 08:26 -0800, Randy.Dunlap wrote:

> well.... if you have to make any more changes, add a space after
> the "< 0)" and before the opening '{'.
> The "grammar" isn't tough IMO.  Maybe you are just used to not
> using whitespace?

White-space lol, I usually use a lot more, but I have never been
restricted to 80 columns before and I'm not used to using the K&R coding
style that you old folks all seem to use. :P

Here is an improved patch. I guess I will start with the style cleanups,
unless there are anymore problems.


Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc6/drivers/pcmcia/i82365.c.orig	2006-03-15 17:34:45.000000000 +1100
+++ linux-2.6.16-rc6/drivers/pcmcia/i82365.c	2006-03-15 17:37:59.000000000 +1100
@@ -770,7 +770,7 @@ MODULE_DEVICE_TABLE(isapnp, id_table);
 static struct pnp_dev *i82365_pnpdev;
 #endif
 
-static void __init isa_probe(void)
+static int __init isa_probe(void)
 {
     int i, j, sock, k, ns, id;
     kio_addr_t port;
@@ -805,7 +805,7 @@ static void __init isa_probe(void)
     if (!request_region(i365_base, 2, "i82365")) {
 	if (sockets == 0)
 	    printk("port conflict at %#lx\n", i365_base);
-	return;
+	return -EBUSY;
     }
 
     id = identify(i365_base, 0);
@@ -844,6 +844,7 @@ static void __init isa_probe(void)
 	    if (ns != 0) add_pcic(ns, id);
 	}
     }
+    return 0;
 }
 
 /*====================================================================*/
@@ -1264,37 +1265,37 @@ static int __init init_i82365(void)
 
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
 
-    isa_probe();
+    i = isa_probe();
 
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
+	if (request_irq(cs_irq, pcic_interrupt, 0, "i82365",
+							pcic_interrupt) < 0) {
+	    printk(KERN_ERR "init_i82365 could not request_irq");
+	    ret = -EBUSY;
+	    goto r_out;
+	}
     
     /* register sockets with the pcmcia core */
     for (i = 0; i < sockets; i++) {
@@ -1325,6 +1326,17 @@ static int __init init_i82365(void)
     }
     
     return 0;
+
+r_out:
+    if (i == 0)
+	release_region(i365_base, 2);
+    platform_device_del(i82365_device);
+pdp_out:
+    platform_device_put(i82365_device);
+ur_out:
+    driver_unregister(&i82365_driver);
+out:
+    return ret;
     
 } /* init_i82365 */
 



--===============53436463572337178==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53436463572337178==--
