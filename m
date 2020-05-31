From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 31 May 2020 11:00:15 +0000
Subject: [PATCH] arm64: debug: mark a function as __init to save some memory
Message-Id: <20200531110015.598607-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de, paulmck@kernel.org, gregkh@linuxfoundation.org, mhiramat@kernel.org, dianders@chromium.org
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

'debug_monitors_init()' is only called via 'postcore_initcall'.
It can be marked as __init to save a few bytes of memory.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/arm64/kernel/debug-monitors.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index 15e80c876d46..5df49366e9ab 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -130,7 +130,7 @@ static int clear_os_lock(unsigned int cpu)
 	return 0;
 }
 
-static int debug_monitors_init(void)
+static int __init debug_monitors_init(void)
 {
 	return cpuhp_setup_state(CPUHP_AP_ARM64_DEBUG_MONITORS_STARTING,
 				 "arm64/debug_monitors:starting",
-- 
2.25.1
