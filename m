From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Sun, 04 Jan 2004 08:07:02 +0000
Subject: [Kernel-janitors] [PATCH] Check return value in
Message-Id: <20040104080702.GA30543@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040103132946.GE21909@eugeneteo.net>
In-Reply-To: <20040103132946.GE21909@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Patch compiles, and tested. Please apply.

http://www.anomalistic.org/patches/i387-check-ret-__copy_from_user-fix-2.6.1-rc1-mm1.patch

diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/arch/i386/kernel/i387.c 2.6.1-rc1-mm1-fix/arch/i386/kernel/i387.c
--- 2.6.1-rc1-mm1/arch/i386/kernel/i387.c	2004-01-04 10:29:21.000000000 +0800
+++ 2.6.1-rc1-mm1-fix/arch/i386/kernel/i387.c	2004-01-04 15:59:48.000000000 +0800
@@ -456,8 +456,9 @@
 int set_fpxregs( struct task_struct *tsk, struct user_fxsr_struct __user *buf )
 {
 	if ( cpu_has_fxsr ) {
-		__copy_from_user( &tsk->thread.i387.fxsave, buf,
-				  sizeof(struct user_fxsr_struct) );
+		if (__copy_from_user( &tsk->thread.i387.fxsave, buf,
+				  sizeof(struct user_fxsr_struct) ))
+			return -EFAULT;
 		/* mxcsr bit 6 and 31-16 must be zero for security reasons */
 		tsk->thread.i387.fxsave.mxcsr &= 0xffbf;
 		return 0;

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
