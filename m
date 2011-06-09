From: "Winkler, Tomas" <tomas.winkler@intel.com>
Date: Thu, 09 Jun 2011 08:37:44 +0000
Subject: RE: [patch] Staging: mei: fix debug code
Message-Id: <6F5C1D715B2DA5498A628E6B9C124F0401AD270E32@hasmsx504.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110609071240.GF4069@shale.localdomain>
In-Reply-To: <20110609071240.GF4069@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



> -----Original Message-----
> From: Dan Carpenter [mailto:error27@gmail.com]
> Sent: Thursday, June 09, 2011 10:18 AM
> To: Greg Kroah-Hartman
> Cc: Winkler, Tomas; Weil, Oren jer; Tzeel-Krupp, Itzhak; open list:STAGING
> SUBSYSTEM; kernel-janitors@vger.kernel.org
> Subject: [patch] Staging: mei: fix debug code
> 
> 
> ! has higher precedence than !=.  H_RDY is 8 and since neither 0 nor
> 1 are equal to 8 the original condition was always true.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Tomas Winkler <tomas.winkler@intel.com>

> 
> diff --git a/drivers/staging/mei/init.c b/drivers/staging/mei/init.c index
> 2818851..d1ffa32 100644
> --- a/drivers/staging/mei/init.c
> +++ b/drivers/staging/mei/init.c
> @@ -205,10 +205,10 @@ int mei_hw_init(struct mei_device *dev)
>  			"host_hw_state = 0x%08x, me_hw_state > 0x%08x.\n",
>  			dev->host_hw_state, dev->me_hw_state);
> 
> -		if (!(dev->host_hw_state & H_RDY) != H_RDY)
> +		if (!(dev->host_hw_state & H_RDY))
>  			dev_dbg(&dev->pdev->dev, "host turn off
> H_RDY.\n");
> 
> -		if (!(dev->me_hw_state & ME_RDY_HRA) != ME_RDY_HRA)
> +		if (!(dev->me_hw_state & ME_RDY_HRA))
>  			dev_dbg(&dev->pdev->dev, "ME turn off
> ME_RDY.\n");
> 
>  		printk(KERN_ERR "mei: link layer initialization failed.\n");
---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

