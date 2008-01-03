From: Leonardo Potenza <lpotenza@inwind.it>
Date: Thu, 03 Jan 2008 00:20:41 +0000
Subject: Re: [PATCH] drivers/video/aty/radeon_base.c: compilation warning fix
Message-Id: <200801030120.41931.lpotenza@inwind.it>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200801021901.44226.lpotenza@inwind.it>
In-Reply-To: <200801021901.44226.lpotenza@inwind.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wednesday 02 January 2008 21:19:33 Benjamin Herrenschmidt wrote:
> 
> On Wed, 2008-01-02 at 19:01 +0100, Leonardo Potenza wrote:
> > From: Leonardo Potenza <lpotenza@inwind.it>
> > 
> > Added a check for the sysfs_create_bin_file() return value
> > 
> > Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>
> 
> NACK.
> 
> The warnings are stupid, this is a long argument we had with akpm among
> others, I totally refuse to fail creating the framebuffer because
> something went bonkers creating some sysfs file that are in no way
> mandatory for the good operations of the fb.
> 
> There is a _shitload_ of cases where testing the result of those sysfs
> calls is pure bloat.
> 
> Ben.

Sorry, I missed the former discussion.

Do you think that a solution like:

[...]
	if (rinfo->mon1_EDID) {
		ret = sysfs_create_bin_file(&rinfo->pdev->dev.kobj, &edid1_attr);
		if (ret != 0)
			printk( KERN_WARNING "radeonfb (%s): cannot create edid1 bin file\n",
				pci_name(rinfo->pdev));
	}
[...]

would be acceptable in this case?

If you agree, I could re-submit the patch modified.

Thanks.

Leonardo
