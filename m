From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 18 Apr 2019 14:23:57 +0000
Subject: Re: [PATCH -next] crypto: remove set but not used variable 'fini'
Message-Id: <20190418142356.rhdw5ysxvf6aehox@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190410024742.2103-1-yuehaibing@huawei.com>
In-Reply-To: <20190410024742.2103-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, kernel-janitors@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org

On Wed, Apr 10, 2019 at 02:47:42AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/crypto/mxs-dcp.c: In function 'dcp_chan_thread_sha':
> drivers/crypto/mxs-dcp.c:707:11: warning:
>  variable 'fini' set but not used [-Wunused-but-set-variable]
> 
> It's not used since commit d80771c08363 ("crypto: mxs-dcp - Fix wait
> logic on chan threads"),so can be removed.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/crypto/mxs-dcp.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
