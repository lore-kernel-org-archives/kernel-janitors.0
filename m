From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 04 Feb 2021 19:09:53 +0000
Subject: Re: [PATCH] drm/bridge: make a const array static, makes object smaller
Message-Id: <YBxGgRh4ckgbI0Z/@pendragon.ideasonboard.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210204183344.110078-1-colin.king@canonical.com>
In-Reply-To: <20210204183344.110078-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>

Hi Colin,

Thank you for the patch.

On Thu, Feb 04, 2021 at 06:33:44PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the const array frs_limits on the stack but instead make
> it static. Makes the object code smaller by 128 bytes:
> 
> Before:
>    text    data     bss     dec     hex filename
>   24845    7440      64   32349    7e5d ./drivers/gpu/drm/bridge/tc358768.o
> 
> After:
>    text    data     bss     dec     hex filename
>   24749    7408      64   32221    7ddd ./drivers/gpu/drm/bridge/tc358768.o
> 
> (gcc version 10.2.0)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/tc358768.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 8ed8302d6bbb..2495ea46b091 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -291,7 +291,7 @@ static int tc358768_calc_pll(struct tc358768_priv *priv,
>  			     const struct drm_display_mode *mode,
>  			     bool verify_only)
>  {
> -	const u32 frs_limits[] = {
> +	static const u32 frs_limits[] = {
>  		1000000000,
>  		500000000,
>  		250000000,

-- 
Regards,

Laurent Pinchart
