From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Wed, 18 Nov 2015 00:03:58 +0000
Subject: Re: [PATCH v2 0/3] crypto-ixp4xx: Deletion of a few unnecessary checks
Message-Id: <20151118000358.GA13894@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <5648D2C1.8050603@users.sourceforge.net>
 <564B489F.10308@users.sourceforge.net>
In-Reply-To: <564B489F.10308@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Tue, Nov 17, 2015 at 04:32:47PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 17 Nov 2015 16:26:01 +0100
> Subject: [PATCH 0/3] crypto-ixp4xx: Deletion of a few unnecessary checks
> 
> Further update suggestions were taken into account after a patch
> was applied from static source code analysis.
> 
> Markus Elfring (3):
>   Delete unnecessary checks before the function call "dma_pool_destroy"
>   Reduce assignment for a variable in init_ixp_crypto()
>   crypto-ixp4xx: Less function calls in init_ixp_crypto() after error detection

You completely ignored my comments.  Nack.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
