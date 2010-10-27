From: "Miller, Mike (OS Dev)" <Mike.Miller@hp.com>
Date: Wed, 27 Oct 2010 15:47:57 +0000
Subject: RE: [PATCH] scsi: hpsa: fix information leak to userland
Message-Id: <0F5B06BAB751E047AB5C87D1F77A77887D0E579A63@GVW0547EXC.americas.hpqcorp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288194054-9276-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1288194054-9276-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Cc: "Stephen M. Cameron" <scameron@beardog.cce.hp.com>, "James E.J. Bottomley" <James.Bottomley@suse.de>, ISS StorageDev <iss_storagedev@hp.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>



> -----Original Message-----
> From: Vasiliy Kulikov [mailto:segooon@gmail.com]
> Sent: Wednesday, October 27, 2010 10:41 AM
> To: kernel-janitors@vger.kernel.org
> Cc: Stephen M. Cameron; James E.J. Bottomley; Miller, Mike (OS Dev);
> ISS StorageDev; linux-scsi@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: [PATCH] scsi: hpsa: fix information leak to userland
> 
> Structure IOCTL_Command_struct is copied to userland with
> some padding fields at the end of the struct unitialized.
> It leads to leaking of contents of kernel stack memory.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> ---
>  Compile tested.
> 
>  drivers/scsi/hpsa.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/scsi/hpsa.c b/drivers/scsi/hpsa.c
> index c5d0606..641a38c 100644
> --- a/drivers/scsi/hpsa.c
> +++ b/drivers/scsi/hpsa.c
> @@ -2298,6 +2298,7 @@ static int hpsa_ioctl32_passthru(struct
> scsi_device *dev, int cmd, void *arg)
>  	int err;
>  	u32 cp;
> 
> +	memset(&arg64, 0, sizeof(arg64));
>  	err = 0;
>  	err |= copy_from_user(&arg64.LUN_info, &arg32->LUN_info,
>  			   sizeof(arg64.LUN_info));
> @@ -2334,6 +2335,7 @@ static int hpsa_ioctl32_big_passthru(struct
> scsi_device *dev,
>  	int err;
>  	u32 cp;
> 
> +	memset(&arg64, 0, sizeof(arg64));
>  	err = 0;
>  	err |= copy_from_user(&arg64.LUN_info, &arg32->LUN_info,
>  			   sizeof(arg64.LUN_info));
> --
> 1.7.0.4

Acked-by: Mike Milelr <mike.miller@hp.com>

