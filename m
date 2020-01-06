From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 06 Jan 2020 14:45:22 +0000
Subject: Re: [PATCH][next] scsi: qla2xxx: fix null pointer dereference on null_fcport
Message-Id: <20200106144522.GL3911@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200106141144.52888-1-colin.king@canonical.com>
In-Reply-To: <20200106141144.52888-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Himanshu Madhani <hmadhani@marvell.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Quinn Tran <qutran@marvell.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jan 06, 2020 at 02:11:44PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently several error exit return paths end up passing a null
> new_fcport pointer to function qla2x00_free_fcport and this causes
> a null pointer dereference.  Fix this by moving and renaming the
> exit path label to be after the call to qla2x00_free_fcport to avoid
> the errorneous and unnecessary call to qla2x00_free_fcport.
> 
> Addresses-Coverity: ("Dereference after null check")
> Fixes: 3dae220595ba ("scsi: qla2xxx: Use common routine to free fcport struct")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/scsi/qla2xxx/qla_init.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/scsi/qla2xxx/qla_init.c b/drivers/scsi/qla2xxx/qla_init.c
> index a5076f43edea..ed056626d7a3 100644
> --- a/drivers/scsi/qla2xxx/qla_init.c
> +++ b/drivers/scsi/qla2xxx/qla_init.c
> @@ -5108,7 +5108,7 @@ qla2x00_configure_local_loop(scsi_qla_host_t *vha)
>  	rval = qla2x00_get_id_list(vha, ha->gid_list, ha->gid_list_dma,
>  	    &entries);
>  	if (rval != QLA_SUCCESS)
> -		goto cleanup_allocation;
> +		goto exit;
>  
>  	ql_dbg(ql_dbg_disc, vha, 0x2011,
>  	    "Entries in ID list (%d).\n", entries);
> @@ -5138,7 +5138,7 @@ qla2x00_configure_local_loop(scsi_qla_host_t *vha)
>  		ql_log(ql_log_warn, vha, 0x2012,
>  		    "Memory allocation failed for fcport.\n");
>  		rval = QLA_MEMORY_ALLOC_FAILED;
> -		goto cleanup_allocation;
> +		goto exit;
>  	}
>  	new_fcport->flags &= ~FCF_FABRIC_DEVICE;
>  
> @@ -5228,7 +5228,7 @@ qla2x00_configure_local_loop(scsi_qla_host_t *vha)
>  				ql_log(ql_log_warn, vha, 0xd031,
>  				    "Failed to allocate memory for fcport.\n");
>  				rval = QLA_MEMORY_ALLOC_FAILED;
> -				goto cleanup_allocation;
> +				goto exit;

This leaks now.

>  			}
>  			spin_lock_irqsave(&vha->hw->tgt.sess_lock, flags);
>  			new_fcport->flags &= ~FCF_FABRIC_DEVICE;
> @@ -5239,7 +5239,6 @@ qla2x00_configure_local_loop(scsi_qla_host_t *vha)
>  		/* Base iIDMA settings on HBA port speed. */
>  		fcport->fp_speed = ha->link_data_rate;
>  
> -		found_devs++;

Delete "found_devs" completely.  Also remove the "new_fcport = NULL;"
line because that's not required any more.

regards,
dan carpenter
