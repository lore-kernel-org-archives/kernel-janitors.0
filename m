From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 03 Jul 2004 15:08:01 +0000
Subject: [Kernel-janitors] [PATCH] drivers/char/synclinkmp.c MIN/MAX removal
Message-Id: <40E81A8E.4000907@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050906010402090803030301"
List-Id: <kernel-janitors.vger.kernel.org>
References: <40E81A6A.5060904@gmx.net>
In-Reply-To: <40E81A6A.5060904@gmx.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------050906010402090803030301
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.7) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Feedback is always welcome
Michael








--------------050906010402090803030301
Content-Type: text/plain;
 name="patch-char-synclinkmp"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-char-synclinkmp"

--- linux-2.6.7-old/drivers/char/synclinkmp.c	2004-07-04 11:04:13.000000000 +0200
+++ linux-2.6.7-new/drivers/char/synclinkmp.c	2004-07-04 14:56:46.000000000 +0200
@@ -520,10 +520,6 @@
 /* number of characters left in xmit buffer before we ask for more */
 #define WAKEUP_CHARS 256
 
-#ifndef MIN
-#define MIN(a,b) ((a) < (b) ? (a) : (b))
-#endif
-
 
 /* tty callbacks */
 
@@ -1013,8 +1009,8 @@
 	}
 
 	for (;;) {
-		c = MIN(count,
-			MIN(info->max_frame_size - info->tx_count - 1,
+		c = min_t(int, count,
+			min(info->max_frame_size - info->tx_count - 1,
 			    info->max_frame_size - info->tx_put));
 		if (c <= 0)
 			break;
@@ -1157,7 +1153,7 @@
 		char_time = 1;
 
 	if (timeout)
-		char_time = MIN(char_time, timeout);
+		char_time = min_t(unsigned long, char_time, timeout);
 
 	if ( info->params.mode == MGSL_MODE_HDLC ) {
 		while (info->tx_active) {
@@ -4831,7 +4827,7 @@
 
 	if ( debug_level >= DEBUG_LEVEL_DATA )
 		trace_block(info,info->rx_buf_list_ex[StartIndex].virt_addr,
-			MIN(framesize,SCABUFSIZE),0);
+			min_t(int, framesize,SCABUFSIZE),0);
 
 	if (framesize) {
 		if (framesize > info->max_frame_size)
@@ -4846,7 +4842,7 @@
 			info->icount.rxok++;
 
 			while(copy_count) {
-				int partial_count = MIN(copy_count,SCABUFSIZE);
+				int partial_count = min(copy_count,SCABUFSIZE);
 				memcpy( ptmp,
 					info->rx_buf_list_ex[index].virt_addr,
 					partial_count );
@@ -4905,14 +4901,14 @@
 	SCADESC_EX *desc_ex;
 
 	if ( debug_level >= DEBUG_LEVEL_DATA )
-		trace_block(info,buf, MIN(count,SCABUFSIZE), 1);
+		trace_block(info,buf, min_t(int, count,SCABUFSIZE), 1);
 
 	/* Copy source buffer to one or more DMA buffers, starting with
 	 * the first transmit dma buffer.
 	 */
 	for(i=0;;)
 	{
-		copy_count = MIN(count,SCABUFSIZE);
+		copy_count = min_t(unsigned short,count,SCABUFSIZE);
 
 		desc = &info->tx_buf_list[i];
 		desc_ex = &info->tx_buf_list_ex[i];

--------------050906010402090803030301
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------050906010402090803030301--
