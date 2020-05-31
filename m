From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 31 May 2020 09:51:51 +0000
Subject: [PATCH] ARM: smp_twd: mark a function as __init to save some memory
Message-Id: <20200531095151.597393-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@armlinux.org.uk, tglx@linutronix.de, allison@lohutok.net, kstewart@linuxfoundation.org, info@metux.net, gregkh@linuxfoundation.org
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

'twd_clk_init()' is only called via 'core_initcall'.
It can be marked as __init to save a few bytes of memory.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
For the records, this function has been introduced in commit 4fd7f9b12810
("ARM: 7212/1: smp_twd: reconfigure clockevents after cpufreq change")
---
 arch/arm/kernel/smp_twd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/kernel/smp_twd.c b/arch/arm/kernel/smp_twd.c
index 9a14f721a2b0..e0a0b0d820bc 100644
--- a/arch/arm/kernel/smp_twd.c
+++ b/arch/arm/kernel/smp_twd.c
@@ -129,7 +129,7 @@ static struct notifier_block twd_clk_nb = {
 	.notifier_call = twd_rate_change,
 };
 
-static int twd_clk_init(void)
+static int __init twd_clk_init(void)
 {
 	if (twd_evt && raw_cpu_ptr(twd_evt) && !IS_ERR(twd_clk))
 		return clk_notifier_register(twd_clk, &twd_clk_nb);
-- 
2.25.1
