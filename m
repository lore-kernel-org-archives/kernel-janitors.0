From: Brian King <brking@linux.vnet.ibm.com>
Date: Fri, 01 Dec 2017 16:30:46 +0000
Subject: Re: [PATCH] scsi: ipr: fix incorrect indentation of assignment statement
Message-Id: <fd65226e-5c5f-365a-b425-3eb4975dc9b8@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171201133327.15515-1-colin.king@canonical.com>
In-Reply-To: <20171201133327.15515-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Brian King <brking@us.ibm.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/01/2017 07:33 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Remove one extraneous level of indentation on an assignment statement.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/scsi/ipr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/ipr.c b/drivers/scsi/ipr.c
> index cc0187965eee..e07dd990e585 100644
> --- a/drivers/scsi/ipr.c
> +++ b/drivers/scsi/ipr.c
> @@ -9653,8 +9653,8 @@ static int ipr_alloc_cmd_blks(struct ipr_ioa_cfg *ioa_cfg)
>  			if (i = 0) {
>  				entries_each_hrrq = IPR_NUM_INTERNAL_CMD_BLKS;
>  				ioa_cfg->hrrq[i].min_cmd_id = 0;
> -					ioa_cfg->hrrq[i].max_cmd_id > -						(entries_each_hrrq - 1);
> +				ioa_cfg->hrrq[i].max_cmd_id > +					(entries_each_hrrq - 1);
>  			} else {
>  				entries_each_hrrq >  					IPR_NUM_BASE_CMD_BLKS/
> 

Acked-by: Brian King <brking@linux.vnet.ibm.com>

-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

