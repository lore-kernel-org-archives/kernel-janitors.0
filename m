From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Sun, 04 Jan 2004 08:47:47 +0000
Subject: [Kernel-janitors] [PATCH] Check return value of kernel_thread
Message-Id: <20040104084747.GA2298@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040103132946.GE21909@eugeneteo.net>
In-Reply-To: <20040103132946.GE21909@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Patch compiles, and tested. Please apply.

http://www.anomalistic.org/patches/main-check-ret-kernel_thread-fix-2.6.1-rc1-mm1.patch

diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/init/main.c 2.6.1-rc1-mm1-fix/init/main.c
--- 2.6.1-rc1-mm1/init/main.c	2004-01-04 10:29:15.000000000 +0800
+++ 2.6.1-rc1-mm1-fix/init/main.c	2004-01-04 16:44:33.000000000 +0800
@@ -373,7 +373,9 @@
 
 static void rest_init(void)
 {
-	kernel_thread(init, NULL, CLONE_FS | CLONE_SIGHAND);
+	int ret = kernel_thread(init, NULL, CLONE_FS | CLONE_SIGHAND);
+	if (ret < 0)
+		panic("Unable to start init thread\n");
 	unlock_kernel();
  	cpu_idle();
 } 

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
