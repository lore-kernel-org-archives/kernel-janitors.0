From: walter harms <wharms@bfs.de>
Date: Fri, 17 Jan 2020 14:26:42 +0000
Subject: Re: [PATCH][next] drm/amd/display: fix for-loop with incorrectly sized loop counter
Message-Id: <5E21C422.6040708@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200117133305.113280-1-colin.king@canonical.com>
In-Reply-To: <20200117133305.113280-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Zhou <David1.Zhou@amd.com>, kernel-janitors@vger.kernel.org, Leo Li <sunpeng.li@amd.com>, Wenjing Liu <Wenjing.Liu@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Nikola Cornij <Nikola.Cornij@amd.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <harry.wentland@amd.com>, =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>



Am 17.01.2020 14:33, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> A for-loop is iterating from 0 up to 1000 however the loop variable count
> is a u8 and hence not large enough.  Fix this by making count an int.
> Also remove the redundant initialization of count since this is never used
> and add { } on the loop statement make the loop block clearer.
> 
> Addresses-Coverity: ("Operands don't affect result")
> Fixes: ed581a0ace44 ("drm/amd/display: wait for update when setting dpg test pattern")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> index 6ab298c65247..cbed738a4246 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -3680,7 +3680,7 @@ static void set_crtc_test_pattern(struct dc_link *link,
>  			struct pipe_ctx *odm_pipe;
>  			enum controller_dp_color_space controller_color_space;
>  			int opp_cnt = 1;
> -			uint8_t count = 0;
> +			int count;
>  
>  			switch (test_pattern_color_space) {
>  			case DP_TEST_PATTERN_COLOR_SPACE_RGB:
> @@ -3725,11 +3725,12 @@ static void set_crtc_test_pattern(struct dc_link *link,
>  				width,
>  				height);
>  			/* wait for dpg to blank pixel data with test pattern */
> -			for (count = 0; count < 1000; count++)
> +			for (count = 0; count < 1000; count++) {
>  				if (opp->funcs->dpg_is_blanked(opp))
>  					break;
>  				else
>  					udelay(100);
> +			}
>  		}
>  	}
>  	break;

Nitpick:
the else is useless you can remove it.

re,
 wh
