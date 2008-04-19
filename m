From: Julia Lawall <julia@diku.dk>
Date: Sat, 19 Apr 2008 15:43:31 +0000
Subject: Re: script to find incorrect tests on unsigneds
Message-Id: <Pine.LNX.4.58.0804191742420.1187@pc-041.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4808C90A.5040600@tiscali.nl>
In-Reply-To: <4808C90A.5040600@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 19 Apr 2008, Matthew Wilcox wrote:

> On Fri, Apr 18, 2008 at 09:08:55PM +0200, Julia Lawall wrote:
> > I found 63 occurrences of this problem with the following semantic match
> > (http://www.emn.fr/x-info/coccinelle/):
> >
> > @@ unsigned int i; @@
> >
> > * i < 0
>
> Could you also look for unsigned long?

A few more...

julia

------------------------------

diff -u -p a/drivers/video/amifb.c b/drivers/video/amifb.c
*** a/drivers/video/amifb.c 2008-03-12 14:13:14.000000000 +0100
@@ -2053,7 +2053,7 @@ static void amifb_copyarea(struct fb_inf
 	sy = area->sy + (dy - area->dy);

 	/* the source must be completely inside the virtual screen */
*	if (sx < 0 || sy < 0 || (sx + width) > info->var.xres_virtual ||
 	    (sy + height) > info->var.yres_virtual)
 		return;

diff -u -p a/drivers/video/atafb.c b/drivers/video/atafb.c
*** a/drivers/video/atafb.c 2008-03-12 14:13:14.000000000 +0100
@@ -2598,7 +2598,7 @@ static void atafb_copyarea(struct fb_inf
 	sy = area->sy + (dy - area->dy);

 	/* the source must be completely inside the virtual screen */
*	if (sx < 0 || sy < 0 || (sx + width) > info->var.xres_virtual ||
 	    (sy + height) > info->var.yres_virtual)
 		return;

diff -u -p a/drivers/video/aty/aty128fb.c b/drivers/video/aty/aty128fb.c
*** a/drivers/video/aty/aty128fb.c 2008-03-12 14:13:14.000000000 +0100
@@ -1350,7 +1350,7 @@ static int aty128_var_to_pll(u32 period_
 		}
 	}

*	if (pll->post_divider < 0)
 		return -EINVAL;

 	/* calculate feedback divider */
