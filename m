From: Sebastian Reichel <sre@kernel.org>
Date: Fri, 28 Apr 2017 07:56:00 +0000
Subject: Re: [PATCH] HSI: ssi_protocol: double free in ssip_pn_xmit()
Message-Id: <20170428075559.kip75xju74m6qrkh@earth>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="bw47uq43f64j4uyw"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170421103909.y5zdbq7joxw6leam@mwanda>
In-Reply-To: <20170421103909.y5zdbq7joxw6leam@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jarod Wilson <jarod@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--bw47uq43f64j4uyw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 21, 2017 at 01:39:09PM +0300, Dan Carpenter wrote:
> If skb_pad() fails then it frees skb and we don't need to free it again
> at the end of the function.
>=20
> Fixes: dc7bf5d7 ("HSI: Introduce driver for SSI Protocol")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/hsi/clients/ssi_protocol.c b/drivers/hsi/clients/ssi=
_protocol.c
> index 7ef819680acd..26b05106f0d3 100644
> --- a/drivers/hsi/clients/ssi_protocol.c
> +++ b/drivers/hsi/clients/ssi_protocol.c
> @@ -980,7 +980,7 @@ static int ssip_pn_xmit(struct sk_buff *skb, struct n=
et_device *dev)
>  		goto drop;
>  	/* Pad to 32-bits - FIXME: Revisit*/
>  	if ((skb->len & 3) && skb_pad(skb, 4 - (skb->len & 3)))
> -		goto drop;
> +		goto inc_dropped;
> =20
>  	/*
>  	 * Modem sends Phonet messages over SSI with its own endianess...
> @@ -1032,8 +1032,9 @@ static int ssip_pn_xmit(struct sk_buff *skb, struct=
 net_device *dev)
>  drop2:
>  	hsi_free_msg(msg);
>  drop:
> -	dev->stats.tx_dropped++;
>  	dev_kfree_skb(skb);
> +inc_dropped:
> +	dev->stats.tx_dropped++;
> =20
>  	return 0;
>  }

Thanks, queued.

-- Sebastian

--bw47uq43f64j4uyw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlkC9Y0ACgkQ2O7X88g7
+pq4JA//YG0iffoDpMpSDFqeejrKwKPiodOTcGY85BcSwwoHoJbmQwa6yH60IuYx
b2k85H64KLc28NbEcpWVv0zeBnWbC4pONQrhYHq7zwiBG3jhssx/gOTNyGr6UOig
Q6YN/xWXuX90a0ldF5aFmx2bvm04JIPF6fZUvRljlQR1jeJd8lvLrmW9aiOl7VkI
qY60KL25F5jT8vklOO5D8HGkusVzqDdu5th9Pw1FXT6f6T1svDivcQoeEUThO+G0
Yw6dEB+PE0bYplWFvVnmRUjZpLssOfGtuK0+qmGSUOecZrQJZfqW1ymkN64kw48r
vuwxJHU7rRT6exl4UxOGeGF/cwa5tIlZH3x08aGbDI6zEvynQNUWQz4VBalN4ey9
hBy8CURjfn6ZECpq6wyWyDnWFxa+qXPjxWYvfC6XbaE9aaWBlI0U9GCVwuDRmnCp
Vbe5Iyj6YdADX27T8gZOIDzsr6rB1sn3MXmbXZxjK2JeDyru56qudRDHStdKCNGQ
aceAUrUs1X6vZNYPl77xtPi/V2cBe8d10nUNJzdzrpmvA+mdelnkdF84Y1t3PJ5c
mKPiQEgKqTr1ngJE2a3K1VqG9IS1/yK24+c5nFjWfvD0zaZtm3oqricROCJiOPGx
P4g2xdrdBoKUPcRFiOGwJzMMTvbW9vZA7Cw1/0osIJR8LzRoFfQ=
=p/ut
-----END PGP SIGNATURE-----

--bw47uq43f64j4uyw--
