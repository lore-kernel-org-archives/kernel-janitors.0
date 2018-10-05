From: Liviu Dudau <liviu.dudau@arm.com>
Date: Fri, 05 Oct 2018 12:38:05 +0000
Subject: Re: [PATCH -next] drm/arm/malidp: remove set but not used variable 'afbc_superblock_size'
Message-Id: <20181005123805.GE1156@e110455-lin.cambridge.arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538737393-112861-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538737393-112861-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mali DP Maintainers <malidp@foss.arm.com>

On Fri, Oct 05, 2018 at 11:03:13AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/gpu/drm/arm/malidp_drv.c: In function 'malidp_verify_afbc_framebuffer_size':
> drivers/gpu/drm/arm/malidp_drv.c:318:6: warning:
>  variable 'afbc_superblock_size' set but not used [-Wunused-but-set-variable]
>   u32 afbc_superblock_size = 0, afbc_superblock_height = 0;
> 
> It never used since be introduced in
> commit 3dae1c0919d8 ("drm/arm/malidp: Implemented the size validation for AFBC framebuffers")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/arm/malidp_drv.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> index 9021485..1b0ede6 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -315,7 +315,7 @@ static void malidp_atomic_commit_tail(struct drm_atomic_state *state)
>  	int n_superblocks = 0;
>  	const struct drm_format_info *info;
>  	struct drm_gem_object *objs = NULL;
> -	u32 afbc_superblock_size = 0, afbc_superblock_height = 0;
> +	u32 afbc_superblock_height = 0;
>  	u32 afbc_superblock_width = 0, afbc_size = 0;
>  
>  	switch (mode_cmd->modifier[0] & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK) {
> @@ -333,9 +333,6 @@ static void malidp_atomic_commit_tail(struct drm_atomic_state *state)
>  	n_superblocks = (mode_cmd->width / afbc_superblock_width) *
>  		(mode_cmd->height / afbc_superblock_height);
>  
> -	afbc_superblock_size = info->cpp[0] * afbc_superblock_width *
> -		afbc_superblock_height;
> -

Ah, that doesn't look right, it seems some code was dropped out of the
upstream patch. I will send a fix for it now.

Best regards,
Liviu

>  	afbc_size = ALIGN(n_superblocks * AFBC_HEADER_SIZE, 128);
>  
>  	if (mode_cmd->width * info->cpp[0] != mode_cmd->pitches[0]) {
> 

-- 
==========
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
