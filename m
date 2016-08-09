From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 09 Aug 2016 10:59:05 +0000
Subject: Re: [PATCH 0/2] Fix a resource release omission in error handling code
Message-Id: <20160809105905.GA7099@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160722133242.21916-1-lambert.quentin@gmail.com>
In-Reply-To: <20160722133242.21916-1-lambert.quentin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jul 22, 2016 at 03:32:40PM +0200, Quentin Lambert wrote:
> The first patch is a style fix, the second add calls to npe_release.
> The reason for me thinking that they are necessary is that every other branches
> leading to an error return are calling this function.

Both patches applied.  BTW, your patches came in the wrong order.
Please send them in the correct order next time.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
