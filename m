From: Ben Hutchings <ben@decadent.org.uk>
Date: Wed, 02 Oct 2019 19:06:51 +0000
Subject: [PATCH 3.16 74/87] x86/apic: Fix integer overflow on 10 bit left shift of cpu_khz
Message-Id: <lsq.1570043211.277995732@decadent.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <lsq.1570043210.379046399@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: akpm@linux-foundation.org, Denis Kirjanov <kda@linux-powerpc.org>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Colin Ian King <colin.king@canonical.com>

3.16.75-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Colin Ian King <colin.king@canonical.com>

commit ea136a112d89bade596314a1ae49f748902f4727 upstream.

The left shift of unsigned int cpu_khz will overflow for large values of
cpu_khz, so cast it to a long long before shifting it to avoid overvlow.
For example, this can happen when cpu_khz is 4194305, i.e. ~4.2 GHz.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: 8c3ba8d04924 ("x86, apic: ack all pending irqs when crashed/on kexec")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H . Peter Anvin" <hpa@zytor.com>
Cc: kernel-janitors@vger.kernel.org
Link: https://lkml.kernel.org/r/20190619181446.13635-1-colin.king@canonical.com
[bwh: Backported to 3.16: adjust context]
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 arch/x86/kernel/apic/apic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -1403,7 +1403,8 @@ void setup_local_APIC(void)
 		if (queued) {
 			if (cpu_has_tsc && cpu_khz) {
 				rdtscll(ntsc);
-				max_loops = (cpu_khz << 10) - (ntsc - tsc);
+				max_loops = (long long)cpu_khz << 10;
+				max_loops -= ntsc - tsc;
 			} else
 				max_loops--;
 		}
