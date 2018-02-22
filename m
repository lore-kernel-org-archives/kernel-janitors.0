From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 22 Feb 2018 15:12:40 +0000
Subject: Re: [PATCH 0/2] crypto/sahara: Adjustments for sahara_probe()
Message-Id: <20180222151240.GG29815@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6a487cd1-c05c-3d5d-ec6b-a6a2ae376f05@users.sourceforge.net>
In-Reply-To: <6a487cd1-c05c-3d5d-ec6b-a6a2ae376f05@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Feb 14, 2018 at 02:32:28PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 14 Feb 2018 14:30:28 +0100
> 
> Two update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (2):
>   Delete an error message for a failed memory allocation
>   Improve a size determination
> 
>  drivers/crypto/sahara.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
