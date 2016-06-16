From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Thu, 16 Jun 2016 08:39:42 +0000
Subject: Re: [patch v2] drm/amdgpu: missing bounds check in amdgpu_set_pp_force_state()
Message-Id: <576265CE.1070809@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160616083023.GA7046@mwanda>
In-Reply-To: <20160616083023.GA7046@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Alex Deucher <alexander.deucher@amd.com>
Cc: Jammy Zhou <Jammy.Zhou@amd.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Geliang Tang <geliangtang@163.com>, Eric Huang <JinHuiEric.Huang@amd.com>, Rex Zhu <Rex.Zhu@amd.com>

Am 16.06.2016 um 10:30 schrieb Dan Carpenter:
> There is no limit on high "idx" can go.  It should be less than
> ARRAY_SIZE(data.states) which is 16.
>
> The "data" variable wasn't declared in that scope so I shifted the code
> around a bit to make it work.  Also I made "idx" unsigned.
>
> Fixes: f3898ea12fc1 ('drm/amd/powerplay: add some sysfs interfaces for po=
werplay.')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Christian K=F6nig <christian.koenig@amd.com>.

> ---
> v2: make idx unsigned
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_pm.c
> index 589b36e..0e13d80 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> @@ -270,30 +270,28 @@ static ssize_t amdgpu_set_pp_force_state(struct dev=
ice *dev,
>   	struct drm_device *ddev =3D dev_get_drvdata(dev);
>   	struct amdgpu_device *adev =3D ddev->dev_private;
>   	enum amd_pm_state_type state =3D 0;
> -	long idx;
> +	unsigned long idx;
>   	int ret;
>  =20
>   	if (strlen(buf) =3D 1)
>   		adev->pp_force_state_enabled =3D false;
> -	else {
> -		ret =3D kstrtol(buf, 0, &idx);
> +	else if (adev->pp_enabled) {
> +		struct pp_states_info data;
>  =20
> -		if (ret) {
> +		ret =3D kstrtoul(buf, 0, &idx);
> +		if (ret || idx >=3D ARRAY_SIZE(data.states)) {
>   			count =3D -EINVAL;
>   			goto fail;
>   		}
>  =20
> -		if (adev->pp_enabled) {
> -			struct pp_states_info data;
> -			amdgpu_dpm_get_pp_num_states(adev, &data);
> -			state =3D data.states[idx];
> -			/* only set user selected power states */
> -			if (state !=3D POWER_STATE_TYPE_INTERNAL_BOOT &&
> -				state !=3D POWER_STATE_TYPE_DEFAULT) {
> -				amdgpu_dpm_dispatch_task(adev,
> -						AMD_PP_EVENT_ENABLE_USER_STATE, &state, NULL);
> -				adev->pp_force_state_enabled =3D true;
> -			}
> +		amdgpu_dpm_get_pp_num_states(adev, &data);
> +		state =3D data.states[idx];
> +		/* only set user selected power states */
> +		if (state !=3D POWER_STATE_TYPE_INTERNAL_BOOT &&
> +		    state !=3D POWER_STATE_TYPE_DEFAULT) {
> +			amdgpu_dpm_dispatch_task(adev,
> +					AMD_PP_EVENT_ENABLE_USER_STATE, &state, NULL);
> +			adev->pp_force_state_enabled =3D true;
>   		}
>   	}
>   fail:

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
