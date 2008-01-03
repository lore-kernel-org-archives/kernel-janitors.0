From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Thu, 03 Jan 2008 00:32:13 +0000
Subject: Re: [PATCH] drivers/video/aty/radeon_base.c: compilation warning
Message-Id: <1199320333.6751.32.camel@pasglop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200801021901.44226.lpotenza@inwind.it>
In-Reply-To: <200801021901.44226.lpotenza@inwind.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> Do you think that a solution like:
> 
> [...]
> 	if (rinfo->mon1_EDID) {
> 		ret = sysfs_create_bin_file(&rinfo->pdev->dev.kobj, &edid1_attr);
> 		if (ret != 0)
> 			printk( KERN_WARNING "radeonfb (%s): cannot create edid1 bin file\n",
> 				pci_name(rinfo->pdev));
> 	}
> [...]
> 
> would be acceptable in this case?
> 
> If you agree, I could re-submit the patch modified.

Bloat bloat bloat... 

Ben.


