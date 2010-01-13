From: walter harms <wharms@bfs.de>
Date: Wed, 13 Jan 2010 08:40:03 +0000
Subject: Re: drivers/gpu/drm/radeon/radeon_cp.c: check for invalid radeon
Message-Id: <4B4D86E3.9090207@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1261660696.3546.40.camel@ICE-BOX>
In-Reply-To: <1261660696.3546.40.camel@ICE-BOX>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Darren Jenkins <darrenrjenkins@gmail.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel mailing list <dri-devel@lists.sourceforge.net>, Kernel Janitors <kernel-janitors@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>



Darren Jenkins schrieb:
> If there is an invalid radeon family the fw_name is NULL and causes an
> NULL pointer dereference.
> This just adds a check for something unexpected.
> 
> Coverity CID: 13252
> 
> Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
> diff --git a/drivers/gpu/drm/radeon/radeon_cp.c
> b/drivers/gpu/drm/radeon/radeon_cp.c
> index 0b2f9c2..1e66337 100644
> --- a/drivers/gpu/drm/radeon/radeon_cp.c
> +++ b/drivers/gpu/drm/radeon/radeon_cp.c
> @@ -531,6 +531,8 @@ static int
> radeon_cp_init_microcode(drm_radeon_private_t *dev_priv)
>  		   ((dev_priv->flags & RADEON_FAMILY_MASK) = CHIP_RV570)) {
>  		DRM_INFO("Loading R500 Microcode\n");
>  		fw_name = FIRMWARE_R520;
> +	} else {
> +		return -EINVAL;
>  	}
>  
>  	err = request_firmware(&dev_priv->me_fw, fw_name, &pdev->dev);
> 
> 

Someone should take the job to clear the if forrest and replace it with switch()/case.

just my 2 cents,
 wh
