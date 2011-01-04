From: "Moger, Babu" <Babu.Moger@lsi.com>
Date: Tue, 04 Jan 2011 16:13:28 +0000
Subject: RE: [patch] [SCSI] scsi_dh: potential null dereference in
Message-Id: <E463DF2B2E584B4A82673F53D62C2EF4F5582F42@cosmail01.lsi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110103054833.GT1886@bicker>
In-Reply-To: <20110103054833.GT1886@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, "James E.J. Bottomley" <James.Bottomley@suse.de>
Cc: Mike Snitzer <snitzer@redhat.com>, Menny Hamburger <Menny_Hamburger@Dell.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Looks good to me.

> -----Original Message-----
> From: Dan Carpenter [mailto:error27@gmail.com]
> Sent: Sunday, January 02, 2011 11:49 PM
> To: James E.J. Bottomley
> Cc: Mike Snitzer; Menny Hamburger; Moger, Babu; linux-
> scsi@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [patch] [SCSI] scsi_dh: potential null dereference in
> scsi_dh_activate()
> 
> We assumed "sdev" could be NULL ealier, so lets check it here as well.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/scsi/device_handler/scsi_dh.c
> b/drivers/scsi/device_handler/scsi_dh.c
> index b837c5b..ff340e3 100644
> --- a/drivers/scsi/device_handler/scsi_dh.c
> +++ b/drivers/scsi/device_handler/scsi_dh.c
> @@ -446,7 +446,7 @@ int scsi_dh_activate(struct request_queue *q,
> activate_complete fn, void *data)
>  	    sdev->sdev_state = SDEV_CANCEL ||
>  	    sdev->sdev_state = SDEV_DEL)
>  		err = SCSI_DH_NOSYS;
> -	if (sdev->sdev_state = SDEV_OFFLINE)
> +	if (sdev && sdev->sdev_state = SDEV_OFFLINE)
>  		err = SCSI_DH_DEV_OFFLINED;
>  	spin_unlock_irqrestore(q->queue_lock, flags);
> 
