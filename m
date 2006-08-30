From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:46:47 +0000
Subject: [KJ] [PATCH] 12/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214647.15055.40899.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/err_common.c b/arch/alpha/kernel/err_common.c
index 687580b..7b200d6 100644
--- a/arch/alpha/kernel/err_common.c
+++ b/arch/alpha/kernel/err_common.c
@@ -37,7 +37,7 @@ mchk_dump_mem(void *data, size_t length,
 	for (i = 0; (i * sizeof(*ldata)) < length; i++) {
 		if (annotation && !annotation[i]) 
 			annotation = NULL;
-		printk("%s    %08x: %016lx    %s\n",
+		printk(KERN_ERR "%s    %08x: %016lx    %s\n",
 		       err_print_prefix,
 		       (unsigned)(i * sizeof(*ldata)), ldata[i],
 		       annotation ? annotation[i] : "");
@@ -47,34 +47,28 @@ mchk_dump_mem(void *data, size_t length,
 void
 mchk_dump_logout_frame(struct el_common *mchk_header)
 {
-	printk("%s  -- Frame Header --\n"
-	         "    Frame Size:   %d (0x%x) bytes\n"
-	         "    Flags:        %s%s\n"
-	         "    MCHK Code:    0x%x\n"
-	         "    Frame Rev:    %d\n"
-	         "    Proc Offset:  0x%08x\n"
-	         "    Sys Offset:   0x%08x\n"
-  	         "  -- Processor Region --\n",
-	       err_print_prefix, 
-	       mchk_header->size, mchk_header->size,
-	       mchk_header->retry ? "RETRY " : "", 
-  	         mchk_header->err2 ? "SECOND_ERR " : "",
-	       mchk_header->code,
-	       mchk_header->frame_rev,
-	       mchk_header->proc_offset,
-	       mchk_header->sys_offset);
+	printk(KERN_ERR "%s  -- Frame Header --\n", err_print_prefix);
+	printk(KERN_ERR "    Frame Size:   %d (0x%x) bytes\n",
+		mchk_header->size, mchk_header->size);
+	printk(KERN_ERR "    Flags:        %s%s\n",
+		mchk_header->retry ? "RETRY " : "", mchk_header->err2 ? "SECOND_ERR " : "");
+	printk(KERN_ERR "    MCHK Code:    0x%x\n", mchk_header->code);
+	printk(KERN_ERR "    Frame Rev:    %d\n", mchk_header->frame_rev);
+	printk(KERN_ERR "    Proc Offset:  0x%08x\n", mchk_header->proc_offset);
+	printk(KERN_ERR "    Sys Offset:   0x%08x\n", mchk_header->sys_offset);
+	printk(KERN_ERR "  -- Processor Region --\n");
 
 	mchk_dump_mem((void *)
 		      ((unsigned long)mchk_header + mchk_header->proc_offset),
 		      mchk_header->sys_offset - mchk_header->proc_offset,
 		      NULL);
 	
-	printk("%s  -- System Region --\n", err_print_prefix);
+	printk(KERN_ERR "%s  -- System Region --\n", err_print_prefix);
 	mchk_dump_mem((void *)
 		      ((unsigned long)mchk_header + mchk_header->sys_offset),
 		      mchk_header->size - mchk_header->sys_offset,
 		      NULL);
-	printk("%s  -- End of Frame --\n", err_print_prefix);
+	printk(KERN_ERR "%s  -- End of Frame --\n", err_print_prefix);
 }
 
 
@@ -94,7 +88,7 @@ el_process_header_subpacket(struct el_su
 	int length = 0;
 
 	if (header->class != EL_CLASS__HEADER) {
-		printk("%s** Unexpected header CLASS %d TYPE %d, aborting\n",
+		printk(KERN_ERR "%s** Unexpected header CLASS %d TYPE %d, aborting\n",
 		       err_print_prefix,
 		       header->class, header->type);
 		return NULL;
@@ -129,17 +123,14 @@ el_process_header_subpacket(struct el_su
 		timestamp.as_int = 0;
 		break;
 	default: /* Unknown */
-		printk("%s** Unknown header - CLASS %d TYPE %d, aborting\n",
+		printk(KERN_ERR "%s** Unknown header - CLASS %d TYPE %d, aborting\n",
 		       err_print_prefix,
 		       header->class, header->type);
 		return NULL;		
 	}
 
-	printk("%s*** %s:\n"
-	         "  CLASS %d, TYPE %d\n", 
-	       err_print_prefix,
-	       name,
-	       header->class, header->type);
+	printk(KERN_ERR "%s*** %s:\n", err_print_prefix, name);
+	printk(KERN_ERR "  CLASS %d, TYPE %d\n", header->class, header->type);
 	el_print_timestamp(&timestamp);
 	
 	/*
@@ -169,7 +160,7 @@ void
 el_print_timestamp(union el_timestamp *timestamp)
 {
 	if (timestamp->as_int)
-		printk("%s  TIMESTAMP: %d/%d/%02d %d:%02d:%0d\n", 
+		printk(KERN_ERR "%s  TIMESTAMP: %d/%d/%02d %d:%02d:%0d\n", 
 		       err_print_prefix,
 		       timestamp->b.month, timestamp->b.day,
 		       timestamp->b.year, timestamp->b.hour,
@@ -186,7 +177,7 @@ el_process_subpackets(struct el_subpacke
 		((unsigned long)header + header->length);
 
 	for (i = 0; subpacket && i < packet_count; i++) {
-		printk("%sPROCESSING SUBPACKET %d\n", err_print_prefix, i);
+		printk(KERN_ERR "%sPROCESSING SUBPACKET %d\n", err_print_prefix, i);
 		subpacket = el_process_subpacket(subpacket);
 	}
 }
@@ -205,7 +196,7 @@ el_process_subpacket(struct el_subpacket
 		break;
 	default:
 		if (NULL = (next = el_process_subpacket_reg(header))) {
-			printk("%s** Unexpected header CLASS %d TYPE %d"
+			printk(KERN_ERR "%s** Unexpected header CLASS %d TYPE %d"
 			       " -- aborting.\n",
 			       err_print_prefix,
 			       header->class, header->type);
@@ -230,7 +221,7 @@ el_annotate_subpacket(struct el_subpacke
 			 * We found the annotation
 			 */
 			annotation = a->annotation;
-			printk("%s  %s\n", err_print_prefix, a->description);
+			printk(KERN_ERR "%s  %s\n", err_print_prefix, a->description);
 			break;
 		}
 	}
@@ -245,9 +236,9 @@ cdl_process_console_data_log(int cpu, st
 		(IDENT_ADDR | pcpu->console_data_log_pa);
 	int err;
 
-	printk("%s******* CONSOLE DATA LOG FOR CPU %d. *******\n"
-	         "*** Error(s) were logged on a previous boot\n",
-	       err_print_prefix, cpu);
+	printk(KERN_ERR "%s******* CONSOLE DATA LOG FOR CPU %d. *******\n",
+		err_print_prefix, cpu);
+	printk(KERN_ERR "*** Error(s) were logged on a previous boot\n");
 	
 	for (err = 0; header && (header->class != EL_CLASS__TERMINATION); err++)
 		header = el_process_subpacket(header);
@@ -255,9 +246,8 @@ cdl_process_console_data_log(int cpu, st
 	/* let the console know it's ok to clear the error(s) at restart */
 	pcpu->console_data_log_pa = 0;
 
-	printk("%s*** %d total error(s) logged\n"
-	         "**** END OF CONSOLE DATA LOG FOR CPU %d ****\n", 
-	       err_print_prefix, err, cpu);
+	printk(KERN_ERR "%s*** %d total error(s) logged\n", err_print_prefix, err);
+	printk(KERN_ERR "**** END OF CONSOLE DATA LOG FOR CPU %d ****\n", cpu);
 }
 
 void __init
@@ -286,7 +276,7 @@ cdl_register_subpacket_annotation(struct
 		for (; a->next != NULL; a = a->next) {
 			if ((a->class = new->class && a->type = new->type) ||
 			    a = new) {
-				printk("Attempted to re-register "
+				printk(KERN_ERR "Attempted to re-register "
 				       "subpacket annotation\n");
 				return -EINVAL;
 			}
@@ -307,7 +297,7 @@ cdl_register_subpacket_handler(struct el
 	else {
 		for (; h->next != NULL; h = h->next) {
 			if (h->class = new->class || h = new) {
-				printk("Attempted to re-register "
+				printk(KERN_ERR "Attempted to re-register "
 				       "subpacket handler\n");
 				return -EINVAL;
 			}
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
