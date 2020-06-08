From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 08 Jun 2020 17:49:43 +0000
Subject: Re: [PATCH] drm/amd/display: Fix indenting in dcn30_set_output_transfer_func()
Message-Id: <20200608174943.GU22511@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200608141657.GB1912173@mwanda>
 <dcce7f702c674999c31fd358c3970d5fee1a6725.camel@perches.com>
In-Reply-To: <dcce7f702c674999c31fd358c3970d5fee1a6725.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <harry.wentland@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

On Mon, Jun 08, 2020 at 10:16:27AM -0700, Joe Perches wrote:
> On Mon, 2020-06-08 at 17:16 +0300, Dan Carpenter wrote:
> > These lines are a part of the if statement and they are supposed to
> > be indented one more tab.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> > index ab20320ebc994..37c310dbb3665 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> > @@ -203,9 +203,9 @@ bool dcn30_set_output_transfer_func(struct dc *dc,
> >  					stream->out_transfer_func,
> >  					&mpc->blender_params, false))
> >  				params = &mpc->blender_params;
> > -		 /* there are no ROM LUTs in OUTGAM */
> > -		if (stream->out_transfer_func->type = TF_TYPE_PREDEFINED)
> > -			BREAK_TO_DEBUGGER();
> > +			 /* there are no ROM LUTs in OUTGAM */
> > +			if (stream->out_transfer_func->type = TF_TYPE_PREDEFINED)
> > +				BREAK_TO_DEBUGGER();
> >  		}
> >  	}
> >  
> 
> Maybe the if is at the right indentation but the
> close brace below the if is misplaced instead?
> 

Yeah.  I considered that, but the code is correct, it's just the
indenting is wrong.  I normally leave drm/amd/ code alone but this
indenting was so confusing that I though it was worth fixing.

There are lots of ugly stuff which is not confusing like this:  (The
line numbers are from next-20200605).

drivers/gpu/drm/amd/amdgpu/../powerplay/amd_powerplay.c:1530 pp_asic_reset_mode_2() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3387 bw_calcs() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dwb.c:104 dwb2_enable() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dpp_cm.c:450 dpp20_get_blndgam_current() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dpp_cm.c:543 dpp20_get_shaper_current() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_mpc.c:306 mpc20_get_ogam_current() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:1519 dc_link_dp_perform_link_training() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:3137 core_link_enable_stream() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hwseq.c:207 dcn30_set_output_transfer_func() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.c:650 dpp3_get_blndgam_current() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.c:747 dpp3_get_shaper_current() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp_cm.c:67 dpp30_get_gamcor_current() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_mpc.c:116 mpc3_get_ogam_current() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_mpc.c:432 mpc3_get_shaper_current() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:2351 dcn30_update_bw_bounding_box() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:178 optc3_set_dsc_config() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:2704 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:2777 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:2633 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:5031 dml21_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:5036 dml21_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:5056 dml21_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_helpers.c:731 dmcu_load_iram() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c:5062 gfx_v8_0_pre_soft_reset() warn: inconsistent indenting

regards,
dan carpenter 
