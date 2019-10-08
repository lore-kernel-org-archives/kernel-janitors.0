From: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
Date: Tue, 08 Oct 2019 08:33:34 +0000
Subject: RE: [PATCH][next] crypto: inside-secure: fix spelling mistake "algorithmn" -> "algorithm"
Message-Id: <MN2PR20MB297358121F5F6D5B4B07ED13CA9A0@MN2PR20MB2973.namprd20.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191008081410.18857-1-colin.king@canonical.com>
         <MN2PR20MB29735A64971670E9CE56821ECA9A0@MN2PR20MB2973.namprd20.prod.outlook.com>
 <f7fada8a8afce542e5ac08f804df8d5c8d8a726b.camel@perches.com>
In-Reply-To: <f7fada8a8afce542e5ac08f804df8d5c8d8a726b.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Colin King <colin.king@canonical.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> -----Original Message-----
> From: Joe Perches <joe@perches.com>
> Sent: Tuesday, October 8, 2019 10:29 AM
> To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>; Colin King <colin.king@canonical.com>;
> Antoine Tenart <antoine.tenart@bootlin.com>; Herbert Xu <herbert@gondor.apana.org.au>; David S .
> Miller <davem@davemloft.net>; linux-crypto@vger.kernel.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH][next] crypto: inside-secure: fix spelling mistake "algorithmn" ->
> "algorithm"
> 
> On Tue, 2019-10-08 at 08:15 +0000, Pascal Van Leeuwen wrote:
> > > There is a spelling mistake in a dev_err message. Fix it.
> []
> > > diff --git a/drivers/crypto/inside-secure/safexcel_cipher.c b/drivers/crypto/inside-
> []
> > > @@ -437,7 +437,7 @@ static int safexcel_aead_setkey(struct crypto_aead *ctfm, const u8 *key,
> > >  			goto badkey;
> > >  		break;
> > >  	default:
> > > -		dev_err(priv->dev, "aead: unsupported hash algorithmn");
> > > +		dev_err(priv->dev, "aead: unsupported hash algorithm");
> > >  		goto badkey;
> > >  	}
> []
> > Actually, the typing error is well spotted, but the fix is not correct.
> > What actually happened here is that a \ got accidentally deleted,
> > there should have been a "\n" at the end of the line ...
> 
> Other missing newlines in the same file:
> ---
>  drivers/crypto/inside-secure/safexcel_cipher.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/crypto/inside-secure/safexcel_cipher.c b/drivers/crypto/inside-
> secure/safexcel_cipher.c
> index cecc56073337..47fec8a0a4e1 100644
> --- a/drivers/crypto/inside-secure/safexcel_cipher.c
> +++ b/drivers/crypto/inside-secure/safexcel_cipher.c
> @@ -695,21 +695,21 @@ static int safexcel_send_req(struct crypto_async_request *base, int ring,
>  		sreq->nr_dst = sreq->nr_src;
>  		if (unlikely((totlen_src || totlen_dst) &&
>  		    (sreq->nr_src <= 0))) {
> -			dev_err(priv->dev, "In-place buffer not large enough (need %d bytes)!",
> +			dev_err(priv->dev, "In-place buffer not large enough (need %d bytes)!\n",
>  				max(totlen_src, totlen_dst));
>  			return -EINVAL;
>  		}
>  		dma_map_sg(priv->dev, src, sreq->nr_src, DMA_BIDIRECTIONAL);
>  	} else {
>  		if (unlikely(totlen_src && (sreq->nr_src <= 0))) {
> -			dev_err(priv->dev, "Source buffer not large enough (need %d bytes)!",
> +			dev_err(priv->dev, "Source buffer not large enough (need %d bytes)!\n",
>  				totlen_src);
>  			return -EINVAL;
>  		}
>  		dma_map_sg(priv->dev, src, sreq->nr_src, DMA_TO_DEVICE);
> 
>  		if (unlikely(totlen_dst && (sreq->nr_dst <= 0))) {
> -			dev_err(priv->dev, "Dest buffer not large enough (need %d bytes)!",
> +			dev_err(priv->dev, "Dest buffer not large enough (need %d bytes)!\n",
>  				totlen_dst);
>  			dma_unmap_sg(priv->dev, src, sreq->nr_src,
>  				     DMA_TO_DEVICE);

Yes, thanks!

Acked-by: Pascal van Leeuwen <pvanleeuwen@verimatrix.com>

Regards,
Pascal van Leeuwen
Silicon IP Architect, Multi-Protocol Engines @ Verimatrix
www.insidesecure.com
