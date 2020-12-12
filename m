From: Joe Perches <joe@perches.com>
Date: Sat, 12 Dec 2020 04:27:49 +0000
Subject: Re: [PATCH] block: drop dead assignments in loop_init()
Message-Id: <4257c266dd5edf3ad6617657331abcabfd59188f.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201211181236.25755-1-lukas.bulwahn@gmail.com>
         <alpine.DEB.2.22.394.2012111923020.2669@hadrien>
         <CAKXUXMxjtv5B4ekC58=Ww8R4Ju2MvT0pXbPi7XH+OU7JuYnP3w@mail.gmail.com>
In-Reply-To: <CAKXUXMxjtv5B4ekC58=Ww8R4Ju2MvT0pXbPi7XH+OU7JuYnP3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Julia Lawall <julia.lawall@inria.fr>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, Hannes Reinecke <hare@suse.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, kernel-janitors@vger.kernel.org

On Fri, 2020-12-11 at 19:40 +0100, Lukas Bulwahn wrote:
> On Fri, Dec 11, 2020 at 7:23 PM Julia Lawall <julia.lawall@inria.fr> wrote:
> > On Fri, 11 Dec 2020, Lukas Bulwahn wrote:
> > > Commit 8410d38c2552 ("loop: use __register_blkdev to allocate devices on
> > > demand") simplified loop_init(); so computing the range of the block region
> > > is not required anymore and can be dropped.
> > > 
> > > Drop dead assignments in loop_init().
> > > 
> > > As compilers will detect these unneeded assignments and optimize this,
> > > the resulting object code is identical before and after this change.
> > > 
> > > No functional change. No change in object code.
> > 
> > It looks like some braces should be dropped too?

> I just rewrote it to:
> 
> nr = max_loop ? max_loop : CONFIG_BLK_DEV_LOOP_MIN_COUNT;

A relatively common gcc extension would use ?: like:

	nr = max_loop ?: CONFIG_BLK_DEV_LOOP_MIN_COUNT;
