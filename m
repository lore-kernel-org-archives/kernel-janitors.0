From: Andrzej Hajda <a.hajda@samsung.com>
Date: Tue, 22 Sep 2015 12:55:09 +0000
Subject: Re: [patch] drm/layerscape: fix a signedness bug
Message-Id: <56014FAD.7010805@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150922123104.GB27407@mwanda>
In-Reply-To: <20150922123104.GB27407@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jianwei Wang <jianwei.wang.chn@gmail.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Alison Wang <alison.wang@freescale.com>

Hi,

I have posted the same patch yesterday [1].

http://permalink.gmane.org/gmane.comp.video.dri.devel/136945

Regards
Andrzej

On 09/22/2015 02:31 PM, Dan Carpenter wrote:
> "index" needs to be signed for the error handling to work.  Really "ret"
> should be an int as well.
> 
> Fixes: 109eee2f2a18 ('drm/layerscape: Add Freescale DCU DRM driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
> index 82be6b8..d1e300d 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
> @@ -58,7 +58,8 @@ static void fsl_dcu_drm_plane_atomic_disable(struct drm_plane *plane,
>  					     struct drm_plane_state *old_state)
>  {
>  	struct fsl_dcu_drm_device *fsl_dev = plane->dev->dev_private;
> -	unsigned int index, value, ret;
> +	unsigned int value;
> +	int index, ret;
>  
>  	index = fsl_dcu_drm_plane_index(plane);
>  	if (index < 0)
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

