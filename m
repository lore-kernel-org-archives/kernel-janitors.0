From: Oded Gabbay <oded.gabbay@amd.com>
Date: Wed, 26 Nov 2014 08:57:10 +0000
Subject: Re: [patch] amdkfd: delete some dead code
Message-Id: <547595E6.2030406@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141125164329.GC19894@mwanda>
In-Reply-To: <20141125164329.GC19894@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org



On 11/25/2014 06:43 PM, Dan Carpenter wrote:
> This is dead code.  We don't need to unbind here, we can just return
> directly.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
Patch is:
Reviewed-by: Oded Gabbay <oded.gabbay@amd.com>
And applied to my 3.19-next-wip tree.
Thanks!

    Oded

> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index a17e2dd..b4f49ac 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -348,11 +348,6 @@ struct kfd_process_device *kfd_bind_process_to_device(struct kfd_dev *dev,
>  	if (err < 0)
>  		return ERR_PTR(err);
>  
> -	if (err < 0) {
> -		amd_iommu_unbind_pasid(dev->pdev, p->pasid);
> -		return ERR_PTR(err);
> -	}
> -
>  	pdd->bound = true;
>  
>  	return pdd;
> 
