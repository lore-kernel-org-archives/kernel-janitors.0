From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Wed, 02 Jan 2008 20:19:33 +0000
Subject: Re: [PATCH] drivers/video/aty/radeon_base.c: compilation warning
Message-Id: <1199305173.6751.26.camel@pasglop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200801021901.44226.lpotenza@inwind.it>
In-Reply-To: <200801021901.44226.lpotenza@inwind.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


On Wed, 2008-01-02 at 19:01 +0100, Leonardo Potenza wrote:
> From: Leonardo Potenza <lpotenza@inwind.it>
> 
> Added a check for the sysfs_create_bin_file() return value
> 
> Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>

NACK.

The warnings are stupid, this is a long argument we had with akpm among
others, I totally refuse to fail creating the framebuffer because
something went bonkers creating some sysfs file that are in no way
mandatory for the good operations of the fb.

There is a _shitload_ of cases where testing the result of those sysfs
calls is pure bloat.

Ben.

> 
> The aim of this patch is to remove the following warning messages:
> drivers/video/aty/radeon_base.c: In function 'radeonfb_pci_register':
> drivers/video/aty/radeon_base.c:2334: warning: ignoring return value of 'sysfs_create_bin_file', declared with attribute warn_unused_result
> drivers/video/aty/radeon_base.c:2336: warning: ignoring return value of 'sysfs_create_bin_file', declared with attribute warn_unused_result
> 
> --- linux-2.6.orig/drivers/video/aty/radeon_base.c
> +++ linux-2.6/drivers/video/aty/radeon_base.c
> @@ -2329,11 +2329,23 @@ static int __devinit radeonfb_pci_regist
>  	/* Build mode list, check out panel native model */
>  	radeon_check_modes(rinfo, mode_option);
>  
> -	/* Register some sysfs stuff (should be done better) */
> -	if (rinfo->mon1_EDID)
> -		sysfs_create_bin_file(&rinfo->pdev->dev.kobj, &edid1_attr);
> -	if (rinfo->mon2_EDID)
> -		sysfs_create_bin_file(&rinfo->pdev->dev.kobj, &edid2_attr);
> +	/* Register some sysfs stuff */
> +	if (rinfo->mon1_EDID) {
> +		ret = sysfs_create_bin_file(&rinfo->pdev->dev.kobj, &edid1_attr);
> +		if (ret != 0) {
> +			printk( KERN_ERR "radeonfb (%s): cannot create edid1 bin file\n",
> +				pci_name(rinfo->pdev));
> +			goto err_unmap_fb;
> +		}
> +	}
> +	if (rinfo->mon2_EDID) {
> +		ret = sysfs_create_bin_file(&rinfo->pdev->dev.kobj, &edid2_attr);
> +		if (ret != 0) {
> +			printk( KERN_ERR "radeonfb (%s): cannot create edid2 bin file\n",
> +				pci_name(rinfo->pdev));
> +			goto err_remove_edid1_file;
> +		}
> +	}
>  
>  	/* save current mode regs before we switch into the new one
>  	 * so we can restore this upon __exit
> @@ -2357,7 +2369,7 @@ static int __devinit radeonfb_pci_regist
>  	if (ret < 0) {
>  		printk (KERN_ERR "radeonfb (%s): could not register framebuffer\n",
>  			pci_name(rinfo->pdev));
> -		goto err_unmap_fb;
> +		goto err_remove_edid2_file;
>  	}
>  
>  #ifdef CONFIG_MTRR
> @@ -2376,6 +2388,12 @@ static int __devinit radeonfb_pci_regist
>  	RTRACE("radeonfb_pci_register END\n");
>  
>  	return 0;
> +err_remove_edid2_file:
> +	if (rinfo->mon2_EDID)
> +		sysfs_remove_bin_file(&rinfo->pdev->dev.kobj, &edid2_attr);
> +err_remove_edid1_file:
> +	if (rinfo->mon1_EDID)
> +		sysfs_remove_bin_file(&rinfo->pdev->dev.kobj, &edid1_attr);
>  err_unmap_fb:
>  	iounmap(rinfo->fb_base);
>  err_unmap_rom:

