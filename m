From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 08 Feb 2017 08:49:11 +0000
Subject: Re: [patch] drm/atomic: fix an error code in mode_fixup()
Message-Id: <20170208084911.5jjddqfiqxvuy5x6@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207234601.GA23981@mwanda>
In-Reply-To: <20170207234601.GA23981@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>, Thierry Reding <treding@nvidia.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, Feb 08, 2017 at 02:46:01AM +0300, Dan Carpenter wrote:
> Having "ret" be a bool type works for everything except
> ret = funcs->atomic_check().  The other functions all return zero on
> error but ->atomic_check() returns negative error codes.  We want to
> propagate the error code but instead we return 1.
> 
> I found this bug with static analysis and I don't know if it affects
> run time.
> 
> Fixes: 4cd4df8080a3 ("drm/atomic: Add ->atomic_check() to encoder helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to drm-misc for 4.11, thanks.
-Daniel

> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 9a08445a7a7a..01d936b7be43 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -369,7 +369,7 @@ mode_fixup(struct drm_atomic_state *state)
>  	struct drm_connector *connector;
>  	struct drm_connector_state *conn_state;
>  	int i;
> -	bool ret;
> +	int ret;
>  
>  	for_each_crtc_in_state(state, crtc, crtc_state, i) {
>  		if (!crtc_state->mode_changed &&
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
