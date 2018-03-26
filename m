From: Huang Rui <ray.huang@amd.com>
Date: Mon, 26 Mar 2018 03:30:25 +0000
Subject: Re: [PATCH] drm/amd/pp: silence a static checker warning
Message-Id: <20180326033024.GC27239@hr-amur2>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180323113903.GD28518@mwanda>
In-Reply-To: <20180323113903.GD28518@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tom St Denis <tom.stdenis@amd.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, Christian =?utf-8?B?S++/vW5pZw==?= <christian.koenig@amd.com>

On Fri, Mar 23, 2018 at 02:39:03PM +0300, Dan Carpenter wrote:
> This has a static checker warning because "frev" and "crev" can be
> uninitialized if "info" is NULL.  I just changed the order of the checks
> so that we check "info" first.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Huang Rui <ray.huang@amd.com>

> 
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c
> index 75a465f771f0..7b26607c646a 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c
> @@ -319,13 +319,13 @@ static int smu8_get_system_info_data(struct pp_hwmgr *hwmgr)
>  			GetIndexIntoMasterTable(DATA, IntegratedSystemInfo),
>  			&size, &frev, &crev);
>  
> -	if (crev != 9) {
> -		pr_err("Unsupported IGP table: %d %d\n", frev, crev);
> +	if (info = NULL) {
> +		pr_err("Could not retrieve the Integrated System Info Table!\n");
>  		return -EINVAL;
>  	}
>  
> -	if (info = NULL) {
> -		pr_err("Could not retrieve the Integrated System Info Table!\n");
> +	if (crev != 9) {
> +		pr_err("Unsupported IGP table: %d %d\n", frev, crev);
>  		return -EINVAL;
>  	}
>  
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
