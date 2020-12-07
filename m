From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 07 Dec 2020 12:36:10 +0000
Subject: [PATCH] signal: propagate __user annotations properly
Message-Id: <20201207123610.18246-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Brauner <christian@brauner.io>, linux-kernel@vger.kernel.org
Cc: Tycho Andersen <tycho@tycho.ws>, Kees Cook <keescook@chromium.org>, David Howells <dhowells@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Serge Hallyn <serge@hallyn.com>, Aleksa Sarai <cyphar@cyphar.com>, kernel-janitors@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 3eb39f47934f ("signal: add pidfd_send_signal() syscall") introduced
copy_siginfo_from_user_any(), but missed to add the __user annotation to
the user pointer that is passed as second argument.

Hence, when copy_siginfo_from_user_any() calls copy_siginfo_from_user(),
sparse warns:

  kernel/signal.c:3716:46: warning: incorrect type in argument 2 (different address spaces)
  kernel/signal.c:3716:46:    expected struct siginfo const [noderef] [usertype] __user *from
  kernel/signal.c:3716:46:    got struct siginfo [usertype] *info

And when pidfd_send_signal() calls copy_siginfo_from_user_any(), sparse
warns as well:

  kernel/signal.c:3776:58: warning: incorrect type in argument 2 (different address spaces)
  kernel/signal.c:3776:58:    expected struct siginfo [usertype] *info
  kernel/signal.c:3776:58:    got struct siginfo [noderef] [usertype] __user *info

Add the __user annotation to repair this chain of propagating __user
annotations.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master (v5.10-rc7) and next-20201204

Christian, please pick this minor non-urgent clean-up patch.

 kernel/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/signal.c b/kernel/signal.c
index 5736c55aaa1a..e969b3bc815f 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -3701,7 +3701,7 @@ static bool access_pidfd_pidns(struct pid *pid)
 	return true;
 }
 
-static int copy_siginfo_from_user_any(kernel_siginfo_t *kinfo, siginfo_t *info)
+static int copy_siginfo_from_user_any(kernel_siginfo_t *kinfo, siginfo_t __user *info)
 {
 #ifdef CONFIG_COMPAT
 	/*
-- 
2.17.1
