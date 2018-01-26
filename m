From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 26 Jan 2018 15:45:13 +0000
Subject: Re: [PATCH -next] crypto: stm32 - remove redundant dev_err call in stm32_cryp_probe()
Message-Id: <20180126154513.GE4002@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516189224-11877-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516189224-11877-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, Jan 17, 2018 at 11:40:24AM +0000, Wei Yongjun wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
