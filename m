From: Horia Geanta Neag <horia.geanta@nxp.com>
Date: Thu, 15 Sep 2016 15:30:04 +0000
Subject: Re: crypto-caamhash: Fine-tuning for several function implementations
Message-Id: <DB4PR04MB08478A32519FC440E476FDEC98F00@DB4PR04MB0847.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <970e9e1b-c1dc-eb28-b380-92c15e9b1961@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Labbe Corentin <clabbe.montjoie@gmail.com>, Russell King <rmk+kernel@arm.linux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

On 9/15/2016 5:37 PM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 15 Sep 2016 16:27:23 +0200
>=20
> Some update suggestions were taken into account
> from static source code analysis.
>=20
> Markus Elfring (6):
>   Use kmalloc_array() in ahash_setkey()
>   Rename jump labels in ahash_setkey()
>   Rename a jump label in five functions
>   Return a value directly in caam_hash_cra_init()
>   Delete an unnecessary initialisation in seven functions
>   Move common error handling code in two functions
>=20
>  drivers/crypto/caam/caamhash.c | 111 +++++++++++++++++++----------------=
------
>  1 file changed, 52 insertions(+), 59 deletions(-)
>=20
Thanks Markus!

For patches 2-6:
Reviewed-by: Horia Geant=E3 <horia.geanta@nxp.com>

though headline prefix should be changed to "crypto: caam -"

Horia

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
