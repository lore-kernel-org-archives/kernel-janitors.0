From: Michael Veeck <michael.veeck@gmx.net>
Date: Thu, 26 Feb 2004 21:17:18 +0000
Subject: [Kernel-janitors] [PATCH] fs/proc MIN/MAX removal
Message-Id: <403E625E.8050509@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090306030906060209050708"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------090306030906060209050708
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.3) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Best Regards
Michael



--------------090306030906060209050708
Content-Type: text/plain;
 name="minmax_fs_proc.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_fs_proc.patch"

--- linux-2.6.3.org/fs/proc/generic.c	2004-02-18 04:59:53.000000000 +0100
+++ linux-2.6.3.test/fs/proc/generic.c	2004-02-26 21:22:52.791857440 +0100
@@ -37,10 +37,6 @@
 	.write		= proc_file_write,
 };
 
-#ifndef MIN
-#define MIN(a,b) (((a) < (b)) ? (a) : (b))
-#endif
-
 /* buffer size is one page but our output routines use some slack for overruns */
 #define PROC_BLOCK_SIZE	(PAGE_SIZE - 1024)
 
@@ -61,7 +57,7 @@
 		return -ENOMEM;
 
 	while ((nbytes > 0) && !eof) {
-		count = MIN(PROC_BLOCK_SIZE, nbytes);
+		count = min_t(ssize_t, PROC_BLOCK_SIZE, nbytes);
 
 		start = NULL;
 		if (dp->get_info) {

--------------090306030906060209050708
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------090306030906060209050708--
