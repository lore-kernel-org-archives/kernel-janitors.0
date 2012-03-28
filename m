From: KY Srinivasan <kys@microsoft.com>
Date: Wed, 28 Mar 2012 18:48:28 +0000
Subject: RE: [patch] hv: fix return type of hv_post_message()
Message-Id: <6E21E5352C11B742B20C142EB499E0481B777024@TK5EX14MBXC124.redmond.corp.microsoft.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120328065807.GB9113@elgon.mountain>
In-Reply-To: <20120328065807.GB9113@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Wednesday, March 28, 2012 2:58 AM
> To: KY Srinivasan
> Cc: Haiyang Zhang; devel@linuxdriverproject.org; kernel-
> janitors@vger.kernel.org
> Subject: [patch] hv: fix return type of hv_post_message()
> 
> This function returns negative error codes, but because the type is u16
> they get truncated into positive numbers.  It doesn't look like the
> callers care, but we should fix it anyway as a cleanup.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan.

Signed-off-by: K. Y. Srinivasan <kys@microsoft.com>
> 
> diff --git a/drivers/hv/hyperv_vmbus.h b/drivers/hv/hyperv_vmbus.h
> index 699f0d8..b9426a6 100644
> --- a/drivers/hv/hyperv_vmbus.h
> +++ b/drivers/hv/hyperv_vmbus.h
> @@ -495,7 +495,7 @@ extern int hv_init(void);
> 
>  extern void hv_cleanup(void);
> 
> -extern u16 hv_post_message(union hv_connection_id connection_id,
> +extern int hv_post_message(union hv_connection_id connection_id,
>  			 enum hv_message_type message_type,
>  			 void *payload, size_t payload_size);
> 
> diff --git a/drivers/hv/hv.c b/drivers/hv/hv.c
> index 15956bd..86f8885 100644
> --- a/drivers/hv/hv.c
> +++ b/drivers/hv/hv.c
> @@ -252,7 +252,7 @@ void hv_cleanup(void)
>   *
>   * This involves a hypercall.
>   */
> -u16 hv_post_message(union hv_connection_id connection_id,
> +int hv_post_message(union hv_connection_id connection_id,
>  		  enum hv_message_type message_type,
>  		  void *payload, size_t payload_size)
>  {


