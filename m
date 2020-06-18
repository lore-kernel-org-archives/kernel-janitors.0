From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 18 Jun 2020 10:44:11 +0000
Subject: Re: [PATCH] crypto: caam/qi2: remove redundant assignment to ret
Message-Id: <20200618104411.GA10882@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200611153934.928021-1-colin.king@canonical.com>
 <20200618075816.GI10091@gondor.apana.org.au>
 <5452e045-bd48-3b29-b364-bf123540ae21@nxp.com>
In-Reply-To: <5452e045-bd48-3b29-b364-bf123540ae21@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>
Cc: Colin King <colin.king@canonical.com>, Aymen Sghaier <aymen.sghaier@nxp.com>, "David S . Miller" <davem@davemloft.net>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jun 18, 2020 at 01:40:55PM +0300, Horia Geant=C4=83 wrote:
> On 6/18/2020 10:58 AM, Herbert Xu wrote:
> > On Thu, Jun 11, 2020 at 04:39:34PM +0100, Colin King wrote:
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> The variable ret is being assigned a value that is never read, the
> >> error exit path via label 'unmap' returns -ENOMEM anyhow, so assigning
> >> ret with -ENOMEM is redundamt.
> >>
> >> Addresses-Coverity: ("Unused value")
> >> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >> ---
> >>  drivers/crypto/caam/caamalg_qi2.c | 2 --
> >>  1 file changed, 2 deletions(-)
> >=20
> > Patch applied.  Thanks.
> >=20
> Unfortunately I missed this patch, and it doesn't look correct.
>=20
> Do I need to send a revert?

No please check again.  The patch is correct.

Thanks,
--=20
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
