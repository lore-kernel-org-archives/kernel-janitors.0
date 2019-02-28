From: Nathan Chancellor <natechancellor@gmail.com>
Date: Thu, 28 Feb 2019 08:50:58 +0000
Subject: Re: [PATCH] ubi: wl: Silence uninitialized variable warning
Message-Id: <20190228085058.GA5694@archlinux-ryzen>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190228053551.GB3253@kadam>
 <8490920.CCJDc82j5X@blindfold>
In-Reply-To: <8490920.CCJDc82j5X@blindfold>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Weinberger <richard@nod.at>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Artem Bityutskiy <dedekind1@gmail.com>, kernel-janitors@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Dan Carpenter <dan.carpenter@oracle.com>

On Thu, Feb 28, 2019 at 09:35:50AM +0100, Richard Weinberger wrote:
> Am Donnerstag, 28. Februar 2019, 06:35:51 CET schrieb Dan Carpenter:
> > This condition needs to be fipped around because "err" is uninitialized
> > when "force" is set.  The Smatch static analysis tool complains and
> > UBsan will also complain at runtime.
> > 
> > Fixes: 663586c0a892 ("ubi: Expose the bitrot interface")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>

This fixes a -Wsometimes-uninitialized warning from Clang:

drivers/mtd/ubi/wl.c:1514:6: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
        if (!force) {
            ^~~~~~
drivers/mtd/ubi/wl.c:1520:6: note: uninitialized use occurs here
        if (err = UBI_IO_BITFLIPS || force) {
            ^~~
drivers/mtd/ubi/wl.c:1514:2: note: remove the 'if' if its condition is always true
        if (!force) {
        ^~~~~~~~~~~~
drivers/mtd/ubi/wl.c:1478:9: note: initialize the variable 'err' to silence this warning
        int err;
               ^
                = 0
1 warning generated.

> > ---
> >  drivers/mtd/ubi/wl.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> > index 40f838d54b0f..2709dc02fc24 100644
> > --- a/drivers/mtd/ubi/wl.c
> > +++ b/drivers/mtd/ubi/wl.c
> > @@ -1517,7 +1517,7 @@ int ubi_bitflip_check(struct ubi_device *ubi, int pnum, int force)
> >  		mutex_unlock(&ubi->buf_mutex);
> >  	}
> >  
> > -	if (err = UBI_IO_BITFLIPS || force) {
> > +	if (force || err = UBI_IO_BITFLIPS) {
> >  		/*
> >  		 * Okay, bit flip happened, let's figure out what we can do.
> >  		 */
> > 
> 
> Good catch, Dan!
> I thought gcc is supposed to find such issues too. :-/

This isn't the first time GCC hasn't caught something...

https://lore.kernel.org/lkml/20190221222123.GC6474@magnolia/

> 
> Thanks,
> //richard
> 
> 

Thanks,
Nathan
