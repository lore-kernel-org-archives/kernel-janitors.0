From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Wed, 21 Aug 2013 11:51:18 +0000
Subject: Re: [patch] crypto: tegra-aes - bitwise vs logical and
Message-Id: <20130821115118.GG23287@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130820085447.GA20170@elgon.mountain>
In-Reply-To: <20130820085447.GA20170@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Stephen Warren <swarren@wwwdotorg.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-crypto@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 20, 2013 at 11:54:48AM +0300, Dan Carpenter wrote:
> The bug here is that:
> 
> 	while (eng_busy & (!icq_empty) & dma_busy)
> 
> is never true because it's using bitwise instead of logical ANDs.  The
> other bitwise AND conditions work as intended but I changed them as well
> for consistency.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Also applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
