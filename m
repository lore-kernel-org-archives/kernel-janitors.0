From: maximilian attems <janitor@sternwelten.at>
Date: Sun, 15 Aug 2004 15:00:29 +0000
Subject: [Kernel-janitors] [patch] remove-last-suser-call
Message-Id: <20040815150029.GJ1799@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35520656028230313=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kj <kernel-janitors@osdl.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

--===============35520656028230313==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Attached patch removes the lone remaining suser() call,
suser() has long gone in summer 2002.
applies to 2.6.8.1-kjt1, compile tested

Signed-off-by: Maximilian Attems <janitor@sternwelten.at>



---

 linux-2.6.8-max/drivers/char/rocket.c |    4 ----
 1 files changed, 4 deletions(-)

diff -puN drivers/char/rocket.c~remove-last-suser-call drivers/char/rocket.c
--- linux-2.6.8/drivers/char/rocket.c~remove-last-suser-call	2004-08-15 16:54:13.000000000 +0200
+++ linux-2.6.8-max/drivers/char/rocket.c	2004-08-15 16:54:13.000000000 +0200
@@ -1283,11 +1283,7 @@ static int set_config(struct r_port *inf
 	if (copy_from_user(&new_serial, new_info, sizeof (new_serial)))
 		return -EFAULT;
 
-#ifdef CAP_SYS_ADMIN
 	if (!capable(CAP_SYS_ADMIN))
-#else
-	if (!suser())
-#endif
 	{
 		if ((new_serial.flags & ~ROCKET_USR_MASK) != (info->flags & ~ROCKET_USR_MASK))
 			return -EPERM;

_

--===============35520656028230313==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35520656028230313==--
