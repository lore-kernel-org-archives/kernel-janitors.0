From: walter harms <wharms@bfs.de>
Date: Mon, 20 Mar 2017 18:30:43 +0000
Subject: Re: [PATCH] drm/gma500: fix memory leak on edid
Message-Id: <58D01FD3.4040007@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170320175601.23149-1-colin.king@canonical.com>
In-Reply-To: <20170320175601.23149-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org



Am 20.03.2017 18:56, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> edid is allocated on the call to psb_intel_sdvo_get_edid but not
> kfree'd at all, causing a memory leak.  Fix this by kfree'ing
> the edid.  (This may be null, but kfree can handle null frees).
> 
> Detected by CoverityScan, CID#1090730 ("Resource Leak")
> 
> Fixes: 5736995b473b ("gma500: Replace SDVO code with slightly modified version from i915")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/gma500/psb_intel_sdvo.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> index e787d376ba67..f38e6ad1ab9b 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> @@ -1650,6 +1650,7 @@ static bool psb_intel_sdvo_detect_hdmi_audio(struct drm_connector *connector)
>  	edid = psb_intel_sdvo_get_edid(connector);
>  	if (edid != NULL && edid->input & DRM_EDID_INPUT_DIGITAL)
is the check here needed at all ?
	drm_detect_monitor_audio--> drm_find_cea_extension -->drm_find_edid_extension (will check for NULL)

I missed DRM_EDID_INPUT_DIGITAL some where ? NTL i would expected drm_detect_monitor_audio to hanle it savely.

re,
 wh

>  		has_audio = drm_detect_monitor_audio(edid);
> +	kfree(edid);
>  
>  	return has_audio;
>  }
