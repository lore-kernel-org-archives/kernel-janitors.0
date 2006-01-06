From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 06 Jan 2006 11:19:55 +0000
Subject: [KJ] [Patch 6/9] Cleanup MODULE_PARM in mace.c
Message-Id: <1136546395.13172.29.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64944220903647265=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============64944220903647265==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch changes MODULE_PARM usage to
module_param

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-git2/drivers/net/mace.c.orig	2006-01-06 12:09:18.000000000 +0100
+++ linux-2.6.15-git2/drivers/net/mace.c	2006-01-06 12:09:31.000000000 +0100
@@ -1042,7 +1042,7 @@ static void __exit mace_cleanup(void)
 
 MODULE_AUTHOR("Paul Mackerras");
 MODULE_DESCRIPTION("PowerMac MACE driver.");
-MODULE_PARM(port_aaui, "i");
+module_param(port_aaui, int, 0);
 MODULE_PARM_DESC(port_aaui, "MACE uses AAUI port (0-1)");
 MODULE_LICENSE("GPL");
 



--===============64944220903647265==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64944220903647265==--
