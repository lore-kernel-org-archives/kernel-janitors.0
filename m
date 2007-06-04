From: Yoann Padioleau <padator@wanadoo.fr>
Date: Mon, 04 Jun 2007 18:29:22 +0000
Subject: [KJ] [PATCH] potential parse error in ifdef part 3
Message-Id: <87bqfvr2t9.fsf@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87fy5q5dxr.fsf@wanadoo.fr>
In-Reply-To: <87fy5q5dxr.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org


parse errors in ifdefs

Fix various bits of obviously-busted code which we're not happening to
compile, due to ifdefs.


Signed-off-by: Yoann Padioleau <padator@wanadoo.fr> 

 arch/i386/math-emu/fpu_entry.c |    2 +-
 arch/m68k/mac/debug.c          |    2 +-
 arch/ppc/syslib/qspan_pci.c    |    4 ++--
 arch/sh64/kernel/pci_sh5.c     |    8 ++++----
 drivers/cdrom/mcdx.c           |    2 +-
 drivers/tc/zs.c                |    2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)



diff --git a/arch/m68k/mac/debug.c b/arch/m68k/mac/debug.c
index 7a5bed5..e8a5713 100644
--- a/arch/m68k/mac/debug.c
+++ b/arch/m68k/mac/debug.c
@@ -71,7 +71,7 @@ #ifdef DEBUG_SCREEN
 
 	/* calculate current offset */
 	pengoffset = (unsigned char *)mac_videobase +
-		(150+line*2) * mac_rowbytes) + 80 * peng;
+		(150+line*2) * mac_rowbytes + 80 * peng;
 
 	pptr = pengoffset;
 
diff --git a/arch/ppc/syslib/qspan_pci.c b/arch/ppc/syslib/qspan_pci.c
index 85053b2..7a97c74 100644
--- a/arch/ppc/syslib/qspan_pci.c
+++ b/arch/ppc/syslib/qspan_pci.c
@@ -365,13 +365,13 @@ int qspan_pcibios_find_class(unsigned in
 }
 
 void __init
-m8xx_pcibios_fixup(void))
+m8xx_pcibios_fixup(void)
 {
    /* Lots to do here, all board and configuration specific. */
 }
 
 void __init
-m8xx_setup_pci_ptrs(void))
+m8xx_setup_pci_ptrs(void)
 {
 	set_config_access_method(qspan);
 
diff --git a/arch/sh64/kernel/pci_sh5.c b/arch/sh64/kernel/pci_sh5.c
index fb51660..3334f99 100644
--- a/arch/sh64/kernel/pci_sh5.c
+++ b/arch/sh64/kernel/pci_sh5.c
@@ -521,10 +521,10 @@ #if 1
 		bus->resource[0]->start = PCIBIOS_MIN_IO;
 		bus->resource[1]->start = PCIBIOS_MIN_MEM;
 #else
-		bus->resource[0]->end = 0
-		bus->resource[1]->end = 0
-		bus->resource[0]->start =0
-		  bus->resource[1]->start = 0;
+		bus->resource[0]->end = 0;
+		bus->resource[1]->end = 0;
+		bus->resource[0]->start =0;
+		bus->resource[1]->start = 0;
 #endif
 		/* Turn off downstream PF memory address range by default */
 		bus->resource[2]->start = 1024*1024;
diff --git a/drivers/cdrom/mcdx.c b/drivers/cdrom/mcdx.c
index f574962..4310cc8 100644
--- a/drivers/cdrom/mcdx.c
+++ b/drivers/cdrom/mcdx.c
@@ -1053,11 +1053,11 @@ static void __exit mcdx_exit(void)
 	if (unregister_blkdev(MAJOR_NR, "mcdx") != 0) {
 		xwarn("cleanup() unregister_blkdev() failed\n");
 	}
-	blk_cleanup_queue(mcdx_queue);
 #if !MCDX_QUIET
 	else
 	xinfo("cleanup() succeeded\n");
 #endif
+	blk_cleanup_queue(mcdx_queue);
 }
 
 #ifdef MODULE
diff --git a/drivers/tc/zs.c b/drivers/tc/zs.c
index 3524e3f..61de78a 100644
--- a/drivers/tc/zs.c
+++ b/drivers/tc/zs.c
@@ -2182,7 +2182,7 @@ struct dec_serial_hook zs_kgdbhook = {
 	.init_info	= kgdbhook_init_info,
 	.rx_char	= kgdbhook_rx_char,
 	.cflags		= B38400 | CS8 | CLOCAL,
-}
+};
 
 void __init zs_kgdb_hook(int tty_num)
 {
diff --git a/arch/i386/math-emu/fpu_entry.c b/arch/i386/math-emu/fpu_entry.c
index ddf8fa3..1853524 100644
--- a/arch/i386/math-emu/fpu_entry.c
+++ b/arch/i386/math-emu/fpu_entry.c
@@ -754,7 +754,7 @@ #endif /* PECULIAR_486 */
     return -1;
   if ( offset )
     if (__copy_to_user(d+other, (u_char *)&S387->st_space, offset))
-      return -1
+      return -1;
   RE_ENTRANT_CHECK_ON;
 
   return 1;

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
