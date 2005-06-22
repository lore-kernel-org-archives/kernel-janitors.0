From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 22 Jun 2005 07:07:58 +0000
Subject: Re: [KJ] [PATCH] Audit return code :
Message-Id: <20050622070758.GB5054@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============059294448921371146=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050621101842.GI4880@rhum.iomeda.fr>
In-Reply-To: <20050621101842.GI4880@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============059294448921371146==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

Alexey Dobriyan (adobriyan@gmail.com) wrote:
> On Tuesday 21 June 2005 14:18, Christophe Lucas wrote:
> > Audit return codes (and handle failure correctly) for misc_register.
> 
> > --- 2.6.12-orig/drivers/misc/hdpuftrs/hdpu_cpustate.c
> > +++ 2.6.12/drivers/misc/hdpuftrs/hdpu_cpustate.c
> > @@ -192,12 +192,19 @@ static int hdpu_cpustate_probe(struct de
> >  {
> >  	struct platform_device *pdev = to_platform_device(ddev);
> >  	struct resource *res;
> > +	int ret;
> >  
> >  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >  	cpustate.set_addr = (unsigned long *)res->start;
> >  	cpustate.clr_addr = (unsigned long *)res->end - 1;
> >  
> > -	misc_register(&cpustate_dev);
> > +	if (ret = misc_register(&cpustate_dev)) {
> > +		printk(KERN_WARNING "Unable to register misc device.\n");
> > +		cpustate.set_addr = 0;
> > +		cpustate.clr_addr = 0;
> 
> Why clear them? Anyway, both are pointers, so use NULL.

I have cleared it as it is done in original file (line 209, 210).
But I will correct it in NULL form. Thanks,

> > +		return ret ;
> > +	}
> > +
> >  	create_proc_read_entry("sky_cpustate", 0, 0, cpustate_read_proc, NULL);
> 
> Also unchecked.
> 
> Please, post patches inline.

Ok, I will correct my configuration of mutt.

Thanks and have a nice day,

						- Christophe

--===============059294448921371146==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============059294448921371146==--
