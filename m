From: Domen Puncer <domen@coderock.org>
Date: Sat, 08 May 2004 23:38:23 +0000
Subject: [Kernel-janitors] [patch 2.6.6-rc3 16/16] ifdefs:
Message-Id: <20040508233823.GA4172@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============31811468812154908=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============31811468812154908==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

--- c/include/linux/mtd/cfi.h	2004-04-04 05:36:56.000000000 +0200
+++ a/include/linux/mtd/cfi.h	2004-05-09 00:25:18.000000000 +0200
@@ -458,14 +458,12 @@
 
 static inline void cfi_udelay(int us)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
 	unsigned long t = us * HZ / 1000000;
 	if (t) {
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		schedule_timeout(t);
 		return;
 	}
-#endif
 	udelay(us);
 	cond_resched();
 }

--===============31811468812154908==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============31811468812154908==--
