From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 16 Nov 2020 09:42:18 +0000
Subject: [PATCH] x86/cpu: remove needless definition for !CONFIG_X86_32
Message-Id: <20201116094218.10508-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

The function flag_is_changeable_p() is used in:

  - have_cpuid_p() for its CONFIG_X86_32 definition
  - identify_cpu_without_cpuid() within its CONFIG_X86_32 ifdef-block

So, there is no need to define flag_is_changeable_p() if !CONFIG_X86_32.
Simply remove this needless definition.

This was discovered with make CC=clang W=1:

  arch/x86/kernel/cpu/common.c:283:19:
    warning: unused function 'flag_is_changeable_p' [-Wunused-function]

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201116

Thomas, Boris, please pick this minor non-urgent patch.

 arch/x86/kernel/cpu/common.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 35ad8480c464..b89dbc7ccb0c 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -280,10 +280,6 @@ static int __init x86_serial_nr_setup(char *s)
 }
 __setup("serialnumber", x86_serial_nr_setup);
 #else
-static inline int flag_is_changeable_p(u32 flag)
-{
-	return 1;
-}
 static inline void squash_the_stupid_serial_number(struct cpuinfo_x86 *c)
 {
 }
-- 
2.17.1
