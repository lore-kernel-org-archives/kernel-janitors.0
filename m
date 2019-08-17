From: Sam Ravnborg <sam@ravnborg.org>
Date: Sat, 17 Aug 2019 14:55:16 +0000
Subject: Re: [PATCH][drm-next] drm/panel: remove redundant assignment to val
Message-Id: <20190817145516.GA11584@ravnborg.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190817122124.29650-1-colin.king@canonical.com>
In-Reply-To: <20190817122124.29650-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>

On Sat, Aug 17, 2019 at 01:21:24PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable val is initialized to a value in a for-loop that is
> never read and hence it is redundant. Remove it.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks. Applied and pushed to drm-misc-next.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-tpo-td043mtea1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
> index 3b4f30c0fdae..84370562910f 100644
> --- a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
> +++ b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
> @@ -116,7 +116,7 @@ static void td043mtea1_write_gamma(struct td043mtea1_panel *lcd)
>  	td043mtea1_write(lcd, 0x13, val);
>  
>  	/* gamma bits [7:0] */
> -	for (val = i = 0; i < 12; i++)
> +	for (i = 0; i < 12; i++)
>  		td043mtea1_write(lcd, 0x14 + i, gamma[i] & 0xff);
>  }
>  
> -- 
> 2.20.1
