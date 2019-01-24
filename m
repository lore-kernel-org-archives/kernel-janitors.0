From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 24 Jan 2019 17:28:40 +0000
Subject: Re: [PATCH] drm/nouveau/pmu: don't print reply values if exec is false
Message-Id: <2ca59545-bc45-8f85-6a32-e8f495a74b57@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181219152949.14669-1-colin.king@canonical.com>
In-Reply-To: <20181219152949.14669-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

ping?

On 19/12/2018 15:29, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the uninitialized values in the array reply are printed out
> when exec is false and nvkm_pmu_send has not updated the array. Avoid
> confusion by only dumping out these values if they have been actually
> updated.
> 
> Detected by CoverityScan, CID#1271291 ("Uninitialized scaler variable")
> Fixes: ebb58dc2ef8c ("drm/nouveau/pmu: rename from pwr (no binary change)")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/memx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/memx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/memx.c
> index 11b28b086a06..7b052879af72 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/memx.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/memx.c
> @@ -88,10 +88,10 @@ nvkm_memx_fini(struct nvkm_memx **pmemx, bool exec)
>  	if (exec) {
>  		nvkm_pmu_send(pmu, reply, PROC_MEMX, MEMX_MSG_EXEC,
>  			      memx->base, finish);
> +		nvkm_debug(subdev, "Exec took %uns, PMU_IN %08x\n",
> +			   reply[0], reply[1]);
>  	}
>  
> -	nvkm_debug(subdev, "Exec took %uns, PMU_IN %08x\n",
> -		   reply[0], reply[1]);
>  	kfree(memx);
>  	return 0;
>  }
> 
