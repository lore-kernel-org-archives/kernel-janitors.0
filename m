From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Thu, 08 Jan 2004 00:45:41 +0000
Subject: Re: [Kernel-janitors] [PATCH] Check return value in
Message-Id: <20040107164541.2d7360b1.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040103132946.GE21909@eugeneteo.net>
In-Reply-To: <20040103132946.GE21909@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 3 Jan 2004 22:35:09 +0000 Matthew Wilcox <willy@debian.org> wrote:

| On Sat, Jan 03, 2004 at 09:30:27PM +0800, Eugene Teo wrote:
| > http://www.anomalistic.org/patches/mca-check-ret-mca_attach_bus-fix-2.6.1-rc1-mm1.patch
| > 
| > diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/arch/i386/kernel/mca.c 2.6.1-rc1-mm1-fix/arch/i386/kernel/mca.c
| > --- 2.6.1-rc1-mm1/arch/i386/kernel/mca.c	2003-12-18 10:59:16.000000000 +0800
| > +++ 2.6.1-rc1-mm1-fix/arch/i386/kernel/mca.c	2004-01-03 20:47:04.000000000 +0800
| > @@ -35,6 +35,9 @@
| >   *
| >   *	Alfred Arnold & David Weinehall August 23rd, 2000
| >   *	- Added support for Planar POS-registers
| > + *
| > + *	Eugene Teo January 3rd, 2004
| > + *	- Check the return value of mca_attach_bus
| >   */
| >  
| >  #include <linux/module.h>
| > @@ -270,6 +273,8 @@
| >  
| >  	/* All MCA systems have at least a primary bus */
| >  	bus = mca_attach_bus(MCA_PRIMARY_BUS);
| > +	if (!bus)
| > +		goto out_nomem;
| >  	bus->default_dma_mask = 0xffffffffLL;
| >  	bus->f.mca_write_pos = mca_pc_write_pos;
| >  	bus->f.mca_read_pos = mca_pc_read_pos;
| 
| This one looks right, but I don't think you should add your name to
| the file.  Two lines is not significant for copyright purposes.

The source file changelog also isn't needed since we haven't a
decent (better) version control system now.

--
~Randy
MOTD:  Always include version info.


--
~Randy
MOTD:  Always include version info.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
