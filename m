From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Date: Mon, 11 Jun 2007 18:59:22 +0000
Subject: Re: [KJ] Re: [PATCH] drivers/isdn/hisax: ARRAY_SIZE instead of sizeof
Message-Id: <20070611185922.GC22027@lug-owl.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8552163840516623772=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200706101235.09578.lists-receive@programmierforen.de> <20070610131122.GB3588@pingi.kke.suse.de> <20070610131402.GR2649@lug-owl.de> <200706111120.07730.lists-receive@programmierforen.de> <82faac5b0706110525s56bade43rb24619b54687770d@mail.gmail.com> <20070611174706.GA9150@pingi.kke.suse.de>
In-Reply-To: <20070611174706.GA9150@pingi.kke.suse.de>
To: Andi Drebes <lists-receive@programmierforen.de>, kernel-janitors@lists.osdl.org, linux-kernel <linux-kernel@vger.kernel.org>
Cc: Darren Jenkins <darrenrjenkins@gmail.com>


--===============8552163840516623772==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Content-Disposition: inline


--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2007-06-11 19:47:06 +0200, Karsten Keil <kkeil@suse.de> wrote:
> diff --git a/drivers/isdn/hisax/callc.c b/drivers/isdn/hisax/callc.c
> index 7c56c44..0b9ed8e 100644
> --- a/drivers/isdn/hisax/callc.c
> +++ b/drivers/isdn/hisax/callc.c
> @@ -834,8 +834,6 @@ static struct FsmNode fnlist[] __initdata =3D
>  };
>  /* *INDENT-ON* */
> =20
> -#define FNCOUNT (sizeof(fnlist)/sizeof(struct FsmNode))
> -
>  int __init
>  CallcNew(void)
>  {
> @@ -843,7 +841,7 @@ CallcNew(void)
>  	callcfsm.event_count =3D EVENT_COUNT;
>  	callcfsm.strEvent =3D strEvent;
>  	callcfsm.strState =3D strState;
> -	return FsmNew(&callcfsm, fnlist, FNCOUNT);
> +	return FsmNew(&callcfsm, fnlist, ARRAY_SIZE(fnlist));
>  }
> =20
>  void

I think that's really a nice improvement :)  Thanks for the work,

MfG, JBG

--=20
      Jan-Benedict Glaw      jbglaw@lug-owl.de              +49-172-7608481
Signature of:           Ich hatte in letzter Zeit ein bi=C3=9Fchen viel Rea=
litycheck.
the second  :               Langsam m=C3=B6chte ich mal wieder weitertr=C3=
=A4umen k=C3=B6nnen.
                             -- Maximilian Wilhelm (18. Mai 2006, #lug-owl.=
de)

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFGbZuKHb1edYOZ4bsRArFXAJ0bbLgx4ipZejqnDvIdUgOx+QoxNACgjlrG
UQ453c4D4Wyw6R+ih9fi6T8=
=+Hgy
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--

--===============8552163840516623772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--===============8552163840516623772==--
