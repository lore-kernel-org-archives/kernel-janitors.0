From: Don Koch <aardvark@krl.com>
Date: Thu, 15 Apr 2004 00:00:00 +0000
Subject: [Kernel-janitors] [PATCH] ide fix, round 2
Message-Id: <200404150000.i3F000ZT003450@p-chan.krl.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56733116889489965=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============56733116889489965==
Content-Type: text/plain; charset=us-ascii

OK, how does this look?  Use in place of previous patch against 2.6.5-mm5.

-- 
Don Koch
http://www.krl.com/

===== drivers/ide/ide.c 1.132 vs edited =====
--- 1.132/drivers/ide/ide.c	Sat Apr 10 18:22:11 2004
+++ edited/drivers/ide/ide.c	Wed Apr 14 17:59:40 2004
@@ -2105,10 +2105,7 @@
 	}
 #endif /* CONFIG_BLK_DEV_BUDDHA */
 #if defined(CONFIG_BLK_DEV_IDEPNP) && defined(CONFIG_PNP)
-	{
-		extern void pnpide_init(int enable);
-		pnpide_init(1);
-	}
+	pnpide_init(1);
 #endif /* CONFIG_BLK_DEV_IDEPNP */
 }
 
===== include/linux/ide.h 1.110 vs edited =====
--- 1.110/include/linux/ide.h	Sat Apr 10 22:41:48 2004
+++ edited/include/linux/ide.h	Wed Apr 14 17:59:01 2004
@@ -1667,4 +1667,8 @@
 
 extern struct bus_type ide_bus_type;
 
+#if defined(CONFIG_BLK_DEV_IDEPNP) && defined(CONFIG_PNP)
+extern void pnpide_init(int enable);
+#endif /* CONFIG_BLK_DEV_IDEPNP */
+
 #endif /* _IDE_H */



--===============56733116889489965==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56733116889489965==--
