From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Feb 2019 10:45:56 +0000
Subject: Re: [PATCH -next] hwrng: make symbol 'optee_rng_id_table' static
Message-Id: <20190220104556.GO17104@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190220093458.159208-1-weiyongjun1@huawei.com>
 <CAFA6WYODEymSPh6gQjUL3wRmoPy=zoMv-Z1Q1TbKtWFH=UUgMw@mail.gmail.com>
In-Reply-To: <CAFA6WYODEymSPh6gQjUL3wRmoPy=zoMv-Z1Q1TbKtWFH=UUgMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Feb 20, 2019 at 04:04:17PM +0530, Sumit Garg wrote:
> On Wed, 20 Feb 2019 at 14:51, Wei Yongjun <weiyongjun1@huawei.com> wrote:
> >
> > Fixes the following sparse warning:
                        ^^^^^^

> >
> > drivers/char/hw_random/optee-rng.c:265:35: warning:
> >  symbol 'optee_rng_id_table' was not declared. Should it be static?
> >
> 
> I haven't observed this warning during my normal Linux build using
> gcc. Is there any specific configuration you are using?
> 

It's from the Sparse tool.

regards,
dan carpenter
