From: Matthew Wilcox <willy@debian.org>
Date: Wed, 14 Jan 2004 22:48:09 +0000
Subject: Re: [Kernel-janitors] Kconfig cleanups
Message-Id: <20040114224809.GA9525@parcelfarce.linux.theplanet.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040114065742.GG10711@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20040114065742.GG10711@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jan 14, 2004 at 10:05:58PM +0100, Adrian Bunk wrote:
> On Wed, Jan 14, 2004 at 06:57:42AM +0000, Matthew Wilcox wrote:
> >...
> > --- drivers/char/drm/Kconfig	28 Sep 2003 04:05:17 -0000	1.3
> > +++ drivers/char/drm/Kconfig	14 Jan 2004 06:44:45 -0000
> > @@ -6,6 +6,7 @@
> >  #
> >  config DRM
> >  	bool "Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)"
> > +	depends on PCI
> >  	help
> >  	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
> >  	  introduced in XFree86 4.0. If you say Y here, you need to select
> > @@ -17,21 +18,21 @@ config DRM
> >  
> >  config DRM_TDFX
> >  	tristate "3dfx Banshee/Voodoo3+"
> > -	depends on DRM
> > +	depends on DRM && PCI
> >  	help
> >  	  Choose this option if you have a 3dfx Banshee or Voodoo3 (or later),
> >  	  graphics card.  If M is selected, the module will be called tdfx.
> >  
> >...
> 
> 
> If you let DRM depend on PCI, everything depending on DRM already has an 
> implicit dependency on PCI.


That's true.  However, there's nothing *intrinsic* about DRM that depends on
PCI.  There's no reason that someone shouldn't do a DRM module for an SBUS
or GSC card.  When one exists, the menu should depend on (PCI || SBUS).

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
