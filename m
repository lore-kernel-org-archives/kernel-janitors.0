From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Wed, 16 Jan 2019 08:59:13 +0000
Subject: Re: [PATCH 4/4] drm/sun4i: backend: add missing of_node_puts
Message-Id: <20190116085913.j2ju3mj75x5bqppm@flea>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="dunppgcxmo5qgg5l"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547369264-24831-1-git-send-email-Julia.Lawall@lip6.fr>
 <1547369264-24831-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1547369264-24831-5-git-send-email-Julia.Lawall@lip6.fr>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org


--dunppgcxmo5qgg5l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 13, 2019 at 09:47:44AM +0100, Julia Lawall wrote:
> The device node iterators perform an of_node_get on each
> iteration, so a jump out of the loop requires an of_node_put.
>=20
> Remote and port also have augmented reference counts, so drop them
> on each iteration and at the end of the function, respectively.
> Remote is only used for the address it contains, not for the
> contents of that address, so the reference count can be dropped
> immediately.
>=20
> The semantic patch that fixes the first part of this problem is
> as follows (http://coccinelle.lip6.fr):
>=20
> // <smpl>
> @@
> expression root,e;
> local idexpression child;
> iterator name for_each_child_of_node;
> @@
>=20
>  for_each_available_child_of_node(root, child) {
>    ... when !=3D of_node_put(child)
>        when !=3D e =3D child
> +  of_node_put(child);
> ?  break;
>    ...
> }
> ... when !=3D child
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--dunppgcxmo5qgg5l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXD7yYQAKCRDj7w1vZxhR
xYlyAQDwvaT1Fd85U90xXfnNEaXT0VONYRQBfzXkZ5deO8x8igEA+PXurQWESJMf
cVGPanmyDaAWOtjRbYLKr4Tkn8cthAk=
=7q2T
-----END PGP SIGNATURE-----

--dunppgcxmo5qgg5l--
