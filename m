From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Sun, 04 Jan 2004 02:39:50 +0000
Subject: Re: [Kernel-janitors] [PATCH] Check return value in
Message-Id: <20040104023950.GA20458@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040103132946.GE21909@eugeneteo.net>
In-Reply-To: <20040103132946.GE21909@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Yes, correct. Insignificant. New patch compiles, and tested.

http://www.anomalistic.org/patches/mca-check-ret-mca_attach_bus-fix-2.6.1-rc1-mm1.patch

diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/arch/i386/kernel/mca.c 2.6.1-rc1-mm1-fix/arch/i386/kernel/mca.c
--- 2.6.1-rc1-mm1/arch/i386/kernel/mca.c	2003-12-18 10:59:16.000000000 +0800
+++ 2.6.1-rc1-mm1-fix/arch/i386/kernel/mca.c	2004-01-04 10:34:37.000000000 +0800
@@ -270,6 +270,8 @@
 
 	/* All MCA systems have at least a primary bus */
 	bus = mca_attach_bus(MCA_PRIMARY_BUS);
+	if (!bus)
+		goto out_nomem;
 	bus->default_dma_mask = 0xffffffffLL;
 	bus->f.mca_write_pos = mca_pc_write_pos;
 	bus->f.mca_read_pos = mca_pc_read_pos;

<quote sender="Matthew Wilcox">
> On Sat, Jan 03, 2004 at 09:30:27PM +0800, Eugene Teo wrote:
> > http://www.anomalistic.org/patches/mca-check-ret-mca_attach_bus-fix-2.6.1-rc1-mm1.patch
> > 
> > diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/arch/i386/kernel/mca.c 2.6.1-rc1-mm1-fix/arch/i386/kernel/mca.c
> > --- 2.6.1-rc1-mm1/arch/i386/kernel/mca.c	2003-12-18 10:59:16.000000000 +0800
> > +++ 2.6.1-rc1-mm1-fix/arch/i386/kernel/mca.c	2004-01-03 20:47:04.000000000 +0800
> > @@ -35,6 +35,9 @@

[snip]

> This one looks right, but I don't think you should add your name to
> the file.  Two lines is not significant for copyright purposes.

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
