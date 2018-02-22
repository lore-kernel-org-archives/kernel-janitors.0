From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 22 Feb 2018 15:12:30 +0000
Subject: Re: [PATCH 0/4] Ux500 crypto: Adjustments for ux500_cryp_probe()
Message-Id: <20180222151230.GF29815@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20dcb583-5455-b5b9-94df-db9d1e21931f@users.sourceforge.net>
In-Reply-To: <20dcb583-5455-b5b9-94df-db9d1e21931f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Geliang Tang <geliangtang@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Feb 14, 2018 at 11:16:39AM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 14 Feb 2018 11:12:34 +0100
> 
> A few update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (4):
>   Delete an error message for a failed memory allocation
>   Adjust two condition checks
>   Adjust an error message
>   Delete two unnecessary variable initialisations
> 
>  drivers/crypto/ux500/cryp/cryp_core.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
