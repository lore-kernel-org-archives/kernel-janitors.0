From: Matthew Wilcox <willy@debian.org>
Date: Sat, 03 Jan 2004 22:35:09 +0000
Subject: Re: [Kernel-janitors] [PATCH] Check return value in
Message-Id: <20040103223509.GP6982@parcelfarce.linux.theplanet.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040103132946.GE21909@eugeneteo.net>
In-Reply-To: <20040103132946.GE21909@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jan 03, 2004 at 09:30:27PM +0800, Eugene Teo wrote:
> http://www.anomalistic.org/patches/mca-check-ret-mca_attach_bus-fix-2.6.1-rc1-mm1.patch
> 
> diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/arch/i386/kernel/mca.c 2.6.1-rc1-mm1-fix/arch/i386/kernel/mca.c
> --- 2.6.1-rc1-mm1/arch/i386/kernel/mca.c	2003-12-18 10:59:16.000000000 +0800
> +++ 2.6.1-rc1-mm1-fix/arch/i386/kernel/mca.c	2004-01-03 20:47:04.000000000 +0800
> @@ -35,6 +35,9 @@
>   *
>   *	Alfred Arnold & David Weinehall August 23rd, 2000
>   *	- Added support for Planar POS-registers
> + *
> + *	Eugene Teo January 3rd, 2004
> + *	- Check the return value of mca_attach_bus
>   */
>  
>  #include <linux/module.h>
> @@ -270,6 +273,8 @@
>  
>  	/* All MCA systems have at least a primary bus */
>  	bus = mca_attach_bus(MCA_PRIMARY_BUS);
> +	if (!bus)
> +		goto out_nomem;
>  	bus->default_dma_mask = 0xffffffffLL;
>  	bus->f.mca_write_pos = mca_pc_write_pos;
>  	bus->f.mca_read_pos = mca_pc_read_pos;

This one looks right, but I don't think you should add your name to
the file.  Two lines is not significant for copyright purposes.

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
