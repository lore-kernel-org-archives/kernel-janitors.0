From: Stefan Sperling <stefan@binarchy.net>
Date: Tue, 09 Nov 2004 21:29:58 +0000
Subject: [KJ] [PATCH] convert airo wireless driver to module_param
Message-Id: <20041109212957.GA9496@dice.seeling33.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============08650510116232768=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============08650510116232768==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Replaces MODULE_PARM with module_param calls in airo wireless driver.

--- drivers/net/wireless/airo.c.orig	2004-11-09 20:40:21.867942880 +0100
+++ drivers/net/wireless/airo.c	2004-11-08 23:09:27.000000000 +0100
@@ -246,36 +246,36 @@ MODULE_DESCRIPTION("Support for Cisco/Ai
 		   for PCMCIA when used with airo_cs.");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_SUPPORTED_DEVICE("Aironet 4500, 4800 and Cisco 340/350");
-MODULE_PARM(io,"1-4i");
-MODULE_PARM(irq,"1-4i");
-MODULE_PARM(basic_rate,"i");
-MODULE_PARM(rates,"1-8i");
-MODULE_PARM(ssids,"1-3s");
-MODULE_PARM(auto_wep,"i");
+module_param_array(io, int, NULL, 0444);
+module_param_array(irq, int, NULL, 0444);
+module_param(basic_rate, int, 0644);
+module_param_array(rates, int, NULL, 0644);
+module_param_array(ssids, int, NULL, 0644);
+module_param(auto_wep, int, 0644);
 MODULE_PARM_DESC(auto_wep, "If non-zero, the driver will keep looping through \
 the authentication options until an association is made.  The value of \
 auto_wep is number of the wep keys to check.  A value of 2 will try using \
 the key at index 0 and index 1.");
-MODULE_PARM(aux_bap,"i");
+module_param(aux_bap, int, 0644);
 MODULE_PARM_DESC(aux_bap, "If non-zero, the driver will switch into a mode \
 than seems to work better for older cards with some older buses.  Before \
 switching it checks that the switch is needed.");
-MODULE_PARM(maxencrypt, "i");
+module_param(maxencrypt, int, 0644);
 MODULE_PARM_DESC(maxencrypt, "The maximum speed that the card can do \
 encryption.  Units are in 512kbs.  Zero (default) means there is no limit. \
 Older cards used to be limited to 2mbs (4).");
-MODULE_PARM(adhoc, "i");
+module_param(adhoc, int, 0644);
 MODULE_PARM_DESC(adhoc, "If non-zero, the card will start in adhoc mode.");
-MODULE_PARM(probe, "i");
+module_param(probe, int, 0644);
 MODULE_PARM_DESC(probe, "If zero, the driver won't start the card.");
 
-MODULE_PARM(proc_uid, "i");
+module_param(proc_uid, int, 0644);
 MODULE_PARM_DESC(proc_uid, "The uid that the /proc files will belong to.");
-MODULE_PARM(proc_gid, "i");
+module_param(proc_gid, int, 0644);
 MODULE_PARM_DESC(proc_gid, "The gid that the /proc files will belong to.");
-MODULE_PARM(airo_perm, "i");
+module_param(airo_perm, int, 0644);
 MODULE_PARM_DESC(airo_perm, "The permission bits of /proc/[driver/]aironet.");
-MODULE_PARM(proc_perm, "i");
+module_param(proc_perm, int, 0644);
 MODULE_PARM_DESC(proc_perm, "The permission bits of the files in /proc");
 
 /* This is a kind of sloppy hack to get this information to OUT4500 and

--===============08650510116232768==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============08650510116232768==--
