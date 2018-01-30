From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 30 Jan 2018 09:57:52 +0000
Subject: Re: [PATCH] drm/mgag200: fix a test in mga_vga_mode_valid()
Message-Id: <20180130095752.GJ25930@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180125142655.GA23885@mwanda>
In-Reply-To: <20180125142655.GA23885@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dave Airlie <airlied@redhat.com>, Julia Lemire <jlemire@matrox.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sinclair Yeh <syeh@vmware.com>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Peter Rosin <peda@axentia.se>, Keith Packard <keithp@keithp.com>, Mathieu Larouche <mathieu.larouche@matrox.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

On Thu, Jan 25, 2018 at 05:26:55PM +0300, Dan Carpenter wrote:
> The parentheses are in the wrong place here so we pass the bits per
> pixel as zero.
> 
> Fixes: abbee6238775 ("drm/mgag200: Added resolution and bandwidth limits for various G200e products.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static analysis.  Not tested.

Looks reasonable. Thanks for the patch, applied.
-Daniel

> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 68e5d9c94475..fb50a9ddaae8 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -1620,8 +1620,8 @@ static int mga_vga_mode_valid(struct drm_connector *connector,
>  			return MODE_VIRTUAL_X;
>  		if (mode->vdisplay > 1024)
>  			return MODE_VIRTUAL_Y;
> -		if (mga_vga_calculate_mode_bandwidth(mode,
> -			bpp > (31877 * 1024)))
> +		if (mga_vga_calculate_mode_bandwidth(mode, bpp) >
> +		    (31877 * 1024))
>  			return MODE_BANDWIDTH;
>  	} else if (mdev->type = G200_EV &&
>  		(mga_vga_calculate_mode_bandwidth(mode, bpp)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
