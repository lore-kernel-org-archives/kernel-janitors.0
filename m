From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 27 Feb 2020 07:05:02 +0000
Subject: [PATCH -next] MIPS: pic32mzda: Drop pointless static qualifier
Message-Id: <20200227070502.106762-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ralf@linux-mips.org, paulburton@kernel.org, tglx@linutronix.de, sboyd@kernel.org, geert+renesas@glider.be, f4bug@amsat.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is no need to have the 'struct device_node *node' variable static
since new value always be assigned before use it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/mips/pic32/pic32mzda/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/pic32/pic32mzda/time.c b/arch/mips/pic32/pic32mzda/time.c
index 754924f26089..7174e9abbb1b 100644
--- a/arch/mips/pic32/pic32mzda/time.c
+++ b/arch/mips/pic32/pic32mzda/time.c
@@ -23,7 +23,7 @@ static const struct of_device_id pic32_infra_match[] = {
 
 static unsigned int pic32_xlate_core_timer_irq(void)
 {
-	static struct device_node *node;
+	struct device_node *node;
 	unsigned int irq;
 
 	node = of_find_matching_node(NULL, pic32_infra_match);
