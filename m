From: Michael Veeck <michael.veeck@gmx.net>
Date: Sun, 15 Aug 2004 11:44:30 +0000
Subject: [Kernel-janitors] [PATCH] minmax-removal arch/s390/kernel/debug.c
Message-Id: <411F4C9E.1050008@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030100070000030007050506"
List-Id: <kernel-janitors.vger.kernel.org>
References: <411F4C54.4090609@gmx.net>
In-Reply-To: <411F4C54.4090609@gmx.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------030100070000030007050506
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.8.1) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Since I dont have the hardware those patches are not tested.

Best regards
Veeck

Signed-off-by: Michael Veeck <michael.veeck@gmx.net>





--------------030100070000030007050506
Content-Type: text/plain;
 name="minmax-arch-s390-kernel.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax-arch-s390-kernel.patch"

--- linux-2.6.8-old/arch/s390/kernel/debug.c	2004-08-14 11:49:10.000000000 +0200
+++ linux-2.6.8-new/arch/s390/kernel/debug.c	2004-08-15 13:14:05.860673056 +0200
@@ -24,7 +24,6 @@
 
 #include <asm/debug.h>
 
-#define MIN(a,b) (((a)<(b))?(a):(b))
 #define DEBUG_PROLOG_ENTRY -1
 
 /* typedefs */
@@ -435,7 +434,7 @@ static ssize_t debug_output(struct file 
 
 	while(count < len){
 		size = debug_format_entry(p_info);
-		size = MIN((len - count), (size - entry_offset));
+		size = min((len - count), (size - entry_offset));
 
 		if(size){
 			if (copy_to_user(user_buf + count, 
@@ -723,7 +722,7 @@ debug_entry_t *debug_event_common(debug_
 	spin_lock_irqsave(&id->lock, flags);
 	active = get_active_entry(id);
 	memset(DEBUG_DATA(active), 0, id->buf_size);
-	memcpy(DEBUG_DATA(active), buf, MIN(len, id->buf_size));
+	memcpy(DEBUG_DATA(active), buf, min(len, id->buf_size));
 	debug_finish_entry(id, active, level, 0);
 	spin_unlock_irqrestore(&id->lock, flags);
 
@@ -744,7 +743,7 @@ debug_entry_t *debug_exception_common(de
 	spin_lock_irqsave(&id->lock, flags);
 	active = get_active_entry(id);
 	memset(DEBUG_DATA(active), 0, id->buf_size);
-	memcpy(DEBUG_DATA(active), buf, MIN(len, id->buf_size));
+	memcpy(DEBUG_DATA(active), buf, min(len, id->buf_size));
 	debug_finish_entry(id, active, level, 1);
 	spin_unlock_irqrestore(&id->lock, flags);
 
@@ -789,7 +788,7 @@ debug_entry_t *debug_sprintf_event(debug
 	curr_event=(debug_sprintf_entry_t *) DEBUG_DATA(active);
 	va_start(ap,string);
 	curr_event->string=string;
-	for(idx=0;idx<MIN(numargs,((id->buf_size / sizeof(long))-1));idx++)
+	for(idx=0;idx<min(numargs,((id->buf_size / sizeof(long))-1));idx++)
 		curr_event->args[idx]=va_arg(ap,long);
 	va_end(ap);
 	debug_finish_entry(id, active, level, 0);
@@ -821,7 +820,7 @@ debug_entry_t *debug_sprintf_exception(d
 	curr_event=(debug_sprintf_entry_t *)DEBUG_DATA(active);
 	va_start(ap,string);
 	curr_event->string=string;
-	for(idx=0;idx<MIN(numargs,((id->buf_size / sizeof(long))-1));idx++)
+	for(idx=0;idx<min(numargs,((id->buf_size / sizeof(long))-1));idx++)
 		curr_event->args[idx]=va_arg(ap,long);
 	va_end(ap);
 	debug_finish_entry(id, active, level, 1);
@@ -1157,7 +1156,7 @@ int debug_sprintf_format_fn(debug_info_t
 	}
 
 	/* number of arguments used for sprintf (without the format string) */
-	num_used_args   = MIN(DEBUG_SPRINTF_MAX_ARGS, (num_longs - 1));
+	num_used_args = min(DEBUG_SPRINTF_MAX_ARGS, (num_longs - 1));
 
 	memset(index,0, DEBUG_SPRINTF_MAX_ARGS * sizeof(int));
 

--------------030100070000030007050506
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------030100070000030007050506--
