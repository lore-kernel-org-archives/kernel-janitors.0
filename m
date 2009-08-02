From: Daniel Walker <dwalker@fifo99.com>
Date: Sun, 02 Aug 2009 00:10:57 +0000
Subject: Re: [PATCH] treewide: Use DIV_ROUND_UP
Message-Id: <1249171857.6114.5.camel@desktop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908012148100.25693@ask.diku.dk>
	 <1249170191.22466.14.camel@Joe-Laptop.home>
In-Reply-To: <1249170191.22466.14.camel@Joe-Laptop.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Julia Lawall <julia@diku.dk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2009-08-01 at 16:43 -0700, Joe Perches wrote:
> On Sat, 2009-08-01 at 21:48 +0200, Julia Lawall wrote:
> > The kernel.h macro DIV_ROUND_CLOSEST performs the computation (x + d/2)/d
> > but is perhaps more readable.
> 
> Similarly, DIV_ROUND_UP does ((n + d - 1) / d)
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> 
>  arch/alpha/boot/tools/objstrip.c     |    2 +-
>  arch/sh/kernel/early_printk.c        |    2 +-
>  arch/um/include/asm/pgtable-2level.h |    2 +-
>  arch/um/include/asm/pgtable-3level.h |    2 +-
>  drivers/md/raid1.c                   |    2 +-
>  drivers/md/raid10.c                  |    2 +-
>  drivers/media/video/cx2341x.c        |    4 ++--
>  drivers/mtd/tests/mtd_stresstest.c   |    2 +-
>  drivers/net/s2io.c                   |    2 +-
>  drivers/scsi/advansys.c              |    2 +-
>  drivers/scsi/cxgb3i/cxgb3i.h         |    2 +-
>  drivers/serial/sh-sci.c              |    2 +-
>  drivers/staging/winbond/mds.c        |    2 +-
>  drivers/xen/grant-table.c            |    3 +--
>  kernel/posix-cpu-timers.c            |    2 +-
>  lib/radix-tree.c                     |    2 +-
>  sound/pci/ctxfi/ctresource.c         |    2 +-
>  sound/pci/hda/hda_intel.c            |    3 +--
>  18 files changed, 19 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/alpha/boot/tools/objstrip.c b/arch/alpha/boot/tools/objstrip.c
> index ef18382..786e736 100644
> --- a/arch/alpha/boot/tools/objstrip.c
> +++ b/arch/alpha/boot/tools/objstrip.c
> @@ -253,7 +253,7 @@ main (int argc, char *argv[])
>      }
>  
>      if (pad) {
> -	mem_size = ((mem_size + pad - 1) / pad) * pad;
> +	mem_size = DIV_ROUND_UP(mem_size, pad) * pad;

Doesn't this look more like,

#define roundup(x, y) ((((x) + ((y) - 1)) / (y)) * (y))

> --- a/drivers/media/video/cx2341x.c
> +++ b/drivers/media/video/cx2341x.c
> @@ -304,7 +304,7 @@ static int cx2341x_set_ctrl(struct cx2341x_mpeg_params *params, int busy,
>  		int b = ctrl->value + 1;
>  		int gop = params->video_gop_size;
>  		params->video_b_frames = ctrl->value;
> -		params->video_gop_size = b * ((gop + b - 1) / b);
> +		params->video_gop_size = b * DIV_ROUND_UP(gop, b);

Same here , roundup() ..

>  		/* Max GOP size = 34 */
>  		while (params->video_gop_size > 34)
>  			params->video_gop_size -= b;
> @@ -313,7 +313,7 @@ static int cx2341x_set_ctrl(struct cx2341x_mpeg_params *params, int busy,
>  	case V4L2_CID_MPEG_VIDEO_GOP_SIZE: {
>  		int b = params->video_b_frames + 1;
>  		int gop = ctrl->value;
> -		params->video_gop_size = b * ((gop + b - 1) / b);
> +		params->video_gop_size = b * DIV_ROUND_UP(gop, b);

and here..

Seems like there are a few more like this .. Could you either use
roundup() or merge the two macros .. Or explain why your not using it..

Daniel

