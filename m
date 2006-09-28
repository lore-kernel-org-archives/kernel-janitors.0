From: Badari Pulavarty <pbadari@us.ibm.com>
Date: Thu, 28 Sep 2006 16:58:52 +0000
Subject: [KJ] [PATCH] RocketPort driver missing release_request()
Message-Id: <1159462732.1709.69.camel@dyn9047017100.beaverton.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

rp_init() should release the region, in failure cases.

Signed-off-by: Badari Pulavarty <pbadari@us.ibm.com>
 drivers/char/rocket.c |    4 ++++
 1 file changed, 4 insertions(+)

Index: linux-2.6.18/drivers/char/rocket.c
=================================--- linux-2.6.18.orig/drivers/char/rocket.c	2006-09-19 20:42:06.000000000 -0700
+++ linux-2.6.18/drivers/char/rocket.c	2006-09-28 09:50:59.000000000 -0700
@@ -2445,6 +2445,8 @@
 	if (retval < 0) {
 		printk(KERN_INFO "Couldn't install tty RocketPort driver (error %d)\n", -retval);
 		put_tty_driver(rocket_driver);
+		if (controller)
+			release_region(controller, 4);
 		return -1;
 	}
 
@@ -2476,6 +2478,8 @@
 		del_timer_sync(&rocket_timer);
 		tty_unregister_driver(rocket_driver);
 		put_tty_driver(rocket_driver);
+		if (controller)
+			release_region(controller, 4);
 		return -ENXIO;
 	}
 


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
