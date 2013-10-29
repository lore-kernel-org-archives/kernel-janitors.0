From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 10:09:25 +0000
Subject: [PATCH 14/14] JANITOR: Delete include/linux/sys.h
Message-Id: <20131029100924.GM14214@nbf-011.seri.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


From b5e9e1daa9e7d889b4dca32048ac55b9891e030f Mon Sep 17 00:00:00 2001
From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 09:33:14 +0200
Subject: [PATCH 14/14] 14/14 JANITOR: Delete include/linux/sys.h

	All #include:s are gone, delete the file.

Signed-off-by: Mika Kukkonen <m.kukkonen@samsung.com>
---
 include/linux/sys.h | 29 -----------------------------
 1 file changed, 29 deletions(-)
 delete mode 100644 include/linux/sys.h

diff --git a/include/linux/sys.h b/include/linux/sys.h
deleted file mode 100644
index daa6008..0000000
--- a/include/linux/sys.h
+++ /dev/null
@@ -1,29 +0,0 @@
-#ifndef _LINUX_SYS_H
-#define _LINUX_SYS_H
-
-/*
- * This file is no longer used or needed
- */
-
-/*
- * These are system calls that will be removed at some time
- * due to newer versions existing..
- * (please be careful - ibcs2 may need some of these).
- */
-#ifdef notdef
-#define _sys_waitpid	_sys_old_syscall	/* _sys_wait4 */
-#define _sys_olduname	_sys_old_syscall	/* _sys_newuname */
-#define _sys_uname	_sys_old_syscall	/* _sys_newuname */
-#define _sys_stat	_sys_old_syscall	/* _sys_newstat */
-#define _sys_fstat	_sys_old_syscall	/* _sys_newfstat */
-#define _sys_lstat	_sys_old_syscall	/* _sys_newlstat */
-#define _sys_signal	_sys_old_syscall	/* _sys_sigaction */
-#define _sys_sgetmask	_sys_old_syscall	/* _sys_sigprocmask */
-#define _sys_ssetmask	_sys_old_syscall	/* _sys_sigprocmask */
-#endif
-
-/*
- * These are system calls that haven't been implemented yet
- * but have an entry in the table for future expansion..
- */
-#endif
-- 
1.8.3.2

