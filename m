From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 28 Sep 2020 10:00:04 +0000
Subject: [PATCH] x86/mm: drop superfluous initialization
Message-Id: <20200928100004.25674-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech, Lukas Bulwahn <lukas.bulwahn@gmail.com>

It is not required to initialize the local variable start in
memory_map_top_down(), as the variable will be initialized in any path
before it is used.

make clang-analyzer on x86_64 tinyconfig reports:

  arch/x86/mm/init.c:612:15: warning: Although the value stored to 'start' \
  is used in the enclosing expression, the value is never actually read \
  from 'start' [clang-analyzer-deadcode.DeadStores]

Compilers will detect this superfluous assignment and optimize that
expression anyway. So, the resulting binary is identical before and after
the change.

Drop this superfluous assignment to make clang-analyzer happy.

No functional change.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on v5.9-rc7 and next-20200925

Dave, Andy, Peter, please pick this minor non-urgent clean-up patch.

I quickly confirmed that the binary did not change with this change to the
source code; the hash of init.o remained the same before and after the change.

So, in my setup:
  md5sum arch/x86/mm/init.o
  b26f6380760f32d2ef2c7525301eebd3  init.o

linux-safety, please verify and validate this change.

 arch/x86/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index c7a47603537f..5632f02146ca 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -609,7 +609,7 @@ static void __init memory_map_top_down(unsigned long map_start,
 	step_size = PMD_SIZE;
 	max_pfn_mapped = 0; /* will get exact value next */
 	min_pfn_mapped = real_end >> PAGE_SHIFT;
-	last_start = start = real_end;
+	last_start = real_end;
 
 	/*
 	 * We start from the top (end of memory) and go to the bottom.
-- 
2.17.1
