From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 02 May 2018 11:10:02 +0000
Subject: Re: [PATCH] gpu: drm: sti: fix spelling mistake: "initialze" -> "initialize"
Message-Id: <20180502111002.GB12521@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180502101048.8442-1-colin.king@canonical.com>
In-Reply-To: <20180502101048.8442-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Vincent Abriou <vincent.abriou@st.com>

On Wed, May 02, 2018 at 11:10:48AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in DRM_ERROR error message
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to drm-misc-next, thanks.
-Daniel

> ---
>  drivers/gpu/drm/sti/sti_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_crtc.c b/drivers/gpu/drm/sti/sti_crtc.c
> index 21e50d7b1f86..5824e6aca8f4 100644
> --- a/drivers/gpu/drm/sti/sti_crtc.c
> +++ b/drivers/gpu/drm/sti/sti_crtc.c
> @@ -357,7 +357,7 @@ int sti_crtc_init(struct drm_device *drm_dev, struct sti_mixer *mixer,
>  	res = drm_crtc_init_with_planes(drm_dev, crtc, primary, cursor,
>  					&sti_crtc_funcs, NULL);
>  	if (res) {
> -		DRM_ERROR("Can't initialze CRTC\n");
> +		DRM_ERROR("Can't initialize CRTC\n");
>  		return -EINVAL;
>  	}
>  
> -- 
> 2.17.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
