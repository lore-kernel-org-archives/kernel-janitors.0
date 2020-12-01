From: Helen Koike <helen.koike@collabora.com>
Date: Tue, 01 Dec 2020 14:39:41 +0000
Subject: Re: [PATCH v2] media: rockchip: rkisp1: remove useless debugfs checks
Message-Id: <17d5555c-1f95-159b-f5db-cd3db0704a6c@collabora.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201201143058.GJ2767@kadam>
In-Reply-To: <20201201143058.GJ2767@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Heiko Stuebner <heiko@sntech.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org



On 12/1/20 11:30 AM, Dan Carpenter wrote:
> The debugfs_create_dir() function never returns NULLs so this code will
> never be executed.  It's not intended that callers will check for
> debugfs errors in the normal case and it's not necessary in this driver,
> so we can just delete this code.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Since the debugfs_create_*() functions already check the parent
with IS_ERR(), this looks good to me.

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
> v2: Fix subject
> 
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 9af137e4967f..68da1eed753d 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -430,10 +430,6 @@ static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
>  	struct rkisp1_debug *debug = &rkisp1->debug;
>  
>  	debug->debugfs_dir = debugfs_create_dir(RKISP1_DRIVER_NAME, NULL);
> -	if (!debug->debugfs_dir) {
> -		dev_dbg(rkisp1->dev, "failed to create debugfs directory\n");
> -		return;
> -	}
>  	debugfs_create_ulong("data_loss", 0444, debug->debugfs_dir,
>  			     &debug->data_loss);
>  	debugfs_create_ulong("outform_size_err", 0444,  debug->debugfs_dir,
> 
