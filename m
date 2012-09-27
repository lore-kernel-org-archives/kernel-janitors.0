From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 27 Sep 2012 05:43:57 +0000
Subject: Re: [PATCH 1/4] drivers/crypto/ux500/cryp/cryp_core.c: fix error return code
Message-Id: <20120927054356.GB22311@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347902908-19006-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1347902908-19006-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: davem@davemloft.net, linus.walleij@linaro.org, andreas.westin@stericsson.com, rjw@sisk.pl, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Sep 17, 2012 at 07:28:25PM +0200, Peter Senna Tschudin wrote:
> From: Peter Senna Tschudin <peter.senna@gmail.com>
> 
> Convert a nonnegative error return code to a negative one, as returned
> elsewhere in the function.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)

All four patches applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
