From: Adrian Bunk <bunk@fs.tum.de>
Date: Wed, 14 Jan 2004 21:05:58 +0000
Subject: Re: [Kernel-janitors] Kconfig cleanups
Message-Id: <20040114210558.GL23383@fs.tum.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040114065742.GG10711@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20040114065742.GG10711@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jan 14, 2004 at 06:57:42AM +0000, Matthew Wilcox wrote:
>...
> --- drivers/char/drm/Kconfig	28 Sep 2003 04:05:17 -0000	1.3
> +++ drivers/char/drm/Kconfig	14 Jan 2004 06:44:45 -0000
> @@ -6,6 +6,7 @@
>  #
>  config DRM
>  	bool "Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)"
> +	depends on PCI
>  	help
>  	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
>  	  introduced in XFree86 4.0. If you say Y here, you need to select
> @@ -17,21 +18,21 @@ config DRM
>  
>  config DRM_TDFX
>  	tristate "3dfx Banshee/Voodoo3+"
> -	depends on DRM
> +	depends on DRM && PCI
>  	help
>  	  Choose this option if you have a 3dfx Banshee or Voodoo3 (or later),
>  	  graphics card.  If M is selected, the module will be called tdfx.
>  
>  config DRM_GAMMA
>  	tristate "3dlabs GMX 2000"
> -	depends on DRM
> +	depends on DRM && PCI
>  	help
>  	  This is the old gamma driver, please tell me if it might actually
>  	  work.
>  
>  config DRM_R128
>  	tristate "ATI Rage 128"
> -	depends on DRM
> +	depends on DRM && PCI
>  	help
>  	  Choose this option if you have an ATI Rage 128 graphics card.  If M
>  	  is selected, the module will be called r128.  AGP support for
> @@ -39,7 +40,7 @@ config DRM_R128
>  
>  config DRM_RADEON
>  	tristate "ATI Radeon"
> -	depends on DRM
> +	depends on DRM && PCI
>  	help
>  	  Choose this option if you have an ATI Radeon graphics card.  There
>  	  are both PCI and AGP versions.  You don't need to choose this to
>...


If you let DRM depend on PCI, everything depending on DRM already has an 
implicit dependency on PCI.


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
