From: Jiri Olsa <olsajiri@gmail.com>
Date: Thu, 08 Nov 2007 13:28:19 +0000
Subject: [PATCH] MIPS - remove dead config symbols from MIPS code
Message-Id: <47330EF3.70002@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mips@linux-mips.org, ralf@linux-mips.org

remove dead config symbols from MIPS code
Signed-off-by: Jiri Olsa <olsajiri@gmail.com>

---
 include/asm-mips/pmc-sierra/msp71xx/msp_regs.h |    4 ----
 include/asm-mips/sibyte/board.h                |    1 -
 include/asm-mips/sibyte/swarm.h                |   12 ------------
 include/asm-mips/sn/addrs.h                    |    2 --
 include/asm-mips/sn/agent.h                    |    4 +---
 include/asm-mips/sn/klconfig.h                 |   18 +-----------------
 6 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/include/asm-mips/pmc-sierra/msp71xx/msp_regs.h b/include/asm-mips/pmc-sierra/msp71xx/msp_regs.h
index 0b56f55..603eb73 100644
--- a/include/asm-mips/pmc-sierra/msp71xx/msp_regs.h
+++ b/include/asm-mips/pmc-sierra/msp71xx/msp_regs.h
@@ -585,11 +585,7 @@
  * UART defines                                                            *
  ***************************************************************************
  */
-#ifndef CONFIG_MSP_FPGA
 #define MSP_BASE_BAUD		25000000
-#else
-#define MSP_BASE_BAUD		6000000
-#endif
 #define MSP_UART_REG_LEN	0x20
 
 /*
diff --git a/include/asm-mips/sibyte/board.h b/include/asm-mips/sibyte/board.h
index da198a1..33028b9 100644
--- a/include/asm-mips/sibyte/board.h
+++ b/include/asm-mips/sibyte/board.h
@@ -20,7 +20,6 @@
 #define _SIBYTE_BOARD_H
 
 #if defined(CONFIG_SIBYTE_SWARM) || defined(CONFIG_SIBYTE_PTSWARM) || \
-    defined(CONFIG_SIBYTE_PT1120) || defined(CONFIG_SIBYTE_PT1125) || \
     defined(CONFIG_SIBYTE_CRHONE) || defined(CONFIG_SIBYTE_CRHINE) || \
     defined(CONFIG_SIBYTE_LITTLESUR)
 #include <asm/sibyte/swarm.h>
diff --git a/include/asm-mips/sibyte/swarm.h b/include/asm-mips/sibyte/swarm.h
index 540865f..86db37e 100644
--- a/include/asm-mips/sibyte/swarm.h
+++ b/include/asm-mips/sibyte/swarm.h
@@ -32,18 +32,6 @@
 #define SIBYTE_HAVE_IDE    1
 #define SIBYTE_DEFAULT_CONSOLE "ttyS0,115200"
 #endif
-#ifdef CONFIG_SIBYTE_PT1120
-#define SIBYTE_BOARD_NAME "PT1120"
-#define SIBYTE_HAVE_PCMCIA 1
-#define SIBYTE_HAVE_IDE    1
-#define SIBYTE_DEFAULT_CONSOLE "ttyS0,115200"
-#endif
-#ifdef CONFIG_SIBYTE_PT1125
-#define SIBYTE_BOARD_NAME "PT1125"
-#define SIBYTE_HAVE_PCMCIA 1
-#define SIBYTE_HAVE_IDE    1
-#define SIBYTE_DEFAULT_CONSOLE "ttyS0,115200"
-#endif
 #ifdef CONFIG_SIBYTE_LITTLESUR
 #define SIBYTE_BOARD_NAME "BCM91250C2 (LittleSur)"
 #define SIBYTE_HAVE_PCMCIA 0
diff --git a/include/asm-mips/sn/addrs.h b/include/asm-mips/sn/addrs.h
index fec9bdd..bef3049 100644
--- a/include/asm-mips/sn/addrs.h
+++ b/include/asm-mips/sn/addrs.h
@@ -19,8 +19,6 @@
 
 #if defined(CONFIG_SGI_IP27)
 #include <asm/sn/sn0/addrs.h>
-#elif defined(CONFIG_SGI_IP35)
-#include <asm/sn/sn1/addrs.h>
 #endif
 
 
diff --git a/include/asm-mips/sn/agent.h b/include/asm-mips/sn/agent.h
index ac4ea85..62ee456 100644
--- a/include/asm-mips/sn/agent.h
+++ b/include/asm-mips/sn/agent.h
@@ -17,9 +17,7 @@
 
 #if defined(CONFIG_SGI_IP27)
 #include <asm/sn/sn0/hub.h>
-#elif defined(CONFIG_SGI_IP35)
-#include <asm/sn/sn1/hub.h>
-#endif	/* !CONFIG_SGI_IP27 && !CONFIG_SGI_IP35 */
+#endif	/* !CONFIG_SGI_IP27 */
 
 /*
  * NIC register macros
diff --git a/include/asm-mips/sn/klconfig.h b/include/asm-mips/sn/klconfig.h
index 96cfd2a..39ddb19 100644
--- a/include/asm-mips/sn/klconfig.h
+++ b/include/asm-mips/sn/klconfig.h
@@ -40,26 +40,10 @@
 //#include <sys/graph.h>
 //#include <sys/xtalk/xbow.h>
 
-#elif defined(CONFIG_SGI_IP35)
-
-#include <asm/sn/sn1/addrs.h>
-#include <sys/sn/router.h>
-#include <sys/graph.h>
-#include <asm/xtalk/xbow.h>
-
-#endif /* !CONFIG_SGI_IP27 && !CONFIG_SGI_IP35 */
-
-#if defined(CONFIG_SGI_IP27) || defined(CONFIG_SGI_IP35)
 #include <asm/sn/agent.h>
 #include <asm/fw/arc/types.h>
 #include <asm/fw/arc/hinv.h>
-#if defined(CONFIG_SGI_IP35)
-// The hack file has to be before vector and after sn0_fru....
-#include <asm/hack.h>
-#include <asm/sn/vector.h>
-#include <asm/xtalk/xtalk.h>
-#endif /* CONFIG_SGI_IP35 */
-#endif /* CONFIG_SGI_IP27 || CONFIG_SGI_IP35 */
+#endif /* CONFIG_SGI_IP27 */
 
 typedef u64  nic_t;
 
