From: Huang Rui <ray.huang@amd.com>
Date: Thu, 07 Jun 2018 10:32:50 +0000
Subject: Re: [PATCH][next] drm/amd/pp: initialized result to zero before or'ing in data
Message-Id: <20180607103248.GA10576@hr-amur2>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180606121831.3347-1-colin.king@canonical.com>
In-Reply-To: <20180606121831.3347-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

On Wed, Jun 06, 2018 at 01:18:31PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The current use of result is or'ing in values and checking for
> a non-zero result, however, result is not initialized to zero
> so it potentially contains garbage to start with. Fix this by
> initializing it to the first return from the call to
> vega10_program_didt_config_registers.
> 
> Detected by cppcheck:
> "(error) Uninitialized variable: result"
> 
> Fixes: 9b7b8154cdb8 ("drm/amd/powerplay: added didt support for vega10")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Nice catch, we must check return values for programming didt registers all
as 0.

Acked-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/amd/powerplay/hwmgr/vega10_powertune.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_powertune.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_powertune.c
> index a9efd8554fbc..dbe4b1f66784 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_powertune.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_powertune.c
> @@ -1104,7 +1104,7 @@ static int vega10_enable_psm_gc_edc_config(struct pp_hwmgr *hwmgr)
>  	for (count = 0; count < num_se; count++) {
>  		data = GRBM_GFX_INDEX__INSTANCE_BROADCAST_WRITES_MASK | GRBM_GFX_INDEX__SH_BROADCAST_WRITES_MASK | ( count << GRBM_GFX_INDEX__SE_INDEX__SHIFT);
>  		WREG32_SOC15(GC, 0, mmGRBM_GFX_INDEX, data);
> -		result |= vega10_program_didt_config_registers(hwmgr, PSMSEEDCStallPatternConfig_Vega10, VEGA10_CONFIGREG_DIDT);
> +		result = vega10_program_didt_config_registers(hwmgr, PSMSEEDCStallPatternConfig_Vega10, VEGA10_CONFIGREG_DIDT);
>  		result |= vega10_program_didt_config_registers(hwmgr, PSMSEEDCStallDelayConfig_Vega10, VEGA10_CONFIGREG_DIDT);
>  		result |= vega10_program_didt_config_registers(hwmgr, PSMSEEDCCtrlResetConfig_Vega10, VEGA10_CONFIGREG_DIDT);
>  		result |= vega10_program_didt_config_registers(hwmgr, PSMSEEDCCtrlConfig_Vega10, VEGA10_CONFIGREG_DIDT);
> -- 
> 2.17.0
> 
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
