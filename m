From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 04 Dec 2019 01:08:51 +0000
Subject: [PATCH -next] MIPS: Loongson2ef: drop pointless static qualifier in loongson_suspend_enter()
Message-Id: <20191204010851.160284-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jiaxun.yang@flygoat.com, ralf@linux-mips.org, paulburton@kernel.org, jhogan@kernel.org, gregkh@linuxfoundation.org, tglx@linutronix.de, maowenan@huawei.com
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

There is no need to have the 'T *v' variable static
since new value always be assigned before use it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 arch/mips/loongson2ef/common/pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/loongson2ef/common/pm.c b/arch/mips/loongson2ef/common/pm.c
index 11f4cfd581fb..bcb7ae9777cf 100644
--- a/arch/mips/loongson2ef/common/pm.c
+++ b/arch/mips/loongson2ef/common/pm.c
@@ -91,7 +91,7 @@ static inline void stop_perf_counters(void)
 
 static void loongson_suspend_enter(void)
 {
-	static unsigned int cached_cpu_freq;
+	unsigned int cached_cpu_freq;
 
 	/* setup wakeup events via enabling the IRQs */
 	setup_wakeup_events();
-- 
2.20.1
