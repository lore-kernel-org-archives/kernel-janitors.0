From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Sun, 04 Jan 2004 08:25:50 +0000
Subject: [Kernel-janitors] [PATCH] Check return value of __copy_from_user
Message-Id: <20040104082550.GA32691@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040103132946.GE21909@eugeneteo.net>
In-Reply-To: <20040103132946.GE21909@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Patch compiles, and tested. Please apply.

http://www.anomalistic.org/patches/fpu_entry-check-ret-__copy_to_user-fix-2.6.1-rc1-mm1.patch

diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/arch/i386/math-emu/fpu_entry.c 2.6.1-rc1-mm1-fix/arch/i386/math-emu/fpu_entry.c
--- 2.6.1-rc1-mm1/arch/i386/math-emu/fpu_entry.c	2004-01-04 16:22:38.000000000 +0800
+++ 2.6.1-rc1-mm1-fix/arch/i386/math-emu/fpu_entry.c	2004-01-04 16:09:20.000000000 +0800
@@ -686,7 +686,8 @@
 
   RE_ENTRANT_CHECK_OFF;
   FPU_verify_area(VERIFY_READ, d, 7*4 + 8*10);
-  __copy_from_user(&S387->cwd, d, 7*4);
+  if (__copy_from_user(&S387->cwd, d, 7*4))
+    return -1;
   RE_ENTRANT_CHECK_ON;
 
   d += 7*4;

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
