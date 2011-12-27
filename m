From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Tue, 27 Dec 2011 14:45:45 +0000
Subject: Re: [PATCH 6/6] drivers/mtd/nand/txx9ndfmc.c: use
Message-Id: <1324997145.1165.88.camel@sauron.fi.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-W1TcKR9OAHbrLCqRr8Ys"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1324994491-21828-1-git-send-email-julia@diku.dk>
 <1324994491-21828-7-git-send-email-julia@diku.dk>
In-Reply-To: <1324994491-21828-7-git-send-email-julia@diku.dk>
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org


--=-W1TcKR9OAHbrLCqRr8Ys
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-12-27 at 15:01 +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
>=20
> Reimplement a call to devm_request_mem_region followed by a call to iorem=
ap
> or ioremap_nocache by a call to devm_request_and_ioremap.
>=20
> The semantic patch that makes this transformation is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @nm@
> expression myname;
> identifier i;
> @@
>=20
> struct platform_driver i =3D { .driver =3D { .name =3D myname } };
>=20
> @@
> expression dev,res,size;
> expression nm.myname;
> @@
>=20
> -if (!devm_request_mem_region(dev, res->start, size,
> -                              \(res->name\|dev_name(dev)\|myname\))) {
> -   ...
> -   return ...;
> -}
> ... when !=3D res->start
> (
> -devm_ioremap(dev,res->start,size)
> +devm_request_and_ioremap(dev,res)
> |
> -devm_ioremap_nocache(dev,res->start,size)
> +devm_request_and_ioremap(dev,res)
> )
> ... when any
>     when !=3D res->start
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <julia@diku.dk>

Pushed to l2-mtd-2.6.git, thanks!

I think this semantic patch is also useful and deserves to be added to
scripts/coccinelle. In general, it would be great if you sumbitted
useful spatches there for inclusion.

--=20
Best Regards,
Artem Bityutskiy

--=-W1TcKR9OAHbrLCqRr8Ys
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO+doZAAoJECmIfjd9wqK0p+oP/1GZrSvOTgYuqLi9TVBIUKMh
yR/S0dY9EIt40BcsCiyjCoqiOKIjaKN5SYaw2EChNEFtyiuuHWlyahxQAKCQwRwK
C3J3OYeVxdhdtcfCz2cN626lT25z3nZWV29qXD3ABq5H/vke6r4A2cI29c2AutQA
8WrH33+eNbRHYNMdBY6gsRp/AyYi8kJW6FuNrylDwmc1rOyqpl2iiLylpUJD4vux
afjH4Gx2JufNoUCxo6a2Im3J+ktk1k2NibUJU8bjCAfdd0tsUnQiMePR8JJirbPa
qei3X/bYzSaAK0t0XHi2K6bYuAcUchalGGgIz4zA9qQ+qz5zMfxT2mDU816xx8Ke
Np4Wwl+Qr9/CGt8oCbF7WMhJIr3Q6dftXBQssWZme39qlux5iW+J9VAODkR4CGTs
YenMycygacJFrgYu3M0rQaTjBJbMB2JMpO4tmilh6rg2ITeN+izIKftm5E+X+dfK
edariT1LbIkwEnUSQ3VTMhtRLhYhRJc4p7mAnIGLOszXC1/8PPWN8fhJ4a69nbey
5At6qFC4vyI9tjoqOOzxNOf8ecPwzfiLCTgV6kfpECzt9Ryvu2oErnyPu8m9YH0M
wMohRF1B7cu4H8SLVpU7rwVR+FWbpj1xb85IBvf/ddFRitPQ7WdY+RMmUS7QWY3/
N2MIKneAn5oOLYNbwXQW
=VNdQ
-----END PGP SIGNATURE-----

--=-W1TcKR9OAHbrLCqRr8Ys--

