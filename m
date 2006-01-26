From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 17:20:46 +0000
Subject: [KJ] [Patch 7/8] BUG_ON() Conversion in fs/fcntl.c
Message-Id: <1138296046.9170.26.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33058533105256016=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============33058533105256016==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner and can better optimized away

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/fs/fcntl.c.orig	2006-01-26 17:57:10.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/fcntl.c	2006-01-26 17:57:22.000000000 +0100
@@ -451,8 +451,7 @@ static void send_sigio_to_task(struct ta
 			/* Make sure we are called with one of the POLL_*
 			   reasons, otherwise we could leak kernel stack into
 			   userspace.  */
-			if ((reason & __SI_MASK) != __SI_POLL)
-				BUG();
+			BUG_ON((reason & __SI_MASK) != __SI_POLL);
 			if (reason - POLL_IN >= NSIGPOLL)
 				si.si_band  = ~0L;
 			else



--===============33058533105256016==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33058533105256016==--
