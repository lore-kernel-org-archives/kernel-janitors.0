From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Feb 2015 18:35:44 +0000
Subject: Re: [PATCH] [RFC] drivers/staging/fbtft: fix sparse warnings
Message-Id: <20150223183544.GB5064@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1424468049-24525-1-git-send-email-andrey.krieger.utkin@gmail.com>
 <20150221185824.GE5206@mwanda>
 <CANZNk82SkziecUNCShZu-cjqTHqKCF5UumMazJtNp2upt8qZJg@mail.gmail.com>
In-Reply-To: <CANZNk82SkziecUNCShZu-cjqTHqKCF5UumMazJtNp2upt8qZJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: OSUOSL Drivers <devel@driverdev.osuosl.org>, kernel-mentors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, noralf@tronnes.org

On Mon, Feb 23, 2015 at 07:06:44PM +0200, Andrey Utkin wrote:
> 2015-02-21 20:58 GMT+02:00 Dan Carpenter <dan.carpenter@oracle.com>:
> > Send two separate patches.  You can't "fix" sparse warnings.  You can
> > only "fix" bugs.  The rest is add annotation, doing cleanups or possibly
> > silencing warnings.
> 
> My first email wasn't a patch supposed for accepting, but rather a
> request for comments, so I didn't bother with commit granularity,
> separation of commit description and the description of my situation
> with scissors marker etc. Sorry if this is rude or confusing.

At least *try* to send proper patches.  It is a waste of time to send
half finished patches with lazy butt changelogs, yes.

> 
> 
> >> diff --git a/drivers/staging/fbtft/fb_agm1264k-fl.c b/drivers/staging/fbtft/fb_agm1264k-fl.c
> >> index 9cc7d25..9114239 100644
> >> --- a/drivers/staging/fbtft/fb_agm1264k-fl.c
> >> +++ b/drivers/staging/fbtft/fb_agm1264k-fl.c
> >> @@ -273,7 +273,7 @@ construct_line_bitmap(struct fbtft_par *par, u8 *dest, signed short *src,
> >>
> >>  static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
> >>  {
> >> -     u16 *vmem16 = (u16 *)par->info->screen_base;
> >> +     u16 __iomem *vmem16 = (u16 __iomem *)par->info->screen_base;
> >
> > I haven't looked.  What is the type for ->screen_base and why can't it
> > be declared as __iomem type?
>
> http://lxr.free-electrons.com/source/include/linux/fb.h#L486
> screen_base is component of struct fb_info, defined as "char __iomem *".
> In drivers/staging/fbtft/fbtft-core.c, it looks to be actually set to
> a pointer resulting from vzalloc().

Hm, you're right.  Normally, it's an __iomem * but this time it's not
an __iomem pointer.  Adding anotations to mark it as __iomem is wrong
and adding calls to ioread16() is buggy.

There are a couple ways to make these warnings go away.  The simplest
is just to silence the warning with __force:

	u16 *vmem16 = (u16 __force *)par->info->screen_base;

I'm not terribly familiar with this code.  I don't know that this is the
cleanest approach.  We could also just leave the code alone for now and
ignore the warning.

regards,
dan carpenter

