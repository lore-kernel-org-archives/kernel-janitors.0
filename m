From: "Marciniszyn, Mike" <mike.marciniszyn@intel.com>
Date: Fri, 29 May 2020 13:34:06 +0000
Subject: RE: [PATCH] IB/hfi1: Fix an error code in hfi1_vnic_init()
Message-Id: <BY5PR11MB3958CF61BB1F59A6F6B5234D868F0@BY5PR11MB3958.namprd11.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200529100302.GC1304852@mwanda>
In-Reply-To: <20200529100302.GC1304852@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "Andrejczuk, Grzegorz" <grzegorz.andrejczuk@intel.com>
Cc: "Dalessandro, Dennis" <dennis.dalessandro@intel.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, "Weiny, Ira" <ira.weiny@intel.com>, "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>, "Kacprowski, Andrzej" <Andrzej.Kacprowski@intel.com>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> From: Dan Carpenter <dan.carpenter@oracle.com>
> diff --git a/drivers/infiniband/hw/hfi1/vnic_main.c
> b/drivers/infiniband/hw/hfi1/vnic_main.c
> index b183c56b7b6a4..f89d0cb1c7204 100644
> --- a/drivers/infiniband/hw/hfi1/vnic_main.c
> +++ b/drivers/infiniband/hw/hfi1/vnic_main.c
> @@ -512,7 +512,8 @@ static int hfi1_vnic_init(struct hfi1_vnic_vport_info
> *vinfo)
>  			goto txreq_fail;
>  	}
> 
> -	if (hfi1_netdev_rx_init(dd)) {
> +	rc = hfi1_netdev_rx_init(dd);
> +	if (rc) {
>  		dd_dev_err(dd, "Unable to initialize netdev contexts\n");
>  		goto alloc_fail;
>  	}

Dan,

This is definitely wrong, but another call to  hfi1_netdev_rx_init() exists in hfi1_vnic_up()  that needs to be fixed.

Can you address that too?

Mike
