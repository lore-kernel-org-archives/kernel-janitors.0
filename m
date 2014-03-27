From: Luis Ortega <luiorpe1@gmail.com>
Date: Thu, 27 Mar 2014 15:19:16 +0000
Subject: [PATCH] x86: Add function prototype for setup_default_timer_irq
Message-Id: <1395937030-2210-1-git-send-email-luiorpe1@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

This eliminates the following warning in arch/x86/kernel/time.c:
arch/x86/kernel/time.c:69:13: warning: no previous prototype for ‘setup_default_timer_irq’ [-Wmissing-prototypes]

Signed-off-by: Luis Ortega <luiorpe1@gmail.com>
---
 arch/x86/include/asm/time.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/time.h b/arch/x86/include/asm/time.h
index 92b8aec..935ceb6 100644
--- a/arch/x86/include/asm/time.h
+++ b/arch/x86/include/asm/time.h
@@ -4,6 +4,7 @@
 #include <linux/clocksource.h>
 #include <asm/mc146818rtc.h>

+extern void setup_default_timer_irq(void);
 extern void hpet_time_init(void);
 extern void time_init(void);

--
1.9.1

