From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Jun 2014 15:17:00 +0000
Subject: [patch]  MIPS: Bonito64: remove a duplicate define
Message-Id: <20140609151700.GJ9600@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: kernel-janitors@vger.kernel.org, linux-mips@linux-mips.org

BONITO_PCIMEMBASECFG_ADDRMASK was cut and pasted twice so we can delete
the second define.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/mips/include/asm/mips-boards/bonito64.h b/arch/mips/include/asm/mips-boards/bonito64.h
index b2048d1..5368891 100644
--- a/arch/mips/include/asm/mips-boards/bonito64.h
+++ b/arch/mips/include/asm/mips-boards/bonito64.h
@@ -414,7 +414,6 @@ extern unsigned long _pcictrl_bonito_pcicfg;
 
 
 #define BONITO_PCIMEMBASECFG_ADDRMASK(WIN, CFG)	 ((((CFG) & BONITO_PCIMEMBASECFG_MEMBASE##WIN##_MASK) >> BONITO_PCIMEMBASECFG_MEMBASE##WIN##_MASK_SHIFT) << BONITO_PCIMEMBASECFG_ASHIFT)
-#define BONITO_PCIMEMBASECFG_ADDRMASK(WIN, CFG)	 ((((CFG) & BONITO_PCIMEMBASECFG_MEMBASE##WIN##_MASK) >> BONITO_PCIMEMBASECFG_MEMBASE##WIN##_MASK_SHIFT) << BONITO_PCIMEMBASECFG_ASHIFT)
 #define BONITO_PCIMEMBASECFG_ADDRTRANS(WIN, CFG) ((((CFG) & BONITO_PCIMEMBASECFG_MEMBASE##WIN##_TRANS) >> BONITO_PCIMEMBASECFG_MEMBASE##WIN##_TRANS_SHIFT) << BONITO_PCIMEMBASECFG_ASHIFT)
 
 #define BONITO_PCITOPHYS(WIN, ADDR, CFG)	  ( \
