From: Mike Christie <michaelc@cs.wisc.edu>
Date: Thu, 17 May 2012 15:55:41 +0000
Subject: Re: [patch] [SCSI] qla4xxx: don't free pool that wasn't allocated
Message-Id: <4FB51F7D.9070105@cs.wisc.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120517071120.GG14660@elgon.mountain>
In-Reply-To: <20120517071120.GG14660@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ravi Anand <ravi.anand@qlogic.com>, Vikas Chaudhary <vikas.chaudhary@qlogic.com>, iscsi-driver@qlogic.com, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 05/17/2012 02:11 AM, Dan Carpenter wrote:
> In the original code if dma_pool_alloc() fails then we call
> dma_pool_free().  The problem is that "chap_table" is NULL and
> "chap_dma" is uninitialized so it will cause an error.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/scsi/qla4xxx/ql4_mbx.c b/drivers/scsi/qla4xxx/ql4_mbx.c
> index 7ac21da..21dce92 100644
> --- a/drivers/scsi/qla4xxx/ql4_mbx.c
> +++ b/drivers/scsi/qla4xxx/ql4_mbx.c
> @@ -1329,10 +1329,8 @@ int qla4xxx_get_chap(struct scsi_qla_host *ha, char *username, char *password,
>  	dma_addr_t chap_dma;
>  
>  	chap_table = dma_pool_alloc(ha->chap_dma_pool, GFP_KERNEL, &chap_dma);
> -	if (chap_table = NULL) {
> -		ret = -ENOMEM;
> -		goto exit_get_chap;
> -	}
> +	if (chap_table = NULL)
> +		return -ENOMEM;
>  
>  	chap_size = sizeof(struct ql4_chap_table);
>  	memset(chap_table, 0, chap_size);

I thought dma_pool_free checked the vaddr/chap_table like how kfree
checks for nulls. You are right. Looks ok to me.

Reviewed-by: Mike Christie <michaelc@cs.wisc.edu>
