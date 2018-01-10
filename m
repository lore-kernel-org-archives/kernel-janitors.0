From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 10 Jan 2018 10:06:56 +0000
Subject: Re: [PATCH] hwrng: exynos - Signedness bug in exynos_trng_do_read()
Message-Id: <CAJKOXPd0EzE02OOC0zqsNOxO7p6zuhPCdGs_okF_-X0sWWxZOA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180110093658.kxnmhqkoow7o2xab@mwanda>
In-Reply-To: <20180110093658.kxnmhqkoow7o2xab@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 10, 2018 at 10:36 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> "val" needs to be signed for the error handling to work.
>
> Fixes: 6cd225cc5d8a ("hwrng: exynos - add Samsung Exynos True RNG driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/char/hw_random/exynos-trng.c b/drivers/char/hw_random/exynos-trng.c
> index 34d6f51ecbee..f4643e3ec346 100644
> --- a/drivers/char/hw_random/exynos-trng.c
> +++ b/drivers/char/hw_random/exynos-trng.c
> @@ -55,7 +55,7 @@ static int exynos_trng_do_read(struct hwrng *rng, void *data, size_t max,
>                                bool wait)
>  {
>         struct exynos_trng_dev *trng;
> -       u32 val;
> +       int val;

It seems that one forgot to run Smatch on the driver :).

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
