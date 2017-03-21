From: "Mody, Rasesh" <Rasesh.Mody@cavium.com>
Date: Tue, 21 Mar 2017 01:14:05 +0000
Subject: RE: [PATCH] bna: integer overflow bug in debugfs
Message-Id: <BLUPR0701MB15723BB97F9129EC1020326E9F3D0@BLUPR0701MB1572.namprd07.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170317205234.GA2888@mwanda>
In-Reply-To: <20170317205234.GA2888@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Krishna Gudipati <kgudipat@brocade.com>
Cc: "Kalluru, Sudarsana" <Sudarsana.Kalluru@cavium.com>, Dept-GE Linux NIC Dev <Dept-GELinuxNICDev@cavium.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Friday, March 17, 2017 1:53 PM
> 
> We could allocate less memory than intended because we do:
> 
> 	bnad->regdata = kzalloc(len << 2, GFP_KERNEL);
> 
> The shift can overflow leading to a crash.  This is debugfs code so the impact
> is very small.
> 
> Fixes: 7afc5dbde091 ("bna: Add debugfs interface.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/net/ethernet/brocade/bna/bnad_debugfs.c
> b/drivers/net/ethernet/brocade/bna/bnad_debugfs.c
> index 05c1c1dd7751..cebfe3bd086e 100644
> --- a/drivers/net/ethernet/brocade/bna/bnad_debugfs.c
> +++ b/drivers/net/ethernet/brocade/bna/bnad_debugfs.c
> @@ -325,7 +325,7 @@ bnad_debugfs_write_regrd(struct file *file, const
> char __user *buf,
>  		return PTR_ERR(kern_buf);
> 
>  	rc = sscanf(kern_buf, "%x:%x", &addr, &len);
> -	if (rc < 2) {
> +	if (rc < 2 || len > UINT_MAX >> 2) {
>  		netdev_warn(bnad->netdev, "failed to read user buffer\n");
>  		kfree(kern_buf);
>  		return -EINVAL;

You are correct, thanks Dan for adding the check.

Acked-by: Rasesh Mody <rasesh.mody@cavium.com>
