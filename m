From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Fri, 19 May 2017 12:03:31 +0000
Subject: Re: [PATCH][drm-next] drm/pl111: make structure pl111_display_funcs static
Message-Id: <874lwhoxyk.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170519110203.19417-1-colin.king@canonical.com>
In-Reply-To: <20170519110203.19417-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Tom Cooksey <tom.cooksey@arm.com>, Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 19 May 2017, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> structure pl111_display_funcs can be made static as it does not need to be
> in global scope.  Fixes sparse warning:
>
> "warning: symbol 'pl111_display_funcs' was not declared. Should it
> be static?"
>
> Fixes: bed41005e6174d ("drm/pl111: Initial drm/kms driver for pl111")

The patch looks good and I appreciate what you're doing, but I question
the usefulness of adding Fixes: tags for trivial stuff like this. I'd
prefer Fixes: was reserved for actual fixes that should be backported to
any kernels that have the commit being fixed.

The same applies to many other patches you've sent recently.

BR,
Jani.

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/pl111/pl111_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
> index 39a5c33bce7d..bd8ff82c2fd9 100644
> --- a/drivers/gpu/drm/pl111/pl111_display.c
> +++ b/drivers/gpu/drm/pl111/pl111_display.c
> @@ -280,7 +280,7 @@ static int pl111_display_prepare_fb(struct drm_simple_display_pipe *pipe,
>  	return drm_fb_cma_prepare_fb(&pipe->plane, plane_state);
>  }
>  
> -const struct drm_simple_display_pipe_funcs pl111_display_funcs = {
> +static const struct drm_simple_display_pipe_funcs pl111_display_funcs = {
>  	.check = pl111_display_check,
>  	.enable = pl111_display_enable,
>  	.disable = pl111_display_disable,

-- 
Jani Nikula, Intel Open Source Technology Center
