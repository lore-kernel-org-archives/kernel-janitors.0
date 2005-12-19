From: Daniel =?ISO-8859-1?Q?Marjam=E4ki?= <daniel.marjamaki@comhem.se>
Date: Mon, 19 Dec 2005 08:48:31 +0000
Subject: [KJ] [PATCH] drivers/char/agp/isoch.c: Loop cleanup
Message-Id: <20051219094831.5985836e.daniel.marjamaki@comhem.se>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


From: Daniel Marjam=E4ki <daniel.marjamaki@comhem.se>

Loop cleanup
The loop contains a command that is only used in the last iteration. I move=
d the command outside the loop.
Compile-tested

Signed-off-by: Daniel Marjam=E4ki <daniel.marjamaki@comhem.se>

--- a/drivers/char/agp/isoch.c	2005-12-05 06:56:44.000000000 +0100
+++ b/drivers/char/agp/isoch.c	2005-12-19 09:32:59.000000000 +0100
@@ -218,10 +218,8 @@ static int agp_3_5_isochronous_node_enab
 			master[cdev].rq *=3D (1 << (master[cdev].y - 1));
=20
 		tot_rq +=3D master[cdev].rq;
-
-		if (cdev =3D ndevs-1)
-			master[cdev].n +=3D rem;
 	}
+	master[ndevs-1].n +=3D rem;
=20
 	/* Figure the number of isochronous and asynchronous RQ slots the
 	 * target is providing. */

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
