From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Mon, 09 Jun 2014 15:41:13 +0000
Subject: Re: [patch] gma500: remove duplicate FB_REG09 define
Message-Id: <87ppiigkfa.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140609152023.GO9600@mwanda>
In-Reply-To: <20140609152023.GO9600@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Alan Cox <alan@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, trivial@kernel.org, dri-devel@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>


Patrik, Alan -

Should you add a MAINTAINERS entry for gma500 with one or both of you as
maintainers? What's the status?

BR,
Jani.


On Mon, 09 Jun 2014, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The FB_REG09 define is cut and pasted twice so we can remove the second
> instance.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpu/drm/gma500/mid_bios.c b/drivers/gpu/drm/gma500/mid_bios.c
> index a97e38e..d75ecb3 100644
> --- a/drivers/gpu/drm/gma500/mid_bios.c
> +++ b/drivers/gpu/drm/gma500/mid_bios.c
> @@ -39,7 +39,6 @@ static void mid_get_fuse_settings(struct drm_device *dev)
>  #define FB_REG06 0xD0810600
>  #define FB_MIPI_DISABLE  (1 << 11)
>  #define FB_REG09 0xD0810900
> -#define FB_REG09 0xD0810900
>  #define FB_SKU_MASK  0x7000
>  #define FB_SKU_SHIFT 12
>  #define FB_SKU_100 0
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Jani Nikula, Intel Open Source Technology Center
