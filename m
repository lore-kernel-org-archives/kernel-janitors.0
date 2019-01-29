From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Date: Tue, 29 Jan 2019 20:49:48 +0000
Subject: Re: [PATCH] drm/nouveau: fix missing break in switch statement
Message-Id: <63660e1c-1075-80a0-6b11-5f1a8cb253fc@embeddedor.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181008204736.8941-1-colin.king@canonical.com>
In-Reply-To: <20181008204736.8941-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 10/8/18 3:47 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The NOUVEAU_GETPARAM_PCI_DEVICE case is missing a break statement and falls
> through to the following NOUVEAU_GETPARAM_BUS_TYPE case and may end up
> re-assigning the getparam->value to an undesired value. Fix this by adding
> in the missing break.
> 
> Detected by CoverityScan, CID#1460507 ("Missing break in switch")
> 
> Fixes: 359088d5b8ec ("drm/nouveau: remove trivial cases of nvxx_device() usage")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Friendly ping:

Who can take this?

Thanks
--
Gustavo

> ---
>  drivers/gpu/drm/nouveau/nouveau_abi16.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index e67a471331b5..6ec745873bc5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -214,6 +214,7 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
>  			WARN_ON(1);
>  			break;
>  		}
> +		break;
>  	case NOUVEAU_GETPARAM_FB_SIZE:
>  		getparam->value = drm->gem.vram_available;
>  		break;
> 
