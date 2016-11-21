From: Jitendra Bhivare <jitendra.bhivare@broadcom.com>
Date: Mon, 21 Nov 2016 04:14:49 +0000
Subject: RE: [patch] scsi: be2iscsi: allocate enough memory in beiscsi_boot_get_sinfo()
Message-Id: <eecde6c0e84128fb594e83874d08e05c@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161118115339.GD3281@mwanda>
In-Reply-To: <20161118115339.GD3281@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Subramanian Seetharaman <subbu.seetharaman@broadcom.com>
Cc: Ketan Mukadam <ketan.mukadam@broadcom.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Friday, November 18, 2016 5:24 PM
> To: Subbu Seetharaman; Jitendra Bhivare
> Cc: Ketan Mukadam; James E.J. Bottomley; Martin K. Petersen; linux-
> scsi@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [patch] scsi: be2iscsi: allocate enough memory in
> beiscsi_boot_get_sinfo()
>
> We accidentally allocate sizeof(u32) instead of sizeof(struct
> be_cmd_get_session_resp).
>
> Fixes: 50a4b824be9e ("scsi: be2iscsi: Fix to make boot discovery
non-blocking")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/scsi/be2iscsi/be_mgmt.c
b/drivers/scsi/be2iscsi/be_mgmt.c
> index aebc4dd..ac05317b 100644
> --- a/drivers/scsi/be2iscsi/be_mgmt.c
> +++ b/drivers/scsi/be2iscsi/be_mgmt.c
> @@ -1083,7 +1083,7 @@ unsigned int beiscsi_boot_get_sinfo(struct
> beiscsi_hba *phba)
>  	nonemb_cmd = &phba->boot_struct.nonemb_cmd;
>  	nonemb_cmd->size = sizeof(*resp);
>  	nonemb_cmd->va = pci_alloc_consistent(phba->ctrl.pdev,
> -					      sizeof(nonemb_cmd->size),
> +					      nonemb_cmd->size,
>  					      &nonemb_cmd->dma);
>  	if (!nonemb_cmd->va) {
>  		mutex_unlock(&ctrl->mbox_lock);

Reviewed by: Jitendra Bhivare <jitendra.bhivare@broadcom.com>

Thanks,

JB
