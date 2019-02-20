From: Jeffrey Walton <noloader@gmail.com>
Date: Wed, 20 Feb 2019 19:36:40 +0000
Subject: Re: [PATCH -next] hwrng: make symbol 'optee_rng_id_table' static
Message-Id: <CAH8yC8nBUUZHUrag9EDVrZ10vpFdiN5zxurdegxLo_u+RAH6AQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190220093458.159208-1-weiyongjun1@huawei.com>
In-Reply-To: <20190220093458.159208-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Sumit Garg <sumit.garg@linaro.org>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Feb 20, 2019 at 4:23 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Fixes the following sparse warning:
>
> drivers/char/hw_random/optee-rng.c:265:35: warning:
>  symbol 'optee_rng_id_table' was not declared. Should it be static?

Static limits visibility to the current translation unit. Static is
like private visibility.

Maybe you are thinking if it should be declared extern so other
translation units can find the symbol. extern is like public
visibility.

Jeff
