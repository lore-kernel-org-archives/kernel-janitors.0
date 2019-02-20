From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 20 Feb 2019 10:49:08 +0000
Subject: Re: [PATCH -next] hwrng: make symbol 'optee_rng_id_table' static
Message-Id: <8a3ff7ae-9257-82f1-70e2-91cc77aa7377@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190220093458.159208-1-weiyongjun1@huawei.com>
 <CAFA6WYODEymSPh6gQjUL3wRmoPy=zoMv-Z1Q1TbKtWFH=UUgMw@mail.gmail.com>
 <CAKv+Gu9yWEVvvoh8KOX1waZUrM1hy+P99Rxh3U2nPYE_sgyJzQ@mail.gmail.com>
In-Reply-To: <CAKv+Gu9yWEVvvoh8KOX1waZUrM1hy+P99Rxh3U2nPYE_sgyJzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Sumit Garg <sumit.garg@linaro.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 20/02/2019 10:37, Ard Biesheuvel wrote:
> On Wed, 20 Feb 2019 at 11:34, Sumit Garg <sumit.garg@linaro.org> wrote:
>>
>> On Wed, 20 Feb 2019 at 14:51, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>>>
>>> Fixes the following sparse warning:
>>>
>>> drivers/char/hw_random/optee-rng.c:265:35: warning:
>>>  symbol 'optee_rng_id_table' was not declared. Should it be static?
>>>
>>
>> I haven't observed this warning during my normal Linux build using
>> gcc. Is there any specific configuration you are using?
>>
> 
> This is a sparse warning, not GCC. You need to install it separately
> and build with C=1 (iirc)
> 
It's useful to may these symbols static just to reduce the scope and
there is on-going work to fix these symbols up across the entire kernel
