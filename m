From: Mauro Carvalho Chehab <mchehab@redhat.com>
Date: Sat, 29 May 2010 04:22:42 +0000
Subject: Re: [PATCH 06/11] V4L/DVB: omap_vout: Storage class should be
Message-Id: <20100529012242.0ef3cdf2@pedra>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1274344588-9034-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1274344588-9034-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tobias Klauser <tklauser@distanz.ch>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Em Thu, 20 May 2010 10:36:28 +0200
Tobias Klauser <tklauser@distanz.ch> escreveu:

> The C99 specification states in section 6.11.5:
> 
> The placement of a storage-class specifier other than at the beginning
> of the declaration specifiers in a declaration is an obsolescent
> feature.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

As you've c/c kernel-janitors, I'm assuming that this patch will go via trivial
tree. So, that's my ack:

Acked-by: Mauro Carvalho Chehab <mchehab@redhat.com>
> ---
>  drivers/media/video/omap/omap_vout.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/media/video/omap/omap_vout.c b/drivers/media/video/omap/omap_vout.c
> index 4c0ab49..d6a2ae1 100644
> --- a/drivers/media/video/omap/omap_vout.c
> +++ b/drivers/media/video/omap/omap_vout.c
> @@ -128,7 +128,7 @@ module_param(debug, bool, S_IRUGO);
>  MODULE_PARM_DESC(debug, "Debug level (0-1)");
>  
>  /* list of image formats supported by OMAP2 video pipelines */
> -const static struct v4l2_fmtdesc omap_formats[] = {
> +static const struct v4l2_fmtdesc omap_formats[] = {
>  	{
>  		/* Note:  V4L2 defines RGB565 as:
>  		 *


-- 

Cheers,
Mauro
