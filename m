From: James Hartley <James.Hartley@imgtec.com>
Date: Fri, 20 Mar 2015 18:55:49 +0000
Subject: RE: [patch 1/2] crypto: img-hash - fix some compile warnings
Message-Id: <72BC0C8BD7BB6F45988A99382E5FBAE54446CD49@hhmail02.hh.imgtec.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150320142112.GA5108@mwanda>
In-Reply-To: <20150320142112.GA5108@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan, 

Thanks for the patch.

James.

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: 20 March 2015 14:21
> To: Herbert Xu; James Hartley
> Cc: David S. Miller; linux-crypto@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [patch 1/2] crypto: img-hash - fix some compile warnings
> 
> GCC complains about that %u is the wrong format string for size_t and also that
> "ret" is unused.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/crypto/img-hash.c b/drivers/crypto/img-hash.c index
> fec61fc..601ab35 100644
> --- a/drivers/crypto/img-hash.c
> +++ b/drivers/crypto/img-hash.c
> @@ -192,7 +192,7 @@ static int img_hash_xmit_cpu(struct img_hash_dev
> *hdev, const u8 *buf,
>  	u32 count, len32;
>  	const u32 *buffer = (const u32 *)buf;
> 
> -	dev_dbg(hdev->dev, "xmit_cpu:  length: %u bytes\n", length);
> +	dev_dbg(hdev->dev, "xmit_cpu:  length: %zu bytes\n", length);
> 
>  	if (final)
>  		hdev->flags |= DRIVER_FLAGS_FINAL;
> @@ -459,7 +459,6 @@ static int img_hash_hw_init(struct img_hash_dev
> *hdev)  {
>  	unsigned long long nbits;
>  	u32 u, l;
> -	int ret;
> 
>  	img_hash_write(hdev, CR_RESET, CR_RESET_SET);
>  	img_hash_write(hdev, CR_RESET, CR_RESET_UNSET);
