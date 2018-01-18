From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 18 Jan 2018 12:02:24 +0000
Subject: Re: [PATCH] hwrng: exynos - Signedness bug in exynos_trng_do_read()
Message-Id: <20180118120224.GD20717@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180110093658.kxnmhqkoow7o2xab@mwanda>
In-Reply-To: <20180110093658.kxnmhqkoow7o2xab@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>, Matt Mackall <mpm@selenic.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 10, 2018 at 12:36:58PM +0300, Dan Carpenter wrote:
> "val" needs to be signed for the error handling to work.
> 
> Fixes: 6cd225cc5d8a ("hwrng: exynos - add Samsung Exynos True RNG driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
