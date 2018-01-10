From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 10 Jan 2018 14:24:19 +0000
Subject: Re: [PATCH -next] hwrng: exynos - remove redundant dev_err call in exynos_trng_probe()
Message-Id: <CAJKOXPfQKHNxNe-3kOTpp9rUSoh3nLVhBxtZiyDJSoBgKLR4vg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1515591059-73230-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1515591059-73230-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: l.stelmach@samsung.com, mpm@selenic.com, herbert@gondor.apana.org.au, arnd@arndb.de, gregkh@linuxfoundation.org, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 10, 2018 at 2:30 PM, Wei Yongjun <weiyongjun1@huawei.com> wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/char/hw_random/exynos-trng.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
