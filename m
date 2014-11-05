From: Chad Dupuis <chad.dupuis@qlogic.com>
Date: Wed, 05 Nov 2014 20:48:09 +0000
Subject: Re: [patch 2/2] bnx2fc: fix an error code in _bnx2fc_create()
Message-Id: <alpine.OSX.2.00.1411051547550.2442@administrators-macbook-pro.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141104103759.GB19096@mwanda>
In-Reply-To: <20141104103759.GB19096@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: QLogic-Storage-Upstream@qlogic.com, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

Looks ok.
Acked-by: Chad Dupuis <chad.dupuis@qlogic.com>

On Tue, 4 Nov 2014, Dan Carpenter wrote:

> We should be returning an error code here instead of success.  Either
> -ENODEV or -ENOMEM would work.  There is also a failure message in
> printk().
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
> index dfed4be..251b114 100644
> --- a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
> +++ b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
> @@ -2195,6 +2195,7 @@ static int _bnx2fc_create(struct net_device *netdev,
> 	interface = bnx2fc_interface_create(hba, netdev, fip_mode);
> 	if (!interface) {
> 		printk(KERN_ERR PFX "bnx2fc_interface_create failed\n");
> +		rc = -ENOMEM;
> 		goto ifput_err;
> 	}
>
>
