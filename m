From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Mon, 16 Feb 2004 12:36:09 +0000
Subject: Re: [Kernel-janitors] [PATCH] - 2.6.2 - scripts/fixdep.c -
Message-Id: <1076934969.9264.6.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200402142244.04007.ron@rongage.org>
In-Reply-To: <200402142244.04007.ron@rongage.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


Hi Ron,

Em Dom, 2004-02-15 =E0s 00:45, Ron Gage escreveu:
> Fixes signed/unsigned comparison warnings.

--- linux-2.6.2.orig/scripts/fixdep.c   2004-02-03 22:43:47.000000000
-0500
+++ linux-2.6.2/scripts/fixdep.c        2004-02-14 22:28:22.000000000
-0500
@@ -213,7 +213,7 @@
 {
        int *end =3D (int *) (map + len);
        /* start at +1, so that p can never be < map */
-       int *m   =3D (int *) map + 1;
+       unsigned int *m   =3D (int *) map + 1;
        char *p, *q;

 What about:

unsigned int *m =3D (unsigned int *) map +1;

 Or the compiler give you a warning ?

--=20
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
