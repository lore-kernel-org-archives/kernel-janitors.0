From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Date: Thu, 10 Aug 2017 02:16:48 +0000
Subject: Re: [PATCH] drm/amdgpu: Uninitialized variable in amdgpu_ttm_backend_bind()
Message-Id: <406505cd-fd17-b87a-0d3f-9adf5376880a@daenzer.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170809103046.mhj7mhe3qwy5ozvy@mwanda>
In-Reply-To: <20170809103046.mhj7mhe3qwy5ozvy@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, Flora Cui <Flora.Cui@amd.com>

On 09/08/17 07:30 PM, Dan Carpenter wrote:
> My static checker complains that it's possible for "r" to be
> uninitialized.  It used to be set to zero so this returns it to the old
> behavior.
> 
> Fixes: 98a7f88ce9a9 ("drm/amdgpu: bind BOs with GTT space allocated directly v2")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index e6f9a54c959d..b5f2a08757d6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -753,7 +753,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_tt *ttm,
>  				   struct ttm_mem_reg *bo_mem)
>  {
>  	struct amdgpu_ttm_tt *gtt = (void*)ttm;
> -	int r;
> +	int r = 0;
>  
>  	if (gtt->userptr) {
>  		r = amdgpu_ttm_tt_pin_userptr(ttm);

Reviewed-by: Michel Dänzer <michel.daenzer@amd.com>


-- 
Earthling Michel Dänzer               |               http://www.amd.com
Libre software enthusiast             |             Mesa and X developer
