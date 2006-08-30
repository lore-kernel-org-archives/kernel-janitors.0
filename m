From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:47:01 +0000
Subject: [KJ] [PATCH] 14/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214701.15055.40140.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/err_ev7.c b/arch/alpha/kernel/err_ev7.c
index fed6b3d..9636b96 100644
--- a/arch/alpha/kernel/err_ev7.c
+++ b/arch/alpha/kernel/err_ev7.c
@@ -63,7 +63,7 @@ ev7_collect_logout_frame_subpackets(stru
 		 * All subpackets should be class PAL.
 		 */
 		if (subpacket->class != EL_CLASS__PAL) {
-			printk("%s**UNEXPECTED SUBPACKET CLASS %d "
+			printk(KERN_ERR "%s**UNEXPECTED SUBPACKET CLASS %d "
 			       "IN LOGOUT FRAME (packet %d\n",
 			       err_print_prefix, subpacket->class, i);
 			return NULL;
@@ -130,7 +130,7 @@ ev7_machine_check(u64 vector, u64 la_ptr
 	draina();
 
 	err_print_prefix = KERN_CRIT;
-	printk("%s*CPU %s Error (Vector 0x%x) reported on CPU %d\n",
+	printk(KERN_ERR "%s*CPU %s Error (Vector 0x%x) reported on CPU %d\n",
 	       err_print_prefix, 
 	       (vector = SCB_Q_PROCERR) ? "Correctable" : "Uncorrectable",
 	       (unsigned int)vector, (int)smp_processor_id());
@@ -237,7 +237,7 @@ ev7_process_pal_subpacket(struct el_subp
 	struct ev7_pal_subpacket *packet;
 
 	if (header->class != EL_CLASS__PAL) {
-		printk("%s  ** Unexpected header CLASS %d TYPE %d, aborting\n",
+		printk(KERN_ERR "%s  ** Unexpected header CLASS %d TYPE %d, aborting\n",
 		       err_print_prefix,
 		       header->class, header->type);
 		return NULL;
@@ -247,21 +247,19 @@ ev7_process_pal_subpacket(struct el_subp
 
 	switch(header->type) {
 	case EL_TYPE__PAL__LOGOUT_FRAME:
-		printk("%s*** MCHK occurred on LPID %ld (RBOX %lx)\n",
+		printk(KERN_ERR "%s*** MCHK occurred on LPID %ld (RBOX %lx)\n",
 		       err_print_prefix,
 		       packet->by_type.logout.whami, 
 		       packet->by_type.logout.rbox_whami);
 		el_print_timestamp(&packet->by_type.logout.timestamp);
-		printk("%s  EXC_ADDR: %016lx\n"
-		         "  HALT_CODE: %lx\n", 
-		       err_print_prefix,
-		       packet->by_type.logout.exc_addr,
-		       packet->by_type.logout.halt_code);
+		printk(KERN_ERR "%s  EXC_ADDR: %016lx\n",
+			err_print_prefix, packet->by_type.logout.exc_addr);
+		printk(KERN_ERR "  HALT_CODE: %lx\n", packet->by_type.logout.halt_code);
 		el_process_subpackets(header,
                                       packet->by_type.logout.subpacket_count);
 		break;
 	default:
-		printk("%s  ** PAL TYPE %d SUBPACKET\n", 
+		printk(KERN_ERR "%s  ** PAL TYPE %d SUBPACKET\n", 
 		       err_print_prefix,
 		       header->type);
 		el_annotate_subpacket(header);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
