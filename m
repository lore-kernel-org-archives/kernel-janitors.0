From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Sat, 03 Jan 2004 13:30:27 +0000
Subject: [Kernel-janitors] [PATCH] Check return value in
Message-Id: <20040103133027.GF21909@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040103132946.GE21909@eugeneteo.net>
In-Reply-To: <20040103132946.GE21909@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

http://www.anomalistic.org/patches/mca-check-ret-mca_attach_bus-fix-2.6.1-rc1-mm1.patch

diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/arch/i386/kernel/mca.c 2.6.1-rc1-mm1-fix/arch/i386/kernel/mca.c
--- 2.6.1-rc1-mm1/arch/i386/kernel/mca.c	2003-12-18 10:59:16.000000000 +0800
+++ 2.6.1-rc1-mm1-fix/arch/i386/kernel/mca.c	2004-01-03 20:47:04.000000000 +0800
@@ -35,6 +35,9 @@
  *
  *	Alfred Arnold & David Weinehall August 23rd, 2000
  *	- Added support for Planar POS-registers
+ *
+ *	Eugene Teo January 3rd, 2004
+ *	- Check the return value of mca_attach_bus
  */
 
 #include <linux/module.h>
@@ -270,6 +273,8 @@
 
 	/* All MCA systems have at least a primary bus */
 	bus = mca_attach_bus(MCA_PRIMARY_BUS);
+	if (!bus)
+		goto out_nomem;
 	bus->default_dma_mask = 0xffffffffLL;
 	bus->f.mca_write_pos = mca_pc_write_pos;
 	bus->f.mca_read_pos = mca_pc_read_pos;

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
