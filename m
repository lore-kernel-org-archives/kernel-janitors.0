From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Wed, 21 Aug 2013 11:51:10 +0000
Subject: Re: [patch] crypto: sahara - checking the wrong variable
Message-Id: <20130821115110.GF23287@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130820085141.GA7469@elgon.mountain>
In-Reply-To: <20130820085141.GA7469@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 20, 2013 at 11:51:41AM +0300, Dan Carpenter wrote:
> There is a typo here.  "dev->hw_link[]" is an array, not a pointer, so
> the check is nonsense.  We should be checking recently allocated
> "dev->hw_link[0]" instead.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
