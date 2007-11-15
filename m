From: Jiri Olsa <olsajiri@gmail.com>
Date: Thu, 15 Nov 2007 08:38:44 +0000
Subject: [PATCH] fs: remove dead config CONFIG_HAS_COMPAT_EPOLL_EVENT symbol
Message-Id: <473C0594.6030304@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, joel.becker@oracle.com

remove dead config CONFIG_HAS_COMPAT_EPOLL_EVENT symbol
Signed-off-by: Jiri Olsa <olsajiri@gmail.com>

---
 fs/compat.c            |   49 ------------------------------------------------
 include/linux/compat.h |    8 -------
 2 files changed, 0 insertions(+), 57 deletions(-)

diff --git a/fs/compat.c b/fs/compat.c
index 15078ce..009109d 100644
--- a/fs/compat.c
+++ b/fs/compat.c
@@ -2087,51 +2087,6 @@ long asmlinkage compat_sys_nfsservctl(int cmd, void *notused, void *notused2)
 
 #ifdef CONFIG_EPOLL
 
-#ifdef CONFIG_HAS_COMPAT_EPOLL_EVENT
-asmlinkage long compat_sys_epoll_ctl(int epfd, int op, int fd,
-			struct compat_epoll_event __user *event)
-{
-	long err = 0;
-	struct compat_epoll_event user;
-	struct epoll_event __user *kernel = NULL;
-
-	if (event) {
-		if (copy_from_user(&user, event, sizeof(user)))
-			return -EFAULT;
-		kernel = compat_alloc_user_space(sizeof(struct epoll_event));
-		err |= __put_user(user.events, &kernel->events);
-		err |= __put_user(user.data, &kernel->data);
-	}
-
-	return err ? err : sys_epoll_ctl(epfd, op, fd, kernel);
-}
-
-
-asmlinkage long compat_sys_epoll_wait(int epfd,
-			struct compat_epoll_event __user *events,
-			int maxevents, int timeout)
-{
-	long i, ret, err = 0;
-	struct epoll_event __user *kbuf;
-	struct epoll_event ev;
-
-	if ((maxevents <= 0) ||
-			(maxevents > (INT_MAX / sizeof(struct epoll_event))))
-		return -EINVAL;
-	kbuf = compat_alloc_user_space(sizeof(struct epoll_event) * maxevents);
-	ret = sys_epoll_wait(epfd, kbuf, maxevents, timeout);
-	for (i = 0; i < ret; i++) {
-		err |= __get_user(ev.events, &kbuf[i].events);
-		err |= __get_user(ev.data, &kbuf[i].data);
-		err |= __put_user(ev.events, &events->events);
-		err |= __put_user_unaligned(ev.data, &events->data);
-		events++;
-	}
-
-	return err ? -EFAULT: ret;
-}
-#endif	/* CONFIG_HAS_COMPAT_EPOLL_EVENT */
-
 #ifdef TIF_RESTORE_SIGMASK
 asmlinkage long compat_sys_epoll_pwait(int epfd,
 			struct compat_epoll_event __user *events,
@@ -2157,11 +2112,7 @@ asmlinkage long compat_sys_epoll_pwait(int epfd,
 		sigprocmask(SIG_SETMASK, &ksigmask, &sigsaved);
 	}
 
-#ifdef CONFIG_HAS_COMPAT_EPOLL_EVENT
-	err = compat_sys_epoll_wait(epfd, events, maxevents, timeout);
-#else
 	err = sys_epoll_wait(epfd, events, maxevents, timeout);
-#endif
 
 	/*
 	 * If we changed the signal mask, we need to restore the original one.
diff --git a/include/linux/compat.h b/include/linux/compat.h
index 0e69d2c..27143be 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -242,16 +242,8 @@ asmlinkage long compat_sys_migrate_pages(compat_pid_t pid,
 /*
  * epoll (fs/eventpoll.c) compat bits follow ...
  */
-#ifndef CONFIG_HAS_COMPAT_EPOLL_EVENT
 struct epoll_event;
 #define compat_epoll_event	epoll_event
-#else
-asmlinkage long compat_sys_epoll_ctl(int epfd, int op, int fd,
-			struct compat_epoll_event __user *event);
-asmlinkage long compat_sys_epoll_wait(int epfd,
-			struct compat_epoll_event __user *events,
-			int maxevents, int timeout);
-#endif
 asmlinkage long compat_sys_epoll_pwait(int epfd,
 			struct compat_epoll_event __user *events,
 			int maxevents, int timeout,
