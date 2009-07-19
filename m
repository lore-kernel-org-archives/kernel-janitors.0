From: Jiri Kosina <jkosina@suse.cz>
Date: Sun, 19 Jul 2009 22:04:57 +0000
Subject: Re: [PATCH 3/10] drivers/hid: Move dereferences below a NULL test
Message-Id: <alpine.LNX.2.00.0907200004310.11648@wotan.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907191725530.16542@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907191725530.16542@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 19 Jul 2009, Julia Lawall wrote:

> From: Julia Lawall <julia@diku.dk>
>=20
> If the NULL test is necessary, then the dereferences should be moved below
> the NULL test.
>=20
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
>=20
> // <smpl>
> @@
> type T;
> expression E,E1;
> identifier i,fld;
> statement S;
> @@
>=20
> - T i =3D E->fld;
> + T i;
>   ... when !=3D E=E1
>       when !=3D i
>   if (E =3D NULL||...) S
> + i =3D E->fld;
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <julia@diku.dk>

Good catch, applied, thanks Julia.

--=20
Jiri Kosina
SUSE Labs
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
