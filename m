From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Wed, 13 May 2015 03:15:20 +0000
Subject: Re: [patch -next] crypto: talitos - fix size calculation in talitos_edesc_alloc()
Message-Id: <20150513031520.GA24980@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150511101009.GA12395@mwanda>
 <5550B010.60008@c-s.fr>
In-Reply-To: <5550B010.60008@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: leroy christophe <christophe.leroy@c-s.fr>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, May 11, 2015 at 03:35:12PM +0200, leroy christophe wrote:
>=20
>=20
> Le 11/05/2015 12:10, Dan Carpenter a =E9crit :
> >The + operation has higher precedence than ?: so we need parentheses
> >here.  Otherwise we may end up allocating a max of only one "cryptlen"
> >instead of two.
> >
> >Fixes: 6f65f6ac5fb3 ('crypto: talitos - implement scatter/gather copy fo=
r SEC1')
> >Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied.
--=20
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
