From: Daniel =?ISO-8859-1?Q?Marjam=E4ki?= <daniel.marjamaki@comhem.se>
Date: Wed, 30 Nov 2005 13:20:02 +0000
Subject: [KJ] [PATCH] arch/i386/crypto/aes.c: removing unused local variable
Message-Id: <20051130142002.94bbef38.daniel.marjamaki@comhem.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <438C70A5.6070403@comhem.se>
In-Reply-To: <438C70A5.6070403@comhem.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


This patch removes an unused local variable. The variable is assigned but n=
ever read.

Signed-off-by: Daniel Marjam=E4ki

--- a/arch/i386/crypto/aes.c	2005-11-29 15:59:09.000000000 +0100
+++ b/arch/i386/crypto/aes.c	2005-11-29 15:50:41.000000000 +0100
@@ -93,7 +93,6 @@ static u32 rcon_tab[RC_LENGTH];
=20
 u32 ft_tab[4][256];
 u32 fl_tab[4][256];
-static u32 ls_tab[4][256];
 static u32 im_tab[4][256];
 u32 il_tab[4][256];
 u32 it_tab[4][256];
@@ -144,15 +143,6 @@ static void gen_tabs(void)
 		fl_tab[2][i] =3D upr(w, 2);
 		fl_tab[3][i] =3D upr(w, 3);
 	=09
-		/*
-		 * table for key schedule if fl_tab above is
-		 * not of the required form
-		 */
-		ls_tab[0][i] =3D w;
-		ls_tab[1][i] =3D upr(w, 1);
-		ls_tab[2][i] =3D upr(w, 2);
-		ls_tab[3][i] =3D upr(w, 3);
-	=09
 		b =3D fi(inv_affine((u8)i));
 		w =3D bytes2word(fe(b), f9(b), fd(b), fb(b));








_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
