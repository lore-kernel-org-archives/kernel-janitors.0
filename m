From: =?UTF-8?Q?Christian_K=c3=b6nig?= <deathsimple@vodafone.de>
Date: Thu, 10 Aug 2017 12:30:15 +0000
Subject: Re: [PATCH] drm/amdgpu: potential shift wrapping bug
Message-Id: <1c9843bd-8c8f-b6f7-d413-ebb508c97930@vodafone.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170810121659.7k2pqemqnd3px2qi@mwanda>
In-Reply-To: <20170810121659.7k2pqemqnd3px2qi@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: kernel-janitors@vger.kernel.org, Felix Kuehling <Felix.Kuehling@amd.com>, Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, "Zhang,
 Jerry" <Jerry.Zhang@amd.com>, Alex Xie <AlexBin.Xie@amd.com>

Am 10.08.2017 um 14:16 schrieb Dan Carpenter:
> "frag_align" is a u64, so presumably we want to use the high bits as
> well instead of shift wrapping.
>
> Fixes: 6be7adb37d9b ("drm/amdgpu: increase fragmentation size for Vega10 v2")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

The fragment field has only 5bits in hardware and can never be more than 
31, so the correct fix would actually be using uint32_t here instead.

Christian.

>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index ba0407d12525..d9a8e942ac3b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1459,7 +1459,7 @@ static int amdgpu_vm_frag_ptes(struct amdgpu_pte_update_params	*params,
>   	/* SI and newer are optimized for 64KB */
>   	unsigned pages_per_frag = AMDGPU_LOG2_PAGES_PER_FRAG(params->adev);
>   	uint64_t frag_flags = AMDGPU_PTE_FRAG(pages_per_frag);
> -	uint64_t frag_align = 1 << pages_per_frag;
> +	uint64_t frag_align = 1ULL << pages_per_frag;
>   
>   	uint64_t frag_start = ALIGN(start, frag_align);
>   	uint64_t frag_end = end & ~(frag_align - 1);
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


