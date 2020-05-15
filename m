From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 15 May 2020 06:15:57 +0000
Subject: Re: [PATCH -next] crypto: xilinx - Remove set but not used variable 'drv_ctx'
Message-Id: <20200515061557.GA11092@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200505101200.195184-1-yuehaibing@huawei.com>
References: <20200505101200.195184-1-yuehaibing@huawei.com>
In-Reply-To: <20200505101200.195184-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: kernel-janitors@vger.kernel.org, rajan.vaja@xilinx.com, gregkh@linuxfoundation.org, michal.simek@xilinx.com, hulkci@huawei.com, linux-crypto@vger.kernel.org, kalyani.akula@xilinx.com, jolly.shah@xilinx.com, linux-arm-kernel@lists.infradead.org

YueHaibing <yuehaibing@huawei.com> wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/crypto/xilinx/zynqmp-aes-gcm.c: In function 'zynqmp_aes_aead_cipher':
> drivers/crypto/xilinx/zynqmp-aes-gcm.c:83:30: warning:
> variable 'drv_ctx' set but not used [-Wunused-but-set-variable]
> 
> commit bc86f9c54616 ("firmware: xilinx: Remove eemi ops for aes engine") left
> behind this, remove it.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> drivers/crypto/xilinx/zynqmp-aes-gcm.c | 4 ----
> 1 file changed, 4 deletions(-)

This patch doesn't apply to the current cryptodev tree.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
