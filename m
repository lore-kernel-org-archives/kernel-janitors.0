From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Sat, 03 Jan 2004 13:29:46 +0000
Subject: [Kernel-janitors] [PATCH] Check return value in mm/memory.c
Message-Id: <20040103132946.GE21909@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

http://www.anomalistic.org/patches/memory-check-ret-find_extend_vma-fix-2.6.1-rc1-mm1.patch

diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/mm/memory.c 2.6.1-rc1-mm1-fix/mm/memory.c
--- 2.6.1-rc1-mm1/mm/memory.c	2004-01-03 20:33:39.000000000 +0800
+++ 2.6.1-rc1-mm1-fix/mm/memory.c	2004-01-03 20:50:13.000000000 +0800
@@ -34,6 +34,9 @@
  *
  * 16.07.99  -  Support of BIGMEM added by Gerhard Wichert, Siemens AG
  *		(Gerhard.Wichert@pdb.siemens.de)
+ *
+ * 03.01.04  -	Check the return value of find_extend_vma, added by
+ * 		Eugene Teo (eugeneteo@eugeneteo.net)
  */
 
 #include <linux/kernel_stat.h>
@@ -712,6 +715,8 @@
 		struct vm_area_struct *	vma;
 
 		vma = find_extend_vma(mm, start);
+		if (unlikely(!vma))
+			return -EFAULT;
 
 #ifdef FIXADDR_USER_START
 		if (!vma &&

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
