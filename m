From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 14 Dec 2005 16:23:42 +0000
Subject: [KJ] [Patch] check u32 < 0 in char/keyboard.c
Message-Id: <1134577423.24136.3.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84924923504197292=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============84924923504197292==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

another comparison of an unsigned value with < 0
since keycode is always unsigned int in the calling 
functions i just removed the check. 

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc5-git2/drivers/char/keyboard.c.orig	2005-12-14 17:16:34.000000000 +0100
+++ linux-2.6.15-rc5-git2/drivers/char/keyboard.c	2005-12-14 17:16:49.000000000 +0100
@@ -198,7 +198,7 @@ int setkeycode(unsigned int scancode, un
 
 	if (scancode >= dev->keycodemax)
 		return -EINVAL;
-	if (keycode < 0 || keycode > KEY_MAX)
+	if (keycode > KEY_MAX)
 		return -EINVAL;
 	if (dev->keycodesize < sizeof(keycode) && (keycode >> (dev->keycodesize * 8)))
 		return -EINVAL;



--===============84924923504197292==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84924923504197292==--
