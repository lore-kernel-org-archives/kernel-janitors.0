From: Andy Walls <awalls@md.metrocast.net>
Date: Fri, 23 Jul 2010 11:46:47 +0000
Subject: Re: [patch -next] V4L: ivtv: remove unneeded NULL checks
Message-Id: <1279885607.2013.8.camel@morgan.silverblock.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100723101232.GE26313@bicker>
In-Reply-To: <20100723101232.GE26313@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Ian Armstrong <ian@iarmst.demon.co.uk>, ivtv-devel@ivtvdriver.org, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 2010-07-23 at 12:12 +0200, Dan Carpenter wrote:
> In ivtvfb_callback_cleanup() we dereference "itv" before checking that
> it's NULL.  "itv" is assigned with container_of() which basically never
> returns a NULL pointer so the check is pointless.  I removed it, along
> with a similar check in ivtvfb_callback_init().
> 
> I considered adding a check for v4l2_dev, but I looked at the code and I
> don't think that can be NULL either.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Hi Dan,

Thanks, but Jiri Slaby already caught this one:

https://patchwork.kernel.org/patch/112725/

I'm going to let Mauro pick up Jiri's patch out of patchwork.

Regards,
Andy


> diff --git a/drivers/media/video/ivtv/ivtvfb.c b/drivers/media/video/ivtv/ivtvfb.c
> index 2c2d862..be03a71 100644
> --- a/drivers/media/video/ivtv/ivtvfb.c
> +++ b/drivers/media/video/ivtv/ivtvfb.c
> @@ -1239,7 +1239,7 @@ static int __init ivtvfb_callback_init(struct device *dev, void *p)
>  	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
>  	struct ivtv *itv = container_of(v4l2_dev, struct ivtv, v4l2_dev);
>  
> -	if (itv && (itv->v4l2_cap & V4L2_CAP_VIDEO_OUTPUT)) {
> +	if (itv->v4l2_cap & V4L2_CAP_VIDEO_OUTPUT) {
>  		if (ivtvfb_init_card(itv) = 0) {
>  			IVTVFB_INFO("Framebuffer registered on %s\n",
>  					itv->v4l2_dev.name);
> @@ -1255,7 +1255,7 @@ static int ivtvfb_callback_cleanup(struct device *dev, void *p)
>  	struct ivtv *itv = container_of(v4l2_dev, struct ivtv, v4l2_dev);
>  	struct osd_info *oi = itv->osd_info;
>  
> -	if (itv && (itv->v4l2_cap & V4L2_CAP_VIDEO_OUTPUT)) {
> +	if (itv->v4l2_cap & V4L2_CAP_VIDEO_OUTPUT) {
>  		if (unregister_framebuffer(&itv->osd_info->ivtvfb_info)) {
>  			IVTVFB_WARN("Framebuffer %d is in use, cannot unload\n",
>  				       itv->instance);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-media" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


