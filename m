From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 20 Feb 2019 11:29:14 +0000
Subject: Re: [PATCH -next] hwrng: make symbol 'optee_rng_id_table' static
Message-Id: <CAFA6WYMU0GwYaOgyoCAKSUat0kHOGRnV6UWG0Co0EfHrpO4ryA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190220093458.159208-1-weiyongjun1@huawei.com>
 <CAFA6WYODEymSPh6gQjUL3wRmoPy=zoMv-Z1Q1TbKtWFH=UUgMw@mail.gmail.com>
 <CAKv+Gu9yWEVvvoh8KOX1waZUrM1hy+P99Rxh3U2nPYE_sgyJzQ@mail.gmail.com> <8a3ff7ae-9257-82f1-70e2-91cc77aa7377@canonical.com>
In-Reply-To: <8a3ff7ae-9257-82f1-70e2-91cc77aa7377@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, 20 Feb 2019 at 16:19, Colin Ian King <colin.king@canonical.com> wrote:
>
> On 20/02/2019 10:37, Ard Biesheuvel wrote:
> > On Wed, 20 Feb 2019 at 11:34, Sumit Garg <sumit.garg@linaro.org> wrote:
> >>
> >> On Wed, 20 Feb 2019 at 14:51, Wei Yongjun <weiyongjun1@huawei.com> wrote:
> >>>
> >>> Fixes the following sparse warning:
> >>>
> >>> drivers/char/hw_random/optee-rng.c:265:35: warning:
> >>>  symbol 'optee_rng_id_table' was not declared. Should it be static?
> >>>
> >>
> >> I haven't observed this warning during my normal Linux build using
> >> gcc. Is there any specific configuration you are using?
> >>
> >
> > This is a sparse warning, not GCC. You need to install it separately
> > and build with C=1 (iirc)
> >

TBH, I wasn't aware about this sparse tool. I did install sparse and
build with C=1 option. But I could only get following such
errors/warnings for drivers/char/hw_random/optee-rng.c:

./arch/arm64/include/asm/lse.h:18:37: warning: Unknown escape 'l'
./arch/arm64/include/asm/alternative.h:213:28: warning: Unknown escape 'o'
./include/linux/compiler.h:194:8: error: attribute '__gnu_inline__':
unknown attribute

But not the one mentioned in this patch.

> It's useful to may these symbols static just to reduce the scope and
> there is on-going work to fix these symbols up across the entire kernel
>

Agree with this patch to make optee_rng_id_table symbol static.
Actually I was curious to know the approach used to get these type of
warnings so that they could be fixed beforehand.

-Sumit
