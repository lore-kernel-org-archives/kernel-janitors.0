From: Eric Huang <jinhuieric.huang@amd.com>
Date: Thu, 18 May 2017 16:28:09 +0000
Subject: Re: [PATCH] drm/amd/powerplay: fix a signedness bugs
Message-Id: <ef4ba551-a52b-d2e0-5ba4-7271ee6f4e85@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170516144253.vvu3i6mbx3rv5uki@mwanda>
In-Reply-To: <20170516144253.vvu3i6mbx3rv5uki@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Ken Wang <Qingqing.wang@amd.com>, Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

Reviewed-by: Eric Huang <JinHuiEric.Huang@amd.com>


On 2017-05-16 10:42 AM, Dan Carpenter wrote:
> Smatch complains about a signedness bug here:
>
> 	vega10_hwmgr.c:4202 vega10_force_clock_level()
> 	warn: always true condition '(i >= 0) => (0-u32max >= 0)'
>
> Fixes: 7b52db39a4c2 ("drm/amd/powerplay: fix bug sclk/mclk level can't be set on vega10.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
> index ad30f5d3a10d..2614af2f553f 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
> @@ -4186,7 +4186,7 @@ static int vega10_force_clock_level(struct pp_hwmgr *hwmgr,
>   		enum pp_clock_type type, uint32_t mask)
>   {
>   	struct vega10_hwmgr *data = (struct vega10_hwmgr *)(hwmgr->backend);
> -	uint32_t i;
> +	int i;
>   
>   	if (hwmgr->dpm_level != AMD_DPM_FORCED_LEVEL_MANUAL)
>   		return -EINVAL;

