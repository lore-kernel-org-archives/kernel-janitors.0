From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 00:00:06 +0000
Subject: [KJ] [Patch 2/9] BUG_ON() Conversion in md/dm-hw-handler.c
Message-Id: <1138233606.7232.37.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83961060241278029=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============83961060241278029==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner and can better optimized away

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/md/dm-hw-handler.c.orig	2006-01-26 00:37:03.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/md/dm-hw-handler.c	2006-01-26 00:37:15.000000000 +0100
@@ -83,8 +83,7 @@ void dm_put_hw_handler(struct hw_handler
 	if (--hwhi->use == 0)
 		module_put(hwhi->hwht.module);
 
-	if (hwhi->use < 0)
-		BUG();
+	BUG_ON(hwhi->use < 0);
 
       out:
 	up_read(&_hwh_lock);



--===============83961060241278029==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83961060241278029==--
