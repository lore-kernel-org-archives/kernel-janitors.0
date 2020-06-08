From: Joe Perches <joe@perches.com>
Date: Mon, 08 Jun 2020 17:16:27 +0000
Subject: Re: [PATCH] drm/amd/display: Fix indenting in dcn30_set_output_transfer_func()
Message-Id: <dcce7f702c674999c31fd358c3970d5fee1a6725.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200608141657.GB1912173@mwanda>
In-Reply-To: <20200608141657.GB1912173@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

On Mon, 2020-06-08 at 17:16 +0300, Dan Carpenter wrote:
> These lines are a part of the if statement and they are supposed to
> be indented one more tab.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> index ab20320ebc994..37c310dbb3665 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> @@ -203,9 +203,9 @@ bool dcn30_set_output_transfer_func(struct dc *dc,
>  					stream->out_transfer_func,
>  					&mpc->blender_params, false))
>  				params = &mpc->blender_params;
> -		 /* there are no ROM LUTs in OUTGAM */
> -		if (stream->out_transfer_func->type = TF_TYPE_PREDEFINED)
> -			BREAK_TO_DEBUGGER();
> +			 /* there are no ROM LUTs in OUTGAM */
> +			if (stream->out_transfer_func->type = TF_TYPE_PREDEFINED)
> +				BREAK_TO_DEBUGGER();
>  		}
>  	}
>  

Maybe the if is at the right indentation but the
close brace below the if is misplaced instead?

Also, because this code uses very long identifiers,
it would read better using wider columns as the
logic in the code itself isn't complicated but the
80 column wrapping makes it seem so.

Wrapping could be something like:
---
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index ab20320ebc99..56e91a73610f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -190,18 +190,16 @@ bool dcn30_set_output_transfer_func(struct dc *dc,
 	struct pwl_params *params = NULL;
 	bool ret = false;
 
-	/* program OGAM or 3DLUT only for the top pipe*/
+	/* program OGAM or 3DLUT only for the top pipe */
 	if (pipe_ctx->top_pipe = NULL) {
-		/*program rmu shaper and 3dlut in MPC*/
+		/* program rmu shaper and 3dlut in MPC */
 		ret = dcn30_set_mpc_shaper_3dlut(pipe_ctx, stream);
-		if (ret = false && mpc->funcs->set_output_gamma && stream->out_transfer_func) {
+		if (!ret && mpc->funcs->set_output_gamma && stream->out_transfer_func) {
 			if (stream->out_transfer_func->type = TF_TYPE_HWPWL)
 				params = &stream->out_transfer_func->pwl;
-			else if (pipe_ctx->stream->out_transfer_func->type =
-					TF_TYPE_DISTRIBUTED_POINTS &&
-					cm3_helper_translate_curve_to_hw_format(
-					stream->out_transfer_func,
-					&mpc->blender_params, false))
+			else if (pipe_ctx->stream->out_transfer_func->type = TF_TYPE_DISTRIBUTED_POINTS &&
+				 cm3_helper_translate_curve_to_hw_format(stream->out_transfer_func,
+									 &mpc->blender_params, false))
 				params = &mpc->blender_params;
 		 /* there are no ROM LUTs in OUTGAM */
 		if (stream->out_transfer_func->type = TF_TYPE_PREDEFINED)
