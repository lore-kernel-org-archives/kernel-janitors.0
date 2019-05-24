From: Mathieu Malaterre <malat@debian.org>
Date: Fri, 24 May 2019 10:32:51 +0000
Subject: [PATCH] x86/tsc: Move inline keyword to the beginning of function declarations
Message-Id: <20190524103252.28575-1-malat@debian.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, Mathieu Malaterre <malat@debian.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org

The inline keyword was not at the beginning of the function declarations.
Fix the following warnings triggered when using W=1:

  arch/x86/kernel/tsc.c:62:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
  arch/x86/kernel/tsc.c:79:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]

Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/x86/kernel/tsc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 0b29e58f288e..75a41bddbc9d 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -59,7 +59,7 @@ struct cyc2ns {
 
 static DEFINE_PER_CPU_ALIGNED(struct cyc2ns, cyc2ns);
 
-void __always_inline cyc2ns_read_begin(struct cyc2ns_data *data)
+__always_inline void cyc2ns_read_begin(struct cyc2ns_data *data)
 {
 	int seq, idx;
 
@@ -76,7 +76,7 @@ void __always_inline cyc2ns_read_begin(struct cyc2ns_data *data)
 	} while (unlikely(seq != this_cpu_read(cyc2ns.seq.sequence)));
 }
 
-void __always_inline cyc2ns_read_end(void)
+__always_inline void cyc2ns_read_end(void)
 {
 	preempt_enable_notrace();
 }
-- 
2.20.1
