From: Mukesh Ojha <mojha@codeaurora.org>
Date: Wed, 15 May 2019 12:38:40 +0000
Subject: Re: [PATCH] drm/nouveau/bios/init: fix spelling mistake "CONDITON" -> "CONDITION"
Message-Id: <c214275e-912b-9cec-d0c1-4eadd07a100e@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190514205701.5750-1-colin.king@canonical.com>
In-Reply-To: <20190514205701.5750-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 5/15/2019 2:27 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a warning message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh

> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> index ec0e9f7224b5..3f4f27d191ae 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> @@ -834,7 +834,7 @@ init_generic_condition(struct nvbios_init *init)
>   		init_exec_set(init, false);
>   		break;
>   	default:
> -		warn("INIT_GENERIC_CONDITON: unknown 0x%02x\n", cond);
> +		warn("INIT_GENERIC_CONDITION: unknown 0x%02x\n", cond);
>   		init->offset += size;
>   		break;
>   	}
