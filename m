From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 17 Nov 2015 13:47:39 +0000
Subject: Re: [PATCH 2/4] crypto-ixp4xx: Two function calls less in init_ixp_crypto() after error detection
Message-Id: <20151117134739.GA9422@gondor.apana.org.au>
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
 <5648D40B.8020002@users.sourceforge.net>
In-Reply-To: <5648D40B.8020002@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sun, Nov 15, 2015 at 07:50:51PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 15 Nov 2015 18:28:39 +0100
> 
> The dma_pool_destroy() function was called twice with a null pointer
> if a "npe_error" was reported.
> 
> This implementation detail could be improved by the introduction
> of another jump label.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/crypto/ixp4xx_crypto.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/crypto/ixp4xx_crypto.c b/drivers/crypto/ixp4xx_crypto.c
> index e52496a..efe0eca 100644
> --- a/drivers/crypto/ixp4xx_crypto.c
> +++ b/drivers/crypto/ixp4xx_crypto.c
> @@ -509,9 +509,11 @@ static int init_ixp_crypto(struct device *dev)
>  npe_error:
>  	printk(KERN_ERR "%s not responding\n", npe_name(npe_c));
>  	ret = -EIO;
> +	goto release_npe;
>  err:
>  	dma_pool_destroy(ctx_pool);
>  	dma_pool_destroy(buffer_pool);
> +release_npe:
>  	npe_release(npe_c);
>  	return ret;

I think this patch is making the code worse so I'm not applying it.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
