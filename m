From: Stefan Sperling <stefan@binarchy.net>
Date: Tue, 09 Nov 2004 23:23:52 +0000
Subject: [KJ] [PATCH] convert wl3501_cs wireless driver to module_param
Message-Id: <20041109232352.GA12268@dice.seeling33.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68190761157198687=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041109214141.GK9496@dice.seeling33.de>
In-Reply-To: <20041109214141.GK9496@dice.seeling33.de>
To: kernel-janitors@vger.kernel.org

--===============68190761157198687==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Replaces MODULE_PARM with module_param calls in wl3501 wireless driver.

--- drivers/net/wireless/wl3501_cs.c.orig	2004-11-09 20:40:22.138901688 +0100
+++ drivers/net/wireless/wl3501_cs.c	2004-11-10 00:03:13.759534096 +0100
@@ -79,7 +79,7 @@
 #define PCMCIA_DEBUG 0
 #ifdef PCMCIA_DEBUG
 static int pc_debug = PCMCIA_DEBUG;
-MODULE_PARM(pc_debug, "i");
+module_param(pc_debug, int, 0644);
 #define dprintk(n, format, args...) \
 	{ if (pc_debug > (n)) \
 		printk(KERN_INFO "%s: " format "\n", __FUNCTION__ , ##args); }
@@ -2279,8 +2279,8 @@ static void __exit wl3501_exit_module(vo
 module_init(wl3501_init_module);
 module_exit(wl3501_exit_module);
 
-MODULE_PARM(wl3501_irq_mask, "i");
-MODULE_PARM(wl3501_irq_list, "1-4i");
+module_param(wl3501_irq_mask, long, 0);
+module_param_array(wl3501_irq_list, int, NULL, 0);
 MODULE_AUTHOR("Fox Chen <mhchen@golf.ccl.itri.org.tw>, "
 	      "Arnaldo Carvalho de Melo <acme@conectiva.com.br>,"
 	      "Gustavo Niemeyer <niemeyer@conectiva.com>");


--===============68190761157198687==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68190761157198687==--
