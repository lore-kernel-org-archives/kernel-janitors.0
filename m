From: Stephan Mueller <smueller@chronox.de>
Date: Fri, 17 Jun 2016 09:23:00 +0000
Subject: Re: [patch] crypto: drbg - fix an error code in drbg_init_sym_kernel()
Message-Id: <1997601.iEDOaUsuK2@tauon.atsec.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160617091618.GC25609@mwanda> <1774858.Ao0ox7E6zA@tauon.atsec.com>
In-Reply-To: <1774858.Ao0ox7E6zA@tauon.atsec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Am Freitag, 17. Juni 2016, 11:19:58 schrieb Stephan Mueller:

Hi Stephan,

> Am Freitag, 17. Juni 2016, 12:16:19 schrieb Dan Carpenter:
> 
> Hi Dan,
> 
> > We accidentally return PTR_ERR(NULL) which is success but we should
> > return -ENOMEM.
> > 
> > Fixes: 355912852115 ('crypto: drbg - use CTR AES instead of ECB AES')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Acked-by: Stephan Mueller <smueller@chronox.de>
> 
> That points to an error in the documentation of skcipher_request_alloc.

Apologies, that documentation issue has already been fixed in the 
cryptodev-2.6 tree. I was looking at the vanilla 4.6 tree for the 
documentation while I was preparing my patch.

Ciao
Stephan
