From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
Date: Mon, 19 Oct 2009 07:56:04 +0000
Subject: Re: [PATCH 7/14] drivers/mmc: Move dereference after NULL test
Message-Id: <20091019075604.GB11449@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0910170839430.9213@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0910170839430.9213@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

On Sat, Oct 17, 2009 at 08:40:02AM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
>=20
> If the NULL test on mrq is needed, then the derefernce should be after the
> NULL test.
s/derefernce/dereference/
=20
> A simplified version of the semantic match that detects this problem is as
> follows (http://coccinelle.lip6.fr/):
>=20
> // <smpl>
> @match exists@
> expression x, E;
> identifier fld;
> @@
>=20
> * x->fld
>   ... when !=3D \(x =3D E\|&x\)
> * x =3D NULL
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <julia@diku.dk>
Other than that

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

--=20
Pengutronix e.K.                              | Uwe Kleine-K=F6nig         =
   |
Industrial Linux Solutions                    | http://www.pengutronix.de/ =
 |
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
