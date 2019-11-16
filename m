From: Corentin Labbe <clabbe.montjoie@gmail.com>
Date: Sat, 16 Nov 2019 19:47:48 +0000
Subject: Re: [PATCH v2 -next] crypto: sun8i-ce - Fix memdup.cocci warnings
Message-Id: <20191116194748.GA23118@Red>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191109024403.47106-1-yuehaibing@huawei.com>
 <20191112072314.145064-1-yuehaibing@huawei.com>
In-Reply-To: <20191112072314.145064-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Tue, Nov 12, 2019 at 07:23:14AM +0000, YueHaibing wrote:
> Use kmemdup rather than duplicating its implementation
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v2: fix patch title 'sun8i-ss' -> 'sun8i-ce'
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

Acked-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Thanks
