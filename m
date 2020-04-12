From: abhinavk@codeaurora.org
Date: Sun, 12 Apr 2020 19:19:11 +0000
Subject: Re: [PATCH] drm/msm: Fix typo
Message-Id: <22cbe4e4310b7d475c02da6bf44c44f9@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200412143509.11353-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200412143509.11353-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, sean@poorly.run, linux-arm-msm-owner@vger.kernel.org

On 2020-04-12 07:35, Christophe JAILLET wrote:
> Duplicated 'we'
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> index 998bef1190a3..b5fed67c4651 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> @@ -959,7 +959,7 @@ static int mdp5_crtc_cursor_set(struct drm_crtc 
> *crtc,
>  	if (!ctl)
>  		return -EINVAL;
> 
> -	/* don't support LM cursors when we we have source split enabled */
> +	/* don't support LM cursors when we have source split enabled */
>  	if (mdp5_cstate->pipeline.r_mixer)
>  		return -EINVAL;
> 
> @@ -1030,7 +1030,7 @@ static int mdp5_crtc_cursor_move(struct drm_crtc
> *crtc, int x, int y)
>  		return -EINVAL;
>  	}
> 
> -	/* don't support LM cursors when we we have source split enabled */
> +	/* don't support LM cursors when we have source split enabled */
>  	if (mdp5_cstate->pipeline.r_mixer)
>  		return -EINVAL;
