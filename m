From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 26 Nov 2020 18:56:52 +0000
Subject: [PATCH] x86/usercopy: adjust __user annotation on __copy_user_intel()
Message-Id: <20201126185652.1875-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, Al Viro <viro@zeniv.linux.org.uk>
Cc: "H . Peter Anvin" <hpa@zytor.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Since commit beba3a20bf90 ("x86: switch to RAW_COPY_USER"),
__copy_user_ll() is used for copying in both directions, i.e., from user
memory space to kernel memory space and vice versa.

The underlying __copy_user_intel() is hence also used for copying in both
directions. The __user annotation on the arguments suggests a
specification, only copying to user memory space, that simply does not hold
anymore.

So, reflect this use of __copy_user_intel() by dropping the __user
annotation, as the __user annotations have already been removed at higher
level from the pointers in the raw_copy_from_user() and raw_copy_to_user()
before passing those pointers on to the low-level __copy_user_ll().

__copy_user_intel() is only used in __copy_user_ll(); so checking soundness
of the __user annotations around __copy_user_ll() is all that is needed.

No functional change. No change in object code.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201126

Thomas, Ingo, Boris, please pick this minor non-urgent clean-up patch.

 arch/x86/lib/usercopy_32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/lib/usercopy_32.c b/arch/x86/lib/usercopy_32.c
index 7d290777246d..4976283a01f0 100644
--- a/arch/x86/lib/usercopy_32.c
+++ b/arch/x86/lib/usercopy_32.c
@@ -94,7 +94,7 @@ EXPORT_SYMBOL(__clear_user);
 
 #ifdef CONFIG_X86_INTEL_USERCOPY
 static unsigned long
-__copy_user_intel(void __user *to, const void *from, unsigned long size)
+__copy_user_intel(void *to, const void *from, unsigned long size)
 {
 	int d0, d1;
 	__asm__ __volatile__(
@@ -291,7 +291,7 @@ static unsigned long __copy_user_intel_nocache(void *to,
  * Leave these declared but undefined.  They should not be any references to
  * them
  */
-unsigned long __copy_user_intel(void __user *to, const void *from,
+unsigned long __copy_user_intel(void *to, const void *from,
 					unsigned long size);
 #endif /* CONFIG_X86_INTEL_USERCOPY */
 
-- 
2.17.1
