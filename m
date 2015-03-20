From: James Hartley <James.Hartley@imgtec.com>
Date: Fri, 20 Mar 2015 18:55:56 +0000
Subject: RE: [patch 2/2] crypto: img-hash - shift wrapping bug in img_hash_hw_init()
Message-Id: <72BC0C8BD7BB6F45988A99382E5FBAE54446CD50@hhmail02.hh.imgtec.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150320142144.GB5108@mwanda>
In-Reply-To: <20150320142144.GB5108@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan, 

I'm assuming you mean the upper 3 bits rather than bytes?

Thanks for the patch

James.

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: 20 March 2015 14:22
> To: Herbert Xu; James Hartley
> Cc: David S. Miller; linux-crypto@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [patch 2/2] crypto: img-hash - shift wrapping bug in
> img_hash_hw_init()
> 
> "hdev->req->nbytes" is an unsigned int so we so we lose the upper 3 bytes to
> the shift wrap bug.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/crypto/img-hash.c b/drivers/crypto/img-hash.c index
> 601ab35..ad47d0d 100644
> --- a/drivers/crypto/img-hash.c
> +++ b/drivers/crypto/img-hash.c
> @@ -464,7 +464,7 @@ static int img_hash_hw_init(struct img_hash_dev
> *hdev)
>  	img_hash_write(hdev, CR_RESET, CR_RESET_UNSET);
>  	img_hash_write(hdev, CR_INTENAB, CR_INT_NEW_RESULTS_SET);
> 
> -	nbits = (hdev->req->nbytes << 3);
> +	nbits = (u64)hdev->req->nbytes << 3;
>  	u = nbits >> 32;
>  	l = nbits;
>  	img_hash_write(hdev, CR_MESSAGE_LENGTH_H, u);
