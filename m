From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Tue, 20 Sep 2016 10:07:35 +0000
Subject: Re: [PATCH 5/6] GPU-DRM-GMA500: One error message less for a GCT revision mismatch in mid_get_vbt_da
Message-Id: <87shsulw9k.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net> <3c9785ef-4553-2e3d-2cb2-5cf6d1f31ccd@users.sourceforge.net> <287833f5-f1ad-b7f0-c614-d4c903b1c890@users.sourceforge.net>
In-Reply-To: <287833f5-f1ad-b7f0-c614-d4c903b1c890@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 20 Sep 2016, SF Markus Elfring <elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 20 Sep 2016 10:36:19 +0200
>
> A single error message should be sufficient to inform about
> the detection of an unknown GCT revision at the end.
> Thus return after the logging call in this case directly.

Did you test this?

BR,
Jani.

>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/gma500/mid_bios.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/gma500/mid_bios.c b/drivers/gpu/drm/gma500/mid_bios.c
> index 9004d30..e5cece0 100644
> --- a/drivers/gpu/drm/gma500/mid_bios.c
> +++ b/drivers/gpu/drm/gma500/mid_bios.c
> @@ -320,6 +320,7 @@ static void mid_get_vbt_data(struct drm_psb_private *dev_priv)
>  		break;
>  	default:
>  		dev_err(dev->dev, "Unknown revision of GCT!\n");
> +		return;
>  	}
>  
>  out:

-- 
Jani Nikula, Intel Open Source Technology Center
