From: Colin King <colin.king@canonical.com>
Date: Wed, 19 Jun 2019 18:14:46 +0000
Subject: [PATCH][V2] x86/apic: fix integer overflow on 10 bit left shift of cpu_khz
Message-Id: <20190619181446.13635-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The left shift of unsigned int cpu_khz will overflow for large values
of cpu_khz, so cast it to a long long before shifting it to avoid
overvlow.  For example, this can happen when cpu_khz is 4194305 (just
less than 4.2 GHz).  Also wrap line to avoid checkpatch wide line
warning.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: 8c3ba8d04924 ("x86, apic: ack all pending irqs when crashed/on kexec")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/kernel/apic/apic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 8956072f677d..31426126e5e0 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -1464,7 +1464,8 @@ static void apic_pending_intr_clear(void)
 		if (queued) {
 			if (boot_cpu_has(X86_FEATURE_TSC) && cpu_khz) {
 				ntsc = rdtsc();
-				max_loops = (cpu_khz << 10) - (ntsc - tsc);
+				max_loops = ((long long)cpu_khz << 10) -
+					    (ntsc - tsc);
 			} else {
 				max_loops--;
 			}
-- 

V2: replace right with left in commit subject and message. Doh.

--
2.20.1
