From: Don Koch <aardvark@krl.com>
Date: Wed, 14 Apr 2004 02:17:53 +0000
Subject: [Kernel-janitors] [PATHC] fix ide.c warning
Message-Id: <200404140217.i3E2Hrgn023951@p-chan.krl.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16879255986945241=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============16879255986945241==
Content-Type: text/plain; charset=us-ascii

This fixes the "implicit declaration of function `pnpide_init'" warning
in ide.c.  Based on 2.6.5-mm5.

===== drivers/ide/ide.c 1.132 vs edited =====
--- 1.132/drivers/ide/ide.c	Sat Apr 10 18:22:11 2004
+++ edited/drivers/ide/ide.c	Tue Apr 13 20:59:52 2004
@@ -2245,7 +2245,10 @@
 		return 1;
 	}
 #if defined(CONFIG_BLK_DEV_IDEPNP) && defined(CONFIG_PNP) && defined(MODULE)
-	pnpide_init(0);
+	{
+		extern void pnpide_init(int enable);
+		pnpide_init(0);
+	}
 #endif /* CONFIG_BLK_DEV_IDEPNP */
 #ifdef CONFIG_PROC_FS
 	ide_remove_proc_entries(drive->proc, DRIVER(drive)->proc);



--===============16879255986945241==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16879255986945241==--
