From: =?UTF-8?Q?Horia_Geant=c4=83?= <horia.geanta@nxp.com>
Date: Thu, 18 Jun 2020 13:16:29 +0000
Subject: Re: [PATCH] crypto: caam/qi2: remove redundant assignment to ret
Message-Id: <b351f9b5-940c-61d3-38f2-3654c6da55b0@nxp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200611153934.928021-1-colin.king@canonical.com>
 <8e08adcb-ef91-124d-d093-921fc97da3af@nxp.com>
 <20200618110050.GA10995@gondor.apana.org.au>
In-Reply-To: <20200618110050.GA10995@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Colin King <colin.king@canonical.com>, Aymen Sghaier <aymen.sghaier@nxp.com>, "David S . Miller" <davem@davemloft.net>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 6/18/2020 2:00 PM, Herbert Xu wrote:
> On Thu, Jun 18, 2020 at 01:54:55PM +0300, Horia Geant=C4=83 wrote:
>>
>> The proper fix would be updating the ahash_finup_no_ctx() function
>> to return the specific error code:
>> 	return ret;
>> instead of returning -ENOMEM for all error cases.
>>
>> For example error code returned by dpaa2_caam_enqueue()
>> should be returned instead of -ENOMEM.
>=20
> You can do that as a follow-up.  The patch is correct as is.
>=20
Just that the follow-up implies adding all the code back.

Anyway, not a big deal...

Thanks,
Horia
