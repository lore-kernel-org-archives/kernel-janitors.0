From: Adrian Bunk <bunk@fs.tum.de>
Date: Sun, 16 May 2004 11:41:05 +0000
Subject: Re: [Kernel-janitors] [patch 2.6.6-rc3 7/16] ifdefs:
Message-Id: <20040516114105.GK22742@fs.tum.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43961867860671289=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040508233819.GA4118@masina>
In-Reply-To: <20040508233819.GA4118@masina>
To: kernel-janitors@vger.kernel.org

--===============43961867860671289==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 09, 2004 at 04:53:07PM +0200, Domen Puncer wrote:
> On Sun, May 09, 2004 at 03:25:40PM +0200, Adrian Bunk wrote:
> > On Sun, May 09, 2004 at 01:38:19AM +0200, Domen Puncer wrote:
> > >...
> > > --- c/drivers/scsi/aic7xxx/aic79xx_osm.h	2004-04-04 05:37:24.000000000 +0200
> > > +++ a/drivers/scsi/aic7xxx/aic79xx_osm.h	2004-05-08 23:55:34.000000000 +0200
> > >...
> > > -#if LINUX_VERSION_CODE > KERNEL_VERSION(2,2,17)
> > >  typedef dma_addr_t bus_addr_t;
> > > -#else
> > > -typedef uint32_t bus_addr_t;
> > > -#endif
> > >  typedef uint32_t bus_size_t;
> > >...
> > > -#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,3)
> > >  #define ahd_pci_set_dma_mask pci_set_dma_mask
> > > -#else
> > >...
> > 
> > In these cases, it's possible to replace it in the whole code and kill 
> > the typedef or #define, resp.
> 
> Ok, that typedef kill intruduced 5 new patches.
> Updated patches:
> http://coderock.org/kernel/janitor/old_ifdefs-take3/
> 
>  
> > The same is true for your patch #12 .
> 
> You mean some other patch?

Yes, sorry.

I meant #10 (which you've already changed).

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============43961867860671289==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43961867860671289==--
