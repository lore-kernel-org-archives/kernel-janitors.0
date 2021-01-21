From: Saurav Kashyap <skashyap@marvell.com>
Date: Thu, 21 Jan 2021 06:20:12 +0000
Subject: RE: [PATCH] scsi: qla2xxx: remove unnecessary NULL check
Message-Id: <BN8PR18MB30253D9117CECA0D933FC772D2A11@BN8PR18MB3025.namprd18.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YAkaaSrhn1mFqyHy@mwanda>
In-Reply-To: <YAkaaSrhn1mFqyHy@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Nilesh Javali <njavali@marvell.com>
Cc: GR-QLogic-Storage-Upstream <GR-QLogic-Storage-Upstream@marvell.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan,
Thanks for a patch.

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Thursday, January 21, 2021 11:39 AM
> To: Nilesh Javali <njavali@marvell.com>
> Cc: GR-QLogic-Storage-Upstream <GR-QLogic-Storage-
> Upstream@marvell.com>; James E.J. Bottomley <jejb@linux.ibm.com>; Martin
> K. Petersen <martin.petersen@oracle.com>; linux-scsi@vger.kernel.org;
> kernel-janitors@vger.kernel.org
> Subject: [PATCH] scsi: qla2xxx: remove unnecessary NULL check
> 
> The list iterator can't be NULL so this check is not required.  Removing
> the check silences a Smatch warning about inconsistent NULL checking.
> 
>     drivers/scsi/qla2xxx/qla_dfs.c:371 qla_dfs_tgt_counters_show()
>     error: we previously assumed 'fcport' could be null (see line 372)
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/scsi/qla2xxx/qla_dfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/qla2xxx/qla_dfs.c b/drivers/scsi/qla2xxx/qla_dfs.c
> index ccce0eab844e..85bd0e468d43 100644
> --- a/drivers/scsi/qla2xxx/qla_dfs.c
> +++ b/drivers/scsi/qla2xxx/qla_dfs.c
> @@ -369,7 +369,7 @@ qla_dfs_tgt_counters_show(struct seq_file *s, void
> *unused)
>  	seq_puts(s, "\n");
> 
>  	list_for_each_entry(fcport, &vha->vp_fcports, list) {
> -		if (!fcport || !fcport->rport)
> +		if (!fcport->rport)
>  			continue;
> 
>  		seq_printf(s, "Target Num = %7d Link Down Count = %14lld\n",

Acked-by: Saurav Kashyap <skashyap@marvell.com"

Thanks,
~Saurav
> --
> 2.29.2
