From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Date: Tue, 04 Dec 2018 15:00:37 +0000
Subject: Re: [PATCH -next] drm/tinydrm: Use kmemdup rather than duplicating its implementation in repaper_spi
Message-Id: <b12a3f2a-deec-5da6-931c-884686b96e9d@tronnes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1543471233-159568-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1543471233-159568-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, airlied@linux.ie
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org


Den 29.11.2018 07.00, skrev YueHaibing:
> use kmemdup rather than duplicating its implementation
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Thanks, applied to drm-misc-next.

Noralf.

>   drivers/gpu/drm/tinydrm/repaper.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/tinydrm/repaper.c b/drivers/gpu/drm/tinydrm/repaper.c
> index 07f45a0..54d6fe0 100644
> --- a/drivers/gpu/drm/tinydrm/repaper.c
> +++ b/drivers/gpu/drm/tinydrm/repaper.c
> @@ -108,12 +108,11 @@ static int repaper_spi_transfer(struct spi_device *spi, u8 header,
>   
>   	/* Stack allocated tx? */
>   	if (tx && len <= 32) {
> -		txbuf = kmalloc(len, GFP_KERNEL);
> +		txbuf = kmemdup(tx, len, GFP_KERNEL);
>   		if (!txbuf) {
>   			ret = -ENOMEM;
>   			goto out_free;
>   		}
> -		memcpy(txbuf, tx, len);
>   	}
>   
>   	if (rx) {
>
>
>
