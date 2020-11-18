From: Lee Jones <lee.jones@linaro.org>
Date: Wed, 18 Nov 2020 13:55:25 +0000
Subject: Re: [PATCH][next] drm/selftests/test-drm_dp_mst_helper: fix memory leak allocated to 'out'
Message-Id: <20201118135525.GT1869941@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201118134901.461841-1-colin.king@canonical.com>
In-Reply-To: <20201118134901.461841-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, 18 Nov 2020, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when txmsg fails to allocate then there is a leak on 'out'. Fix
> this by setting result to false and exiting via the clean up exit path.
> Note since txmsg is NULL at this point, the kfree of txmsg is a no-op.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: 09234b88ef55 ("drm/selftests/test-drm_dp_mst_helper: Move 'sideband_msg_req_encode_decode' onto the heap")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

This is fixed in my local branch.

Looks like the wrong version of the patch was sent/applied.

Either way, thanks for the fix Colin.

Reviewed-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> index 6b4759ed6bfd..dbac073ed385 100644
> --- a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> +++ b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> @@ -131,8 +131,10 @@ sideband_msg_req_encode_decode(struct drm_dp_sideband_msg_req_body *in)
>  		return false;
>  
>  	txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
> -	if (!txmsg)
> -		return false;
> +	if (!txmsg) {
> +		result = false;
> +		goto out;
> +	}
>  
>  	drm_dp_encode_sideband_req(in, txmsg);
>  	ret = drm_dp_decode_sideband_req(txmsg, out);

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
