From: Bart Van Assche <bart.vanassche@sandisk.com>
Date: Tue, 31 May 2016 18:06:08 +0000
Subject: Re: [patch] IB/hfi1: fix some indenting
Message-Id: <ac61d4a9-fc38-9d33-a95b-6cb29b04866a@sandisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160528050120.GB4107@mwanda>
In-Reply-To: <20160528050120.GB4107@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>
Cc: Dennis Dalessandro <dennis.dalessandro@intel.com>, Doug Ledford <dledford@redhat.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 05/27/2016 10:01 PM, Dan Carpenter wrote:
> That extra tabs are misleading.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/infiniband/hw/hfi1/init.c b/drivers/infiniband/hw/hfi1/init.c
> index 5cc492e..0d28a5a 100644
> --- a/drivers/infiniband/hw/hfi1/init.c
> +++ b/drivers/infiniband/hw/hfi1/init.c
> @@ -1337,7 +1337,7 @@ static void cleanup_device_data(struct hfi1_devdata *dd)
>  		dma_free_coherent(&dd->pcidev->dev, sizeof(u64),
>  				  (void *)dd->rcvhdrtail_dummy_kvaddr,
>  				  dd->rcvhdrtail_dummy_physaddr);
> -				  dd->rcvhdrtail_dummy_kvaddr = NULL;
> +		dd->rcvhdrtail_dummy_kvaddr = NULL;
>  	}
>
>  	for (ctxt = 0; tmp && ctxt < dd->num_rcv_contexts; ctxt++) {

Reviewed-by: Bart Van Assche <bart.vanassche@sandisk.com>
