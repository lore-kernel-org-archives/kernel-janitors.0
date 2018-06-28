From: "Rangankar, Manish" <Manish.Rangankar@cavium.com>
Date: Thu, 28 Jun 2018 15:15:31 +0000
Subject: RE: [PATCH] scsi: qedi: tidy up a size caculation
Message-Id: <MW2PR07MB4042CDE766653A294B38EB69E34F0@MW2PR07MB4042.namprd07.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180628092310.ta2qzatghjtgnzx7@kili.mountain>
In-Reply-To: <20180628092310.ta2qzatghjtgnzx7@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Thursday, June 28, 2018 2:53 PM
> To: Dept-Eng QLogic Storage Upstream <QLogic-Storage-
> Upstream@cavium.com>; Rangankar, Manish
> <Manish.Rangankar@cavium.com>
> Cc: James E.J. Bottomley <jejb@linux.vnet.ibm.com>; Martin K. Petersen
> <martin.petersen@oracle.com>; linux-scsi@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [PATCH] scsi: qedi: tidy up a size caculation
> 
> External Email
> 
> The id_tbl->table pointer points to unsigned long so static checkers complain
> that instead of 4 we should be allocating sizeof(long) bytes.
> 
> We're trying to allocate enough bits for the bitmap.  The size variable is always
> 1024.  (1024 / 32 * 4) is the same as (1024 / 64 * 8) so this doesn't change
> runtime, but this is the more idiomatic way to do it and makes the static checker
> happy.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/scsi/qedi/qedi_main.c b/drivers/scsi/qedi/qedi_main.c index
> cf274a79e77a..682f3ce31014 100644
> --- a/drivers/scsi/qedi/qedi_main.c
> +++ b/drivers/scsi/qedi/qedi_main.c
> @@ -524,7 +524,7 @@ static int qedi_init_id_tbl(struct qedi_portid_tbl *id_tbl,
> u16 size,
>         id_tbl->max = size;
>         id_tbl->next = next;
>         spin_lock_init(&id_tbl->lock);
> -       id_tbl->table = kcalloc(DIV_ROUND_UP(size, 32), 4, GFP_KERNEL);
> +       id_tbl->table = kcalloc(BITS_TO_LONGS(size), sizeof(long),
> + GFP_KERNEL);
>         if (!id_tbl->table)
>                 return -ENOMEM;

Thanks,

Acked-by: Manish Rangankar <Manish.Rangankar@cavium.com>
