From: Leonardo Potenza <lpotenza@inwind.it>
Date: Thu, 03 Jan 2008 17:12:28 +0000
Subject: Re: [PATCH] drivers/video/aty/radeon_base.c: compilation warning fix
Message-Id: <200801031812.28943.lpotenza@inwind.it>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200801021901.44226.lpotenza@inwind.it>
In-Reply-To: <200801021901.44226.lpotenza@inwind.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thursday 03 January 2008 01:32:13 Benjamin Herrenschmidt wrote:
> > Do you think that a solution like:
> > 
> > [...]
> >       if (rinfo->mon1_EDID) {
> >               ret = sysfs_create_bin_file(&rinfo->pdev->dev.kobj, &edid1_attr);
> >               if (ret != 0)
> >                       printk( KERN_WARNING "radeonfb (%s): cannot create edid1 bin file\n",
> >                               pci_name(rinfo->pdev));
> >       }
> > [...]
> > 
> > would be acceptable in this case?
> > 
> > If you agree, I could re-submit the patch modified.
> 
> Bloat bloat bloat... 
> 
> Ben.
> 

I have to agree with you that my first proposal (avoid creating 
the framebuffer in case of a problem in the creation of a sysfs file) 
was a little bit "drastic" measure.

I thought that at least the user should be aware that something went
wrong in the driver initialization and that not all the features 
will be available at run-time. 
That's why I tried to add a specific warning message.

Anyway, I didn't intend to waste so much of your time with my patch
submission.

Sorry for that.

Leonardo
