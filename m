From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Date: Sun, 10 Jun 2007 13:14:02 +0000
Subject: [KJ] Re: [PATCH] drivers/isdn/hisax: ARRAY_SIZE instead of sizeof
Message-Id: <20070610131402.GR2649@lug-owl.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8400738377262027614=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200706101235.09578.lists-receive@programmierforen.de> <20070610131122.GB3588@pingi.kke.suse.de>
In-Reply-To: <20070610131122.GB3588@pingi.kke.suse.de>
To: Andi Drebes <lists-receive@programmierforen.de>, kernel-janitors@lists.osdl.org, linux-kernel <linux-kernel@vger.kernel.org>


--===============8400738377262027614==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i+yzTqNyNhelWXoM"
Content-Disposition: inline


--i+yzTqNyNhelWXoM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2007-06-10 15:11:22 +0200, Karsten Keil <kkeil@suse.de> wrote:
> > --- a/drivers/isdn/hisax/callc.c
> > +++ b/drivers/isdn/hisax/callc.c
> > @@ -834,7 +834,7 @@ static struct FsmNode fnlist[] __initdata =3D
> >  };
> >  /* *INDENT-ON* */
> > =20
> > -#define FNCOUNT (sizeof(fnlist)/sizeof(struct FsmNode))
> > +#define FNCOUNT ARRAY_SIZE(fnlist)
> > =20
> >  int __init
> >  CallcNew(void)
>
> This is OK, thanks for changing.

I'd suggest to not use another define, but use ARRAY_SIZE(foo)
_instead of_ eg. FNCOUNT.

MfG, JBG

--=20
      Jan-Benedict Glaw      jbglaw@lug-owl.de              +49-172-7608481
Signature of:           Ich hatte in letzter Zeit ein bi=C3=9Fchen viel Rea=
litycheck.
the second  :               Langsam m=C3=B6chte ich mal wieder weitertr=C3=
=A4umen k=C3=B6nnen.
                             -- Maximilian Wilhelm (18. Mai 2006, #lug-owl.=
de)

--i+yzTqNyNhelWXoM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFGa/kaHb1edYOZ4bsRAqieAJ0eM98JfEmBWarZhnUJSXMa/RzFfwCfcrXN
4TaVWO+fN9Dc9Fpsiwpi3yg=
=gzOs
-----END PGP SIGNATURE-----

--i+yzTqNyNhelWXoM--

--===============8400738377262027614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--===============8400738377262027614==--
