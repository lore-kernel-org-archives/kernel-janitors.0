From: Himanshu Madhani <himanshu.madhani@oracle.com>
Date: Thu, 25 Jun 2020 14:11:04 +0000
Subject: Re: [PATCH] scsi: qla2xxx: Fix a condition in qla2x00_find_all_fabric_devs()
Message-Id: <6B3598A1-4F56-4D63-A672-644242B0A8F2@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200619143041.GD267142@mwanda>
In-Reply-To: <20200619143041.GD267142@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Nilesh Javali <njavali@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Hannes Reinecke <hare@suse.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org



> On Jun 19, 2020, at 9:30 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> This code doesn't make sense unless the correct "fcport" was found.
> 
> Fixes: 9dd9686b1419 ("scsi: qla2xxx: Add changes for devloss timeout in driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is from static analysis and review.  I'm not super familiar with
> the code and I can't test it.  Please review it extra carefully.
> 
> drivers/scsi/qla2xxx/qla_init.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/qla2xxx/qla_init.c b/drivers/scsi/qla2xxx/qla_init.c
> index 4576d3ae9937..2436a17f5cd9 100644
> --- a/drivers/scsi/qla2xxx/qla_init.c
> +++ b/drivers/scsi/qla2xxx/qla_init.c
> @@ -5944,7 +5944,7 @@ qla2x00_find_all_fabric_devs(scsi_qla_host_t *vha)
> 			break;
> 		}
> 
> -		if (NVME_TARGET(vha->hw, fcport)) {
> +		if (found && NVME_TARGET(vha->hw, fcport)) {
> 			if (fcport->disc_state == DSC_DELETE_PEND) {
> 				qla2x00_set_fcport_disc_state(fcport, DSC_GNL);
> 				vha->fcport_count--;
> -- 
> 2.27.0
> 

Looks Good. 

Reviewed-by: Himanshu Madhani <himanshu.madhani@oracle.com>

--
Himanshu Madhani	Oracle Linux Engineering
