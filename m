From: Varun Prakash <varun@chelsio.com>
Date: Mon, 13 Jul 2020 16:25:37 +0000
Subject: Re: [PATCH] scsi: cxgb4i: clean up a debug printk
Message-Id: <20200713161336.GA1780@chelsio.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200713105100.GA251988@mwanda>
In-Reply-To: <20200713105100.GA251988@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, Austin Kim <austindh.kim@gmail.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, varun@chelsio.com

On Mon, Jul 13, 2020 at 10:51:00AM +0000, Dan Carpenter wrote:
> The pr_fmt() at the top of the file already includes the __func__ so we
> can remove the duplicative "cxgbi_conn_init_pdu:" from the string here.
> Now it all fits on one  line as well.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/scsi/cxgbi/libcxgbi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/cxgbi/libcxgbi.c b/drivers/scsi/cxgbi/libcxgbi.c
> index 1fb101c616b7..ba1593be626c 100644
> --- a/drivers/scsi/cxgbi/libcxgbi.c
> +++ b/drivers/scsi/cxgbi/libcxgbi.c
> @@ -2182,8 +2182,7 @@ int cxgbi_conn_init_pdu(struct iscsi_task *task, unsigned int offset,
>  	}
>  
>  	log_debug(1 << CXGBI_DBG_ISCSI | 1 << CXGBI_DBG_PDU_TX,
> -		  "cxgbi_conn_init_pdu: tdata->total_count %u, "
> -		  "tdata->total_offset %u\n",
> +		  "data->total_count %u, tdata->total_offset %u\n",
>  		  tdata->total_count, tdata->total_offset);
>  
>  	expected_count = tdata->total_count;

Acked-by: Varun Prakash <varun@chelsio.com>
