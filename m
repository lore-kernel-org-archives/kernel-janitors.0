From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 15:25:27 +0000
Subject: [KJ] [Patch 1/2] BUG_ON() Conversion in input/serio/hil_mlc.c
Message-Id: <1138289127.8642.2.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77430405444393813=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============77430405444393813==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner and can better optimized away

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/input/serio/hil_mlc.c.orig	2006-01-26 16:15:19.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/input/serio/hil_mlc.c	2006-01-26 16:16:08.000000000 +0100
@@ -556,7 +556,7 @@ static inline void hilse_setup_input(hil
 	do_gettimeofday(&(mlc->instart));
 	mlc->icount = 15;
 	memset(mlc->ipacket, 0, 16 * sizeof(hil_packet));
-	if (down_trylock(&(mlc->isem))) BUG();
+	BUG_ON(down_trylock(&(mlc->isem)));
 
 	return;
 }



--===============77430405444393813==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77430405444393813==--
