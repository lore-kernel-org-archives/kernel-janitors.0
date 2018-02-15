From: =?iso-8859-2?Q?Horia_Geant=E3?= <horia.geanta@nxp.com>
Date: Thu, 15 Feb 2018 08:03:24 +0000
Subject: Re: [PATCH 2/2] crypto: caam: Use common error handling code in four functions
Message-Id: <VI1PR0402MB3342F9E0700AA3A7CC20D8DC98F40@VI1PR0402MB3342.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9a9a602d-93da-457d-c37d-2acbb4b7b5d5@users.sourceforge.net>
 <3c2905a1-b3a4-be87-618e-8562d3a5d8b4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Aymen Sghaier <aymen.sghaier@nxp.com>, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On 2/14/2018 8:32 PM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 14 Feb 2018 19:14:49 +0100
> 
> Add jump targets so that a bit of exception handling can be better reused
> at the end of these functions.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
[snip]
> @@ -1096,6 +1092,7 @@ static int ahash_digest(struct ahash_request *req)
>  	if (!ret) {
>  		ret = -EINPROGRESS;
>  	} else {
> +unmap_hash:
>  		ahash_unmap(jrdev, edesc, req, digestsize);
>  		kfree(edesc);
>  	}
> 
I understand jumps are a necessary evil for dealing with shortcomings of C,
however please avoid jumping in an if/else branch.

Code could be rewritten as:

  	if (!ret)
  		return -EINPROGRESS;

unmap_hash:
  	ahash_unmap(jrdev, edesc, req, digestsize);
  	kfree(edesc);

Thanks,
Horia
