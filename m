From: Hans Verkuil <hverkuil@xs4all.nl>
Date: Mon, 21 Jan 2013 09:39:19 +0000
Subject: Re: [PATCH V2 24/24] v4l2-core/v4l2-common.c: use IS_ENABLED() macro
Message-Id: <201301211039.19569.hverkuil@xs4all.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358638891-4775-1-git-send-email-peter.senna@gmail.com> <1358638891-4775-25-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1358638891-4775-25-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: mchehab@redhat.com, hans.verkuil@cisco.com, sakari.ailus@iki.fi, dhowells@redhat.com, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun January 20 2013 00:41:31 Peter Senna Tschudin wrote:
> replace:
>  #if defined(CONFIG_MEDIA_TUNER_TEA5761) || \
>      defined(CONFIG_MEDIA_TUNER_TEA5761_MODULE)
> with:
>  #if IS_ENABLED(CONFIG_MEDIA_TUNER_TEA5761)
> 
> This change was made for: CONFIG_MEDIA_TUNER_TEA5761
> 
> Also replaced:
>  #if defined(CONFIG_I2C) || (defined(CONFIG_I2C_MODULE) && defined(MODULE))
> with:
>  #if IS_ENABLED(CONFIG_I2C)
> 
> Reported-by: Mauro Carvalho Chehab <mchehab@redhat.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

Acked-by: Hans Verkuil <hans.verkuil@cisco.com>

Regards,

	Hans

> ---
> Changes from V1:
>    Updated subject
>    Fixed commit message
> 
>  drivers/media/v4l2-core/v4l2-common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 614316f..aa044f4 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -238,7 +238,7 @@ int v4l2_chip_match_host(const struct v4l2_dbg_match *match)
>  }
>  EXPORT_SYMBOL(v4l2_chip_match_host);
>  
> -#if defined(CONFIG_I2C) || (defined(CONFIG_I2C_MODULE) && defined(MODULE))
> +#if IS_ENABLED(CONFIG_I2C)
>  int v4l2_chip_match_i2c_client(struct i2c_client *c, const struct v4l2_dbg_match *match)
>  {
>  	int len;
> @@ -384,7 +384,7 @@ EXPORT_SYMBOL_GPL(v4l2_i2c_subdev_addr);
>  const unsigned short *v4l2_i2c_tuner_addrs(enum v4l2_i2c_tuner_type type)
>  {
>  	static const unsigned short radio_addrs[] = {
> -#if defined(CONFIG_MEDIA_TUNER_TEA5761) || defined(CONFIG_MEDIA_TUNER_TEA5761_MODULE)
> +#if IS_ENABLED(CONFIG_MEDIA_TUNER_TEA5761)
>  		0x10,
>  #endif
>  		0x60,
> 
