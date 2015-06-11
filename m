From: walter harms <wharms@bfs.de>
Date: Thu, 11 Jun 2015 12:03:18 +0000
Subject: Re: [patch] drm/amdgpu: potential NULL dereference on error
Message-Id: <55797906.2090501@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150611084933.GA27393@mwanda>
In-Reply-To: <20150611084933.GA27393@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>, =?windows-1252?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Jammy Zhou <Jammy.Zhou@amd.com>, yanyang1 <young.yang@amd.com>, =?windows-1252?Q?Marek_Ol=9A=E1k?= <marek.olsak@amd.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org



Am 11.06.2015 10:49, schrieb Dan Carpenter:
> debugfs_create_file() can return an error pointer if debugfs is disabled
> or it can return NULL on error.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 36be03c..adba2a1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1980,6 +1980,8 @@ static int amdgpu_debugfs_regs_init(struct amdgpu_device *adev)
>  				  adev, &amdgpu_debugfs_regs_fops);
>  	if (IS_ERR(ent))
>  		return PTR_ERR(ent);
> +	if (!ent)
> +		return -ENOMEM;
>  	i_size_write(ent->d_inode, adev->rmmio_size);
>  	adev->debugfs_regs = ent;



would  PTR_ERR_OR_ZERO() by an option ?

on the other hand,
why does debugfs_create_file() does not return -ENOMEN instead of NULL ?


re,
 wh


> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
