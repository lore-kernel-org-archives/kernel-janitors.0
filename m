From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 11 Dec 2020 18:40:31 +0000
Subject: Re: [PATCH] block: drop dead assignments in loop_init()
Message-Id: <CAKXUXMxjtv5B4ekC58=Ww8R4Ju2MvT0pXbPi7XH+OU7JuYnP3w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201211181236.25755-1-lukas.bulwahn@gmail.com> <alpine.DEB.2.22.394.2012111923020.2669@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2012111923020.2669@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, Hannes Reinecke <hare@suse.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, kernel-janitors@vger.kernel.org

On Fri, Dec 11, 2020 at 7:23 PM Julia Lawall <julia.lawall@inria.fr> wrote:
>
>
>
> On Fri, 11 Dec 2020, Lukas Bulwahn wrote:
>
> > Commit 8410d38c2552 ("loop: use __register_blkdev to allocate devices on
> > demand") simplified loop_init(); so computing the range of the block region
> > is not required anymore and can be dropped.
> >
> > Drop dead assignments in loop_init().
> >
> > As compilers will detect these unneeded assignments and optimize this,
> > the resulting object code is identical before and after this change.
> >
> > No functional change. No change in object code.
>
> It looks like some braces should be dropped too?
>
> julia
>

Julia, you are right; I just rewrote it to:

nr = max_loop ? max_loop : CONFIG_BLK_DEV_LOOP_MIN_COUNT;

v2 will follow in a moment.

Lukas

> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > Christoph, please ack.
> >
> > Jens, please pick this minor non-urgent clean-up patch on your
> > block -next tree on top of Christoph's commit above.
> >
> >  drivers/block/loop.c | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> > index d2ce1ddc192d..eed4bc5ef5c5 100644
> > --- a/drivers/block/loop.c
> > +++ b/drivers/block/loop.c
> > @@ -2304,7 +2304,6 @@ MODULE_ALIAS("devname:loop-control");
> >  static int __init loop_init(void)
> >  {
> >       int i, nr;
> > -     unsigned long range;
> >       struct loop_device *lo;
> >       int err;
> >
> > @@ -2343,10 +2342,8 @@ static int __init loop_init(void)
> >        */
> >       if (max_loop) {
> >               nr = max_loop;
> > -             range = max_loop << part_shift;
> >       } else {
> >               nr = CONFIG_BLK_DEV_LOOP_MIN_COUNT;
> > -             range = 1UL << MINORBITS;
> >       }
> >
> >       err = misc_register(&loop_misc);
> > --
> > 2.17.1
> >
> >
