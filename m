From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Date: Wed, 14 Jun 2017 16:41:16 +0000
Subject: RE: [PATCH] drm/amdkfd: NULL dereference involving create_process()
Message-Id: <BN6PR12MB16526A96549054656758635FF7C30@BN6PR12MB1652.namprd12.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614105853.GP29394@elgon.mountain>
In-Reply-To: <20170614105853.GP29394@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Dan Carpenter' <dan.carpenter@oracle.com>, Oded Gabbay <oded.gabbay@gmail.com>, Alexey Skidanov <Alexey.Skidanov@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>, David Airlie <airlied@linux.ie>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Wednesday, June 14, 2017 6:59 AM
> To: Oded Gabbay; Alexey Skidanov
> Cc: Deucher, Alexander; Koenig, Christian; David Airlie; dri-
> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; kernel-
> janitors@vger.kernel.org
> Subject: [PATCH] drm/amdkfd: NULL dereference involving create_process()
> 
> We accidentally return ERR_PTR(0) which is NULL.  The caller is not
> expecting that and it leads to an Oops.
> 
> Fixes: dd59239a9862 ("amdkfd: init aperture once per process")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Include Felix.

Alex

> 
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index 84d1ffd1eef9..1190d06884ed 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -318,7 +318,8 @@ static struct kfd_process *create_process(const struct
> task_struct *thread)
> 
>  	/* init process apertures*/
>  	process->is_32bit_user_mode = in_compat_syscall();
> -	if (kfd_init_apertures(process) != 0)
> +	err = kfd_init_apertures(process);
> +	if (err != 0)
>  		goto err_init_apretures;
> 
>  	return process;
