From: Domen Puncer <domen@coderock.org>
Date: Wed, 24 Nov 2004 15:33:19 +0000
Subject: [KJ] [patch 5/8] ifdef typos: drivers_net_wireless_wavelan_cs.c
Message-Id: <20041124153319.GE14789@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10379561673459659=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============10379561673459659==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

wavelan.p.h defines *_ERROR
wavelan_cs.p.h defines *_ERRORS
Since only second one is included, change #ifdefs

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/net/wireless/wavelan_cs.c	2004-11-15 13:42:13.000000000 +0100
+++ str2/drivers/net/wireless/wavelan_cs.c	2004-11-24 15:05:57.000000000 +0100
@@ -950,7 +950,7 @@ wv_diag(struct net_device *	dev)
 		  OP0_DIAGNOSE, SR0_DIAGNOSE_PASSED))
     ret = TRUE;
 
-#ifdef DEBUG_CONFIG_ERROR
+#ifdef DEBUG_CONFIG_ERRORS
   printk(KERN_INFO "wavelan_cs: i82593 Self Test failed!\n");
 #endif
   return(ret);
@@ -3463,7 +3463,7 @@ wv_ru_stop(struct net_device *	dev)
   /* If there was a problem */
   if(spin <= 0)
     {
-#ifdef DEBUG_CONFIG_ERROR
+#ifdef DEBUG_CONFIG_ERRORS
       printk(KERN_INFO "%s: wv_ru_stop(): The chip doesn't want to stop...\n",
 	     dev->name);
 #endif

--===============10379561673459659==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10379561673459659==--
