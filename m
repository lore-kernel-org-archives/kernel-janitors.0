From: walter harms <wharms@bfs.de>
Date: Thu, 16 Jun 2016 07:26:03 +0000
Subject: Re: [patch] drm/amdgpu: missing bounds check in amdgpu_set_pp_force_state()
Message-Id: <5762548B.6060906@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160616064119.GA23129@mwanda>
In-Reply-To: <20160616064119.GA23129@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Eric Huang <JinHuiEric.Huang@amd.com>, =?ISO-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Jammy Zhou <Jammy.Zhou@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, Harry Wentland <harry.wentland@amd.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org



Am 16.06.2016 08:41, schrieb Dan Carpenter:
> There is no limit on high "idx" can go.  It should be less than
> ARRAY_SIZE(data.states) which is 16.
> 
> The "data" variable wasn't declared in that scope so I shifted the code
> around a bit to make it work.
> 
> Fixes: f3898ea12fc1 ('drm/amd/powerplay: add some sysfs interfaces for powerplay.')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> index 589b36e..ce9e97f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> @@ -275,25 +275,23 @@ static ssize_t amdgpu_set_pp_force_state(struct device *dev,
>  
>  	if (strlen(buf) = 1)
>  		adev->pp_force_state_enabled = false;
> -	else {
> -		ret = kstrtol(buf, 0, &idx);
> +	else if (adev->pp_enabled) {
> +		struct pp_states_info data;
>  
> -		if (ret) {
> +		ret = kstrtol(buf, 0, &idx);
> +		if (ret || idx >= ARRAY_SIZE(data.states)) {
>  			count = -EINVAL;
>  			goto fail;
>  		}


i would also expect a check idx < 0, does it mean this can not happen ?
otherwise maybe kstrtoul is a solution ?

re,
 wh

>  
> -		if (adev->pp_enabled) {
> -			struct pp_states_info data;
> -			amdgpu_dpm_get_pp_num_states(adev, &data);
> -			state = data.states[idx];
> -			/* only set user selected power states */
> -			if (state != POWER_STATE_TYPE_INTERNAL_BOOT &&
> -				state != POWER_STATE_TYPE_DEFAULT) {
> -				amdgpu_dpm_dispatch_task(adev,
> -						AMD_PP_EVENT_ENABLE_USER_STATE, &state, NULL);
> -				adev->pp_force_state_enabled = true;
> -			}
> +		amdgpu_dpm_get_pp_num_states(adev, &data);
> +		state = data.states[idx];
> +		/* only set user selected power states */
> +		if (state != POWER_STATE_TYPE_INTERNAL_BOOT &&
> +		    state != POWER_STATE_TYPE_DEFAULT) {
> +			amdgpu_dpm_dispatch_task(adev,
> +					AMD_PP_EVENT_ENABLE_USER_STATE, &state, NULL);
> +			adev->pp_force_state_enabled = true;
>  		}
>  	}
>  fail:
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
