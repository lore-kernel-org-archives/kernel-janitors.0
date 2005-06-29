From: Nico Golde <nico@ngolde.de>
Date: Wed, 29 Jun 2005 17:10:23 +0000
Subject: Re: [KJ] kernel/module.c use __set_current_state() instead of direct
Message-Id: <20050629171023.GB3251@ngolde.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8181138990040655=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1120069126.18231.2.camel@localhost>
In-Reply-To: <1120069126.18231.2.camel@localhost>
To: kernel-janitors@vger.kernel.org


--===============8181138990040655==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Content-Disposition: inline


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,
* aLeJ <fuzzy.alej@gmail.com> [2005-06-29 19:00]:
> Description:
> Use of __set_current_state() instead of direct assigment of
> current->state.
>=20
> Signed-off-by: Alejandro Andres <fuzzy.alej@gmail.com>
>=20
> --- linux-2.6.12.1/kernel/module.c.orig	2005-06-29 20:11:28.000000000
> +0200
> +++ linux-2.6.12.1/kernel/module.c	2005-06-29 20:12:02.000000000 +0200
> @@ -518,7 +518,7 @@ static void wait_for_zero_refcount(struc
>  			break;
>  		schedule();
>  	}
> -	current->state =3D TASK_RUNNING;
> +	__set_current_state(TASK_RUNNING);
>  	down(&module_mutex);
>  }

There are many current->state code snippets in the kernel
source. Should they all be substituted?
Regards Nico
--=20
Nico Golde - JAB: nion@jabber.ccc.de | GPG: 0x73647CFF
http://www.ngolde.de | http://www.muttng.org | http://grml.org=20
VIM has two modes - the one in which it beeps=20
and the one in which it doesn't -- encrypted mail preferred

--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCwtX/HYflSXNkfP8RArScAKCj2tkBFZwdg6Jqmb16p+pz98eeRACbBn9E
Z85H9NlSpomnjSQGQIc2o0o=
=dPbL
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--

--===============8181138990040655==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8181138990040655==--
