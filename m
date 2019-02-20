From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 20 Feb 2019 16:33:13 +0000
Subject: Re: [PATCH -next] hwrng: make symbol 'optee_rng_id_table' static
Message-Id: <20190220163313.GA3454@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190220093458.159208-1-weiyongjun1@huawei.com>
 <CAFA6WYODEymSPh6gQjUL3wRmoPy=zoMv-Z1Q1TbKtWFH=UUgMw@mail.gmail.com>
 <CAKv+Gu9yWEVvvoh8KOX1waZUrM1hy+P99Rxh3U2nPYE_sgyJzQ@mail.gmail.com>
 <8a3ff7ae-9257-82f1-70e2-91cc77aa7377@canonical.com>
 <CAFA6WYMU0GwYaOgyoCAKSUat0kHOGRnV6UWG0Co0EfHrpO4ryA@mail.gmail.com>
 <CAK8P3a3FMa9tpw4rj+8Aue2EYxxKSD4nxdwRFrzac_87Kzio5g@mail.gmail.com>
 <CAFA6WYNCxGTqw6LKUPK-ceWD1NbAhJQmzrH5fwOVRP5f2Auz2Q@mail.gmail.com>
In-Reply-To: <CAFA6WYNCxGTqw6LKUPK-ceWD1NbAhJQmzrH5fwOVRP5f2Auz2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Colin Ian King <colin.king@canonical.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>, Wei Yongjun <weiyongjun1@huawei.com>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Feb 20, 2019 at 09:55:50PM +0530, Sumit Garg wrote:
> Hi Arnd,
> 
> On Wed, 20 Feb 2019 at 21:04, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Wed, Feb 20, 2019 at 12:17 PM Sumit Garg <sumit.garg@linaro.org> wrote:
> > >
> > > On Wed, 20 Feb 2019 at 16:19, Colin Ian King <colin.king@canonical.com> wrote:
> > > >
> > > > On 20/02/2019 10:37, Ard Biesheuvel wrote:
> > > > > On Wed, 20 Feb 2019 at 11:34, Sumit Garg <sumit.garg@linaro.org> wrote:
> > > > >>
> > > > >> On Wed, 20 Feb 2019 at 14:51, Wei Yongjun <weiyongjun1@huawei.com> wrote:
> > > > >>>
> > > > >>> Fixes the following sparse warning:
> > > > >>>
> > > > >>> drivers/char/hw_random/optee-rng.c:265:35: warning:
> > > > >>>  symbol 'optee_rng_id_table' was not declared. Should it be static?
> > > > >>>
> > > > >>
> > > > >> I haven't observed this warning during my normal Linux build using
> > > > >> gcc. Is there any specific configuration you are using?
> > > > >>
> > > > >
> > > > > This is a sparse warning, not GCC. You need to install it separately
> > > > > and build with C=1 (iirc)
> > > > >
> > >
> > > TBH, I wasn't aware about this sparse tool. I did install sparse and
> > > build with C=1 option. But I could only get following such
> > > errors/warnings for drivers/char/hw_random/optee-rng.c:
> > >
> > > ./arch/arm64/include/asm/lse.h:18:37: warning: Unknown escape 'l'
> > > ./arch/arm64/include/asm/alternative.h:213:28: warning: Unknown escape 'o'
> > > ./include/linux/compiler.h:194:8: error: attribute '__gnu_inline__':
> > > unknown attribute
> > >
> > > But not the one mentioned in this patch.
> >
> > Not sure what went wrong, I see the same warning as the others.
> > Maybe you have an outdated version of sparse that runs into unrelated
> > issues?
> >
> 
> $ apt list sparse
> Listing... Done
> sparse/xenial,now 0.5.0-1build1 amd64 [installed]

Ick, really obsolete, please use the sparse version on kernel.org for
kernel stuff:
	git://git.kernel.org/pub/scm/devel/sparse/sparse.git

Loads of things have been fixed and resolved from 0.5.0 which is very
old.

thanks,

greg k-h
