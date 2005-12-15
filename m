From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 15 Dec 2005 23:57:10 +0000
Subject: [KJ] [Patch] check unsigned < 0 in mtd/devices/slram.c
Message-Id: <1134691030.14461.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50342047551017366=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============50342047551017366==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

since devstart and devlength are unsigned long, and all 
functions using them / returning them return unsigned long
it seems safe to remove the check, since they can
never be < 0.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>


--- linux-2.6.15-rc5-git5/drivers/mtd/devices/slram.c.orig	2005-12-16 00:52:48.000000000 +0100
+++ linux-2.6.15-rc5-git5/drivers/mtd/devices/slram.c	2005-12-16 00:53:14.000000000 +0100
@@ -274,8 +274,8 @@ static int parse_cmdline(char *devname, 
 	}
 	T("slram: devname=%s, devstart=0x%lx, devlength=0x%lx\n",
 			devname, devstart, devlength);
-	if ((devstart < 0) || (devlength < 0) || (devlength % SLRAM_BLK_SZ != 0)) {
-		E("slram: Illegal start / length parameter.\n");
+	if (devlength % SLRAM_BLK_SZ != 0) {
+		E("slram: Illegal length parameter.\n");
 		return(-EINVAL);
 	}
 



--===============50342047551017366==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50342047551017366==--
