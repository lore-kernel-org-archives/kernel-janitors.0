From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 10 Dec 2018 09:30:50 +0000
Subject: Re: [PATCH][drm-next] drm/selftest: fix spelling mistake "dimention" -> "dimenstion"
Message-Id: <503e3826-6e73-3875-f22d-4da25a37fcf4@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181210092619.4016-1-colin.king@canonical.com>
In-Reply-To: <20181210092619.4016-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Thomas Hellstrom <thellstrom@vmware.com>, Deepak Rawat <drawat@vmware.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Ooops, $SUBJECT should be:

"drm/selftest: fix spelling mistake "dimention" -> "dimension"

On 10/12/2018 09:26, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a pr_err message, fix this.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/selftests/test-drm_damage_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/selftests/test-drm_damage_helper.c b/drivers/gpu/drm/selftests/test-drm_damage_helper.c
> index a2f753205a3e..9d2bcdf8bc29 100644
> --- a/drivers/gpu/drm/selftests/test-drm_damage_helper.c
> +++ b/drivers/gpu/drm/selftests/test-drm_damage_helper.c
> @@ -53,7 +53,7 @@ static bool check_damage_clip(struct drm_plane_state *state, struct drm_rect *r,
>  	int src_y2 = (state->src.y2 >> 16) + !!(state->src.y2 & 0xFFFF);
>  
>  	if (x1 >= x2 || y1 >= y2) {
> -		pr_err("Cannot have damage clip with no dimention.\n");
> +		pr_err("Cannot have damage clip with no dimension.\n");
>  		return false;
>  	}
>  
> 
