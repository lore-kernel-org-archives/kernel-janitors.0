From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Sun, 06 Jan 2008 20:03:51 +0000
Subject: Re: [PATCH resubmit] drivers/video/aty/radeon_base.c: compilation
Message-Id: <1199649831.7291.77.camel@pasglop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200801061624.22567.lpotenza@inwind.it>
In-Reply-To: <200801061624.22567.lpotenza@inwind.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


On Sun, 2008-01-06 at 16:24 +0100, Leonardo Potenza wrote:
> From: Leonardo Potenza <lpotenza@inwind.it>
> 
> Added a check for the sysfs_create_bin_file() return value.
> In case of error the framebuffer creation is not aborted, but a warning message is generated instead.
> 
> Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>

Ack.

> 
> The aim of this patch is to remove the following warning messages:
> drivers/video/aty/radeon_base.c: In function 'radeonfb_pci_register':
> drivers/video/aty/radeon_base.c:2334: warning: ignoring return value of 'sysfs_create_bin_file', declared with attribute warn_unused_result
> drivers/video/aty/radeon_base.c:2336: warning: ignoring return value of 'sysfs_create_bin_file', declared with attribute warn_unused_result
> 
> --- linux-2.6.orig/drivers/video/aty/radeon_base.c
> +++ linux-2.6/drivers/video/aty/radeon_base.c
> @@ -2331,9 +2331,9 @@ static int __devinit radeonfb_pci_regist
>  
>  	/* Register some sysfs stuff (should be done better) */
>  	if (rinfo->mon1_EDID)
> -		sysfs_create_bin_file(&rinfo->pdev->dev.kobj, &edid1_attr);
> +		WARN_ON(sysfs_create_bin_file(&rinfo->pdev->dev.kobj, &edid1_attr));
>  	if (rinfo->mon2_EDID)
> -		sysfs_create_bin_file(&rinfo->pdev->dev.kobj, &edid2_attr);
> +		WARN_ON(sysfs_create_bin_file(&rinfo->pdev->dev.kobj, &edid2_attr));
>  
>  	/* save current mode regs before we switch into the new one
>  	 * so we can restore this upon __exit

