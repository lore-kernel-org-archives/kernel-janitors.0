From: Mukesh Ojha <mojha@codeaurora.org>
Date: Thu, 18 Apr 2019 19:14:11 +0000
Subject: Re: [PATCH] drm/nouveau/fb/ramgk104: fix spelling mistake "sucessfully" -> "successfully"
Message-Id: <e979e0ac-62e7-1b5e-6542-2db3debebb32@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190418165345.20909-1-colin.king@canonical.com>
In-Reply-To: <20190418165345.20909-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 4/18/2019 10:23 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a nvkm_debug message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
> index 8bcb7e79a0cb..456aed1f2a02 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
> @@ -1070,7 +1070,7 @@ gk104_ram_calc_xits(struct gk104_ram *ram, struct nvkm_ram_data *next)
>   			nvkm_error(subdev, "unable to calc plls\n");
>   			return -EINVAL;
>   		}
> -		nvkm_debug(subdev, "sucessfully calced PLLs for clock %i kHz"
> +		nvkm_debug(subdev, "successfully calced PLLs for clock %i kHz"
>   				" (refclock: %i kHz)\n", next->freq, ret);
>   	} else {
>   		/* calculate refpll coefficients */
