From: Jim Nelson <james4765@cwazy.co.uk>
Date: Wed, 09 Feb 2005 10:43:00 +0000
Subject: Re: [KJ] [PATCH] Reduction of compile warnings (Warning: long post
Message-Id: <4209E934.608@cwazy.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73785653710088406=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <420953CC.2707.A99E9B@localhost>
In-Reply-To: <420953CC.2707.A99E9B@localhost>
To: kernel-janitors@vger.kernel.org

--===============73785653710088406==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

>>Nope.  Got the swsusp-nocompile.txt, but everything else was munched by the 
>>mailing list.
> 
> 
> Jim,
> 
> Could you double-check, please?  I got a copy of my post back from the 
> mailing list and it is copacetic -- I can read and extract everything; 3 
> "Text/Plain" attachments with 3 "attachment information" parts put in by 
> Pegasus.
> 

My mistake.  I'm not used to seeing 6 attachments... </foot-in-mouth>

> 
>>You'll definitely want to split the patch up by driver, or directory at the very 
>>least.  You'll also want to send the patches as inlined text, with the 
>>Signed-off-by: line (see Documentation/SubmittingPatches and 
>>http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt for more pointers).
> 
> 
> Ok, I see that I missed a couple of things... the problem with my patch 
> is that it is very many one or two line changes in many files.  I count, 
> using:
> grep "^diff" linux-2.6.11-rc3-mm_compile-warnings.patch  | wc -l
> 49 different files... that is a bit much to break up, no?  What do I do 
> about this?
> 

If there's changes to a .c and .h, or changes to a set of files that relate to one 
driver (drivers/char/ip2, for example), they can come in one patch, but otherwise, 
one driver per patch - even if it is a lot of patches.
> 
>>There's a few good scripts out there for sending groups of patches to mailing 
>>lists.  I've also hacked up something to chop up a large diff by file, but I'm 
>>almost embarassed to show it in public :)
> 
> 
> Can you provide links to these scripts?
> 

http://www.speakeasy.net/~pj99/sgi/sendpatchset

> 
>>Jim
>>
> 

A few things I noticed about the patch you sent:

> diff -Nurdp linux-2.6.11-rc3-mm-original/.config linux-2.6.11-rc3-mm/.config
> --- linux-2.6.11-rc3-mm-original/.config	2005-02-07 16:34:23.000000000 +0200
> +++ linux-2.6.11-rc3-mm/.config	2005-02-08 18:47:46.954507280 +0200
> @@ -1,7 +1,7 @@
>  #
>  # Automatically generated make config: don't edit
>  # Linux kernel version: 2.6.11-rc3-mm1
> -# Mon Feb  7 16:34:23 2005
> +# Tue Feb  8 18:47:46 2005
>  #
>  CONFIG_X86=y
>  CONFIG_MMU=y
> 

> diff -Nurdp linux-2.6.11-rc3-mm-original/include/linux/autoconf.h linux-2.6.11-rc3-mm/include/linux/autoconf.h
> --- linux-2.6.11-rc3-mm-original/include/linux/autoconf.h	2005-02-07 16:34:23.000000000 +0200
> +++ linux-2.6.11-rc3-mm/include/linux/autoconf.h	2005-02-08 18:47:46.954507280 +0200
> @@ -1,7 +1,7 @@
>  /*
>   * Automatically generated C config: don't edit
>   * Linux kernel version: 2.6.11-rc3-mm1
> - * Mon Feb  7 16:34:23 2005
> + * Tue Feb  8 18:47:46 2005
>   */
>  #define AUTOCONF_INCLUDED
>  #define CONFIG_X86 1

Add to your diff command the '-X dontdiff-osdl', using the file 
http://developer.osdl.org/rddunlap/scripts/dontdiff-osdl


> diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/scsi/aha1740.c linux-2.6.11-rc3-mm/drivers/scsi/aha1740.c
> --- linux-2.6.11-rc3-mm-original/drivers/scsi/aha1740.c	2005-02-03 03:57:16.000000000 +0200
> +++ linux-2.6.11-rc3-mm/drivers/scsi/aha1740.c	2005-02-08 18:22:51.000000000 +0200
> @@ -588,6 +588,7 @@ static Scsi_Host_Template aha1740_templa
>  static int aha1740_probe (struct device *dev)
>  {
>  	int slotbase;
> +	int err_retval = -ENODEV;
>  	unsigned int irq_level, irq_type, translation;
>  	struct Scsi_Host *shpnt;
>  	struct aha1740_hostdata *host;
> @@ -642,7 +643,10 @@ static int aha1740_probe (struct device 
>  	}
>  
>  	eisa_set_drvdata (edev, shpnt);
> -	scsi_add_host (shpnt, dev); /* XXX handle failure */
> +	if (scsi_add_host (shpnt, dev)) {
> +		err_retval = -EIO;
> +		goto err_unmap; /* XXX handle failure */
> +	}
>  	scsi_scan_host (shpnt);
>  	return 0;
>  
> @@ -654,7 +658,7 @@ static int aha1740_probe (struct device 
>   err_release_region:
>  	release_region(slotbase, SLOTSIZE);
>  
> -	return -ENODEV;
> +	return err_retval;
>  }
>  

> diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/scsi/aic7xxx/aic79xx_osm.c linux-2.6.11-rc3-mm/drivers/scsi/aic7xxx/aic79xx_osm.c
> --- linux-2.6.11-rc3-mm-original/drivers/scsi/aic7xxx/aic79xx_osm.c	2005-02-03 03:55:53.000000000 +0200
> +++ linux-2.6.11-rc3-mm/drivers/scsi/aic7xxx/aic79xx_osm.c	2005-02-07 15:49:09.000000000 +0200
> @@ -2065,7 +2065,8 @@ ahd_linux_register_host(struct ahd_softc
>  	ahd_unlock(ahd, &s);
>  
>  #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
> -	scsi_add_host(host, &ahd->dev_softc->dev); /* XXX handle failure */
> +	if(scsi_add_host(host, &ahd->dev_softc->dev))
> +		return (EIO); /* XXX handle failure */
>  	scsi_scan_host(host);
>  #endif
>  	return (0);

> diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/scsi/aic7xxx/aic7xxx_osm.c linux-2.6.11-rc3-mm/drivers/scsi/aic7xxx/aic7xxx_osm.c
> --- linux-2.6.11-rc3-mm-original/drivers/scsi/aic7xxx/aic7xxx_osm.c	2005-02-03 03:55:07.000000000 +0200
> +++ linux-2.6.11-rc3-mm/drivers/scsi/aic7xxx/aic7xxx_osm.c	2005-02-07 15:54:42.000000000 +0200
> @@ -1729,7 +1729,8 @@ ahc_linux_register_host(struct ahc_softc
>  	ahc_unlock(ahc, &s);
>  
>  #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
> -	scsi_add_host(host, (ahc->dev_softc ? &ahc->dev_softc->dev : NULL)); /* XXX handle failure */
> +	if(scsi_add_host(host, (ahc->dev_softc ? &ahc->dev_softc->dev : NULL)))
> +		return (EIO); /* XXX handle failure */
>  	scsi_scan_host(host);
>  #endif
>  	return (0);

> diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/usb/image/microtek.c linux-2.6.11-rc3-mm/drivers/usb/image/microtek.c
> --- linux-2.6.11-rc3-mm-original/drivers/usb/image/microtek.c	2005-02-03 03:57:04.000000000 +0200
> +++ linux-2.6.11-rc3-mm/drivers/usb/image/microtek.c	2005-02-07 21:18:47.000000000 +0200
> @@ -809,7 +809,11 @@ static int mts_usb_probe(struct usb_inte
>  		goto out_free_urb;
>  
>  	new_desc->host->hostdata[0] = (unsigned long)new_desc;
> -	scsi_add_host(new_desc->host, NULL); /* XXX handle failure */
> +	if(scsi_add_host(new_desc->host, NULL)) { /* XXX handle failure */
> +		usb_free_urb(new_desc->urb);
> +		kfree(new_desc);
> +		return -EIO;
> +	}
>  	scsi_scan_host(new_desc->host);
>  
>  	usb_set_intfdata(intf, new_desc);

Since you're fixing the failure handling, you can also remove the XXX comments.

#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0) is not needed for drivers that are 
in the mainline kernel - only needed for drivers that are compiled against 
multiple versions of the kernel.

> diff -Nurdp linux-2.6.11-rc3-mm-original/sound/oss/emu10k1/cardwi.c linux-2.6.11-rc3-mm/sound/oss/emu10k1/cardwi.c
> --- linux-2.6.11-rc3-mm-original/sound/oss/emu10k1/cardwi.c	2005-02-03 03:56:11.000000000 +0200
> +++ linux-2.6.11-rc3-mm/sound/oss/emu10k1/cardwi.c	2005-02-08 16:21:22.000000000 +0200
> @@ -306,8 +306,10 @@ void emu10k1_wavein_getxfersize(struct w
>  
>  static void copy_block(u8 __user *dst, u8 * src, u32 str, u32 len, u8 cov)
>  {
> -	if (cov == 1)
> -		__copy_to_user(dst, src + str, len);
> +	if (cov == 1) {
> +		if(__copy_to_user(dst, src + str, len))
> +			BUG();
> +	}
>  	else {
>  		u8 byte;
>  		u32 i;
> @@ -316,7 +318,8 @@ static void copy_block(u8 __user *dst, u
>  
>  		for (i = 0; i < len; i++) {
>  			byte = src[2 * i] ^ 0x80;
> -			__copy_to_user(dst + i, &byte, 1);
> +			if(__copy_to_user(dst + i, &byte, 1))
> +				BUG();
>  		}
>  	}
>  }



A little dramatic, don't you think?

--===============73785653710088406==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73785653710088406==--
