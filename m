From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Wed, 21 Jan 2004 19:06:12 +0000
Subject: [Kernel-janitors] [PATCH] drivers/.../saa7146_hlp - use {min,
Message-Id: <20040121190612.GA26666@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

use {min,max}_t instead of home-brewed my_{min,max} macros.
straight-forward. patch compiles, and tested.

diff -Naur -X /home/amnesia/w/dontdiff 2.6.2-rc1-orig/drivers/media/common/saa7146_hlp.c 2.6.2-rc1-fix/drivers/media/common/saa7146_hlp.c
--- 2.6.2-rc1-orig/drivers/media/common/saa7146_hlp.c	2004-01-22 02:19:05.000000000 +0800
+++ 2.6.2-rc1-fix/drivers/media/common/saa7146_hlp.c	2004-01-22 02:45:48.000000000 +0800
@@ -1,10 +1,6 @@
+#include <linux/kernel.h>
 #include <media/saa7146_vv.h>
 
-#define my_min(type,x,y) \
-	({ type __x = (x), __y = (y); __x < __y ? __x: __y; })
-#define my_max(type,x,y) \
-	({ type __x = (x), __y = (y); __x > __y ? __x: __y; })
-
 static void calculate_output_format_register(struct saa7146_dev* saa, u32 palette, u32* clip_format)
 {
 	/* clear out the necessary bits */
@@ -401,11 +397,11 @@
 		b = y[i]+h[i];
 		
 		/* insert left/right coordinates */
-		pixel_list[ 2*i   ] = my_min(int, l, width);
-		pixel_list[(2*i)+1] = my_min(int, r, width);
+		pixel_list[ 2*i   ] = min_t(int, l, width);
+		pixel_list[(2*i)+1] = min_t(int, r, width);
 		/* insert top/bottom coordinates */
-		line_list[ 2*i   ] = my_min(int, t, height);
-		line_list[(2*i)+1] = my_min(int, b, height);
+		line_list[ 2*i   ] = min_t(int, t, height);
+		line_list[(2*i)+1] = min_t(int, b, height);
 	}
 
 	/* sort and eliminate lists */
@@ -414,9 +410,9 @@
 	sort_and_eliminate( &line_list[0], &cnt_line );
 
 	/* calculate the number of used u32s */
-	numdwords = my_max(int, (cnt_line+1), (cnt_pixel+1))*2; 
-	numdwords = my_max(int, 4, numdwords);
-	numdwords = my_min(int, 64, numdwords);
+	numdwords = max_t(int, (cnt_line+1), (cnt_pixel+1))*2; 
+	numdwords = max_t(int, 4, numdwords);
+	numdwords = min_t(int, 64, numdwords);
 
 	/* fill up cliptable */
 	for(i = 0; i < cnt_pixel; i++) {

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
