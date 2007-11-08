From: Jiri Olsa <olsajiri@gmail.com>
Date: Thu, 08 Nov 2007 15:01:23 +0000
Subject: [PATCH] BLACKFIN - remove dead config symbol from BLACKFIN code
Message-Id: <473324C3.2080807@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

remove dead config symbols from BLACKFIN code
Signed-off-by: Jiri Olsa <olsajiri@gmail.com>

---
 include/asm-blackfin/mach-bf527/mem_init.h |    9 +--------
 include/asm-blackfin/mach-bf537/mem_init.h |    9 +--------
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/include/asm-blackfin/mach-bf527/mem_init.h b/include/asm-blackfin/mach-bf527/mem_init.h
index 008ca66..60d71f7 100644
--- a/include/asm-blackfin/mach-bf527/mem_init.h
+++ b/include/asm-blackfin/mach-bf527/mem_init.h
@@ -29,7 +29,7 @@
  * 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
  */
 
-#if (CONFIG_MEM_MT48LC16M16A2TG_75 || CONFIG_MEM_MT48LC64M4A2FB_7E || CONFIG_MEM_MT48LC16M8A2TG_75 || CONFIG_MEM_GENERIC_BOARD || CONFIG_MEM_MT48LC32M8A2_75 || CONFIG_MEM_MT48LC32M16A2TG_75)
+#if (CONFIG_MEM_MT48LC16M16A2TG_75 || CONFIG_MEM_MT48LC64M4A2FB_7E || CONFIG_MEM_GENERIC_BOARD || CONFIG_MEM_MT48LC32M8A2_75 || CONFIG_MEM_MT48LC32M16A2TG_75)
 #if (CONFIG_SCLK_HZ > 119402985)
 #define SDRAM_tRP       TRP_2
 #define SDRAM_tRP_num   2
@@ -111,13 +111,6 @@
 #define SDRAM_CL    CL_3
 #endif
 
-#if (CONFIG_MEM_MT48LC16M8A2TG_75)
-  /*SDRAM INFORMATION: */
-#define SDRAM_Tref  64		/* Refresh period in milliseconds   */
-#define SDRAM_NRA   4096	/* Number of row addresses in SDRAM */
-#define SDRAM_CL    CL_3
-#endif
-
 #if (CONFIG_MEM_MT48LC32M8A2_75)
   /*SDRAM INFORMATION: */
 #define SDRAM_Tref  64		/* Refresh period in milliseconds   */
diff --git a/include/asm-blackfin/mach-bf537/mem_init.h b/include/asm-blackfin/mach-bf537/mem_init.h
index 9ad979d..a06c1d3 100644
--- a/include/asm-blackfin/mach-bf537/mem_init.h
+++ b/include/asm-blackfin/mach-bf537/mem_init.h
@@ -29,7 +29,7 @@
  * 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
  */
 
-#if (CONFIG_MEM_MT48LC16M16A2TG_75 || CONFIG_MEM_MT48LC64M4A2FB_7E || CONFIG_MEM_MT48LC16M8A2TG_75 || CONFIG_MEM_GENERIC_BOARD || CONFIG_MEM_MT48LC32M8A2_75)
+#if (CONFIG_MEM_MT48LC16M16A2TG_75 || CONFIG_MEM_MT48LC64M4A2FB_7E || CONFIG_MEM_GENERIC_BOARD || CONFIG_MEM_MT48LC32M8A2_75)
 #if (CONFIG_SCLK_HZ > 119402985)
 #define SDRAM_tRP       TRP_2
 #define SDRAM_tRP_num   2
@@ -111,13 +111,6 @@
 #define SDRAM_CL    CL_3
 #endif
 
-#if (CONFIG_MEM_MT48LC16M8A2TG_75)
-  /*SDRAM INFORMATION: */
-#define SDRAM_Tref  64		/* Refresh period in milliseconds   */
-#define SDRAM_NRA   4096	/* Number of row addresses in SDRAM */
-#define SDRAM_CL    CL_3
-#endif
-
 #if (CONFIG_MEM_MT48LC32M8A2_75)
   /*SDRAM INFORMATION: */
 #define SDRAM_Tref  64		/* Refresh period in milliseconds   */
