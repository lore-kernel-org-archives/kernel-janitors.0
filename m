From: Stefan Sperling <stefan@binarchy.net>
Date: Tue, 09 Nov 2004 21:36:10 +0000
Subject: [KJ] [PATCH] convert ray_cs wireless driver to module_param
Message-Id: <20041109213610.GH9496@dice.seeling33.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55899459127843221=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============55899459127843221==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Replaces MODULE_PARM with module_param calls in ray_cs wireless driver.

--- drivers/net/wireless/ray_cs.c.orig	2004-11-09 20:40:22.056914152 +0100
+++ drivers/net/wireless/ray_cs.c	2004-11-08 20:58:55.000000000 +0100
@@ -84,7 +84,7 @@ typedef u_char	mac_addr[ETH_ALEN];	/* Ha
 #ifdef PCMCIA_DEBUG
 static int ray_debug;
 static int pc_debug = PCMCIA_DEBUG;
-MODULE_PARM(pc_debug, "i");
+module_param(pc_debug, bool, 0644);
 /* #define DEBUG(n, args...) if (pc_debug>(n)) printk(KERN_DEBUG args); */
 #define DEBUG(n, args...) if (pc_debug>(n)) printk(args);
 #else
@@ -226,18 +226,18 @@ MODULE_AUTHOR("Corey Thomas <corey@world
 MODULE_DESCRIPTION("Raylink/WebGear wireless LAN driver");
 MODULE_LICENSE("GPL");
 
-MODULE_PARM(irq_mask,"i");
-MODULE_PARM(net_type,"i");
-MODULE_PARM(hop_dwell,"i");
-MODULE_PARM(beacon_period,"i");
-MODULE_PARM(psm,"i");
-MODULE_PARM(essid,"s");
-MODULE_PARM(translate,"i");
-MODULE_PARM(country,"i");
-MODULE_PARM(sniffer,"i");
-MODULE_PARM(bc,"i");
-MODULE_PARM(phy_addr,"s");
-MODULE_PARM(ray_mem_speed, "i");
+module_param(irq_mask, u_long, 0444);
+module_param(net_type,int, 0644);
+module_param(hop_dwell, int, 0644);
+module_param(beacon_period, int, 0644);
+module_param(psm, bool, 0644);
+module_param_string(essid, esiid, 32, 0444);
+module_param(translate, bool, 0644);
+module_param(country, int, 0644);
+module_param(sniffer, bool, 0444);
+module_param(bc, bool, 0444);
+module_param_string(phy_addr, phy_addr, ADDRLEN, 0444);
+module_param(ray_mem_speed, int, 0444);
 
 static UCHAR b5_default_startup_parms[] = {
     0,   0,                         /* Adhoc station */


--===============55899459127843221==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55899459127843221==--
