From: Huang Rui <ray.huang@amd.com>
Date: Tue, 09 Oct 2018 10:43:19 +0000
Subject: Re: [PATCH][drm-next] drm/amdgpu/powerplay: fix missing break in switch statements
Message-Id: <20181009104318.GA20785@hr-amur2>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181008162228.4599-1-colin.king@canonical.com>
In-Reply-To: <20181008162228.4599-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: David Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Evan Quan <evan.quan-5C7GfCeVMHo@public.gmane.org>, Rex Zhu <rex.zhu-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Mon, Oct 08, 2018 at 05:22:28PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are several switch statements that are missing break statements.
> Add missing breaks to handle any fall-throughs corner cases.
> 
> Detected by CoverityScan, CID#1457175 ("Missing break in switch")
> 
> Fixes: 18aafc59b106 ("drm/amd/powerplay: implement fw related smu interface for iceland.")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c      | 2 ++
>  drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c    | 2 ++
>  drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c | 2 ++
>  drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c   | 2 ++
>  drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c   | 2 ++
>  5 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
> index 18643e06bc6f..669bd0c2a16c 100644
> --- a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
> @@ -2269,11 +2269,13 @@ static uint32_t ci_get_offsetof(uint32_t type, uint32_t member)
>  		case DRAM_LOG_BUFF_SIZE:
>  			return offsetof(SMU7_SoftRegisters, DRAM_LOG_BUFF_SIZE);
>  		}
> +		break;
>  	case SMU_Discrete_DpmTable:
>  		switch (member) {
>  		case LowSclkInterruptThreshold:
>  			return offsetof(SMU7_Discrete_DpmTable, LowSclkInterruptT);
>  		}
> +		break;
>  	}
>  	pr_debug("can't get the offset of type %x member %x\n", type, member);
>  	return 0;
> diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c
> index ec14798e87b6..bddd6d09f887 100644
> --- a/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c
> @@ -2331,6 +2331,7 @@ static uint32_t fiji_get_offsetof(uint32_t type, uint32_t member)
>  		case DRAM_LOG_BUFF_SIZE:
>  			return offsetof(SMU73_SoftRegisters, DRAM_LOG_BUFF_SIZE);
>  		}
> +		break;
>  	case SMU_Discrete_DpmTable:
>  		switch (member) {
>  		case UvdBootLevel:
> @@ -2340,6 +2341,7 @@ static uint32_t fiji_get_offsetof(uint32_t type, uint32_t member)
>  		case LowSclkInterruptThreshold:
>  			return offsetof(SMU73_Discrete_DpmTable, LowSclkInterruptThreshold);
>  		}
> +		break;
>  	}
>  	pr_warn("can't get the offset of type %x member %x\n", type, member);
>  	return 0;
> diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c
> index 73aa368a454e..2d4c7f167b88 100644
> --- a/drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c
> @@ -2237,11 +2237,13 @@ static uint32_t iceland_get_offsetof(uint32_t type, uint32_t member)
>  		case DRAM_LOG_BUFF_SIZE:
>  			return offsetof(SMU71_SoftRegisters, DRAM_LOG_BUFF_SIZE);
>  		}
> +		break;
>  	case SMU_Discrete_DpmTable:
>  		switch (member) {
>  		case LowSclkInterruptThreshold:
>  			return offsetof(SMU71_Discrete_DpmTable, LowSclkInterruptThreshold);
>  		}
> +		break;
>  	}
>  	pr_warn("can't get the offset of type %x member %x\n", type, member);
>  	return 0;
> diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c
> index ae8378ed32ee..a2ba5b012866 100644
> --- a/drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c
> @@ -2619,6 +2619,7 @@ static uint32_t tonga_get_offsetof(uint32_t type, uint32_t member)
>  		case DRAM_LOG_BUFF_SIZE:
>  			return offsetof(SMU72_SoftRegisters, DRAM_LOG_BUFF_SIZE);
>  		}
> +		break;
>  	case SMU_Discrete_DpmTable:
>  		switch (member) {
>  		case UvdBootLevel:
> @@ -2628,6 +2629,7 @@ static uint32_t tonga_get_offsetof(uint32_t type, uint32_t member)
>  		case LowSclkInterruptThreshold:
>  			return offsetof(SMU72_Discrete_DpmTable, LowSclkInterruptThreshold);
>  		}
> +		break;
>  	}
>  	pr_warn("can't get the offset of type %x member %x\n", type, member);
>  	return 0;
> diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c
> index 3d415fabbd93..9f71512b2510 100644
> --- a/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c
> @@ -2185,6 +2185,7 @@ static uint32_t vegam_get_offsetof(uint32_t type, uint32_t member)
>  		case DRAM_LOG_BUFF_SIZE:
>  			return offsetof(SMU75_SoftRegisters, DRAM_LOG_BUFF_SIZE);
>  		}
> +		break;
>  	case SMU_Discrete_DpmTable:
>  		switch (member) {
>  		case UvdBootLevel:
> @@ -2194,6 +2195,7 @@ static uint32_t vegam_get_offsetof(uint32_t type, uint32_t member)
>  		case LowSclkInterruptThreshold:
>  			return offsetof(SMU75_Discrete_DpmTable, LowSclkInterruptThreshold);
>  		}
> +		break;
>  	}
>  	pr_warn("can't get the offset of type %x member %x\n", type, member);
>  	return 0;
> -- 
> 2.17.1
> 
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
