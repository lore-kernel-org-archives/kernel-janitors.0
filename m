From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 07 Dec 2020 12:41:41 +0000
Subject: [PATCH] x86: ia32_setup_rt_frame(): propagate __user annotations properly
Message-Id: <20201207124141.21859-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>, Al Viro <viro@zeniv.linux.org.uk>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 57d563c82925 ("x86: ia32_setup_rt_frame(): consolidate uaccess
areas") dropped a __user annotation in a cast when refactoring __put_user()
to unsafe_put_user().

Hence, since then, sparse warns in arch/x86/ia32/ia32_signal.c:350:9:

  warning: cast removes address space '__user' of expression
  warning: incorrect type in argument 1 (different address spaces)
    expected void const volatile [noderef] __user *ptr
    got unsigned long long [usertype] *

Add the __user annotation to restore the propagation of address spaces.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master (v5.10-rc7) and next-20201204

Thomas, Ingo, Boris, please pick this minor non-urgent clean-up patch.

 arch/x86/ia32/ia32_signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/ia32/ia32_signal.c b/arch/x86/ia32/ia32_signal.c
index 81cf22398cd1..5e3d9b7fd5fb 100644
--- a/arch/x86/ia32/ia32_signal.c
+++ b/arch/x86/ia32/ia32_signal.c
@@ -347,7 +347,7 @@ int ia32_setup_rt_frame(int sig, struct ksignal *ksig,
 	 */
 	unsafe_put_user(*((u64 *)&code), (u64 __user *)frame->retcode, Efault);
 	unsafe_put_sigcontext32(&frame->uc.uc_mcontext, fp, regs, set, Efault);
-	unsafe_put_user(*(__u64 *)set, (__u64 *)&frame->uc.uc_sigmask, Efault);
+	unsafe_put_user(*(__u64 *)set, (__u64 __user *)&frame->uc.uc_sigmask, Efault);
 	user_access_end();
 
 	if (__copy_siginfo_to_user32(&frame->info, &ksig->info))
-- 
2.17.1
