From: CK Hu <ck.hu@mediatek.com>
Date: Tue, 23 May 2017 06:55:28 +0000
Subject: Re: [PATCH] drm/mediatek: re-phrase DRM_INFO error message
Message-Id: <1495522528.20811.17.camel@mtksdaap41>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170411134419.21277-1-colin.king@canonical.com>
In-Reply-To: <20170411134419.21277-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org

Hi, Colin:

Sorry for my late reply. I've applied this patch to my branch
mediatek-drm-next-4.13, thanks.

Regards,
CK

On Tue, 2017-04-11 at 14:44 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The current message contains a spelling mistake and is not easily
> parsable. Re-phrase it to be more understandable.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 808b995a990f..79d240ff1331 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -933,7 +933,7 @@ static u32 mtk_dsi_recv_cnt(u8 type, u8 *read_data)
>  		DRM_INFO("type is 0x02, try again\n");
>  		break;
>  	default:
> -		DRM_INFO("type(0x%x) cannot be non-recognite\n", type);
> +		DRM_INFO("type(0x%x) not recognized\n", type);
>  		break;
>  	}
>  


