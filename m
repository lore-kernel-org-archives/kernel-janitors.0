From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 15 Feb 2018 15:42:21 +0000
Subject: Re: [PATCH -next] hwrng: make symbol imx_rngc_pm_ops static
Message-Id: <20180215154221.GC7352@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516673336-170194-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516673336-170194-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Matt Mackall <mpm@selenic.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin Kaiser <martin@kaiser.cx>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jan 23, 2018 at 02:08:56AM +0000, Wei Yongjun wrote:
> Fixes the following sparse warnings:
> 
> drivers/char/hw_random/imx-rngc.c:303:1: warning:
>  symbol 'imx_rngc_pm_ops' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
