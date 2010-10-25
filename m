From: "Miller, Mike (OS Dev)" <Mike.Miller@hp.com>
Date: Mon, 25 Oct 2010 14:40:55 +0000
Subject: RE: [PATCH 1/2] block: cciss: fix information leak to userland
Message-Id: <0F5B06BAB751E047AB5C87D1F77A77887D0E2807DF@GVW0547EXC.americas.hpqcorp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1287822311-14783-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1287822311-14783-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Cc: Jens Axboe <jaxboe@fusionio.com>, "Stephen M. Cameron" <scameron@beardog.cce.hp.com>, Andrew Morton <akpm@linux-foundation.org>, ISS StorageDev <iss_storagedev@hp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

 

> -----Original Message-----
> From: Vasiliy Kulikov [mailto:segooon@gmail.com] 
> Sent: Saturday, October 23, 2010 3:25 AM
> To: kernel-janitors@vger.kernel.org
> Cc: Miller, Mike (OS Dev); Jens Axboe; Stephen M. Cameron; 
> Andrew Morton; ISS StorageDev; linux-kernel@vger.kernel.org
> Subject: [PATCH 1/2] block: cciss: fix information leak to userland
> 
> Structure IOCTL_Command_struct is copied to userland with 
> some padding fields at the end of the struct unitialized.
> It leads to leaking of stack memory.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> ---
>  drivers/block/cciss.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/block/cciss.c b/drivers/block/cciss.c 
> index 762a81a..cd08324 100644
> --- a/drivers/block/cciss.c
> +++ b/drivers/block/cciss.c
> @@ -1142,6 +1142,7 @@ static int 
> cciss_ioctl32_passthru(struct block_device *bdev, fmode_t mode,
>  	int err;
>  	u32 cp;
>  
> +	memset(&arg64, 0, sizeof(arg64));
>  	err = 0;
>  	err |>  	    copy_from_user(&arg64.LUN_info, &arg32->LUN_info,
> --

Acked-by: Mike Miller <mike.miller@hp.com>

> 1.7.0.4
> 
> 