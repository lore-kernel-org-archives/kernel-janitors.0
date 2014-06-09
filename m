From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Jun 2014 15:18:20 +0000
Subject: [patch] MIPS: mipsreg: remove duplicate MIPS_CONF4_FTLBSETS_SHIFT
Message-Id: <20140609151820.GK9600@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>
Cc: Markos Chandras <markos.chandras@imgtec.com>, John Crispin <blogic@openwrt.org>, Paul Burton <paul.burton@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, linux-mips@linux-mips.org, kernel-janitors@vger.kernel.org

The MIPS_CONF4_FTLBSETS_SHIFT define is cut and pasted twice so we can
remove the second define.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 98e9754..dcc7872 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -630,7 +630,6 @@
 #define MIPS_CONF4_MMUSIZEEXT_SHIFT	(0)
 #define MIPS_CONF4_MMUSIZEEXT	(_ULCAST_(255) << 0)
 #define MIPS_CONF4_FTLBSETS_SHIFT	(0)
-#define MIPS_CONF4_FTLBSETS_SHIFT	(0)
 #define MIPS_CONF4_FTLBSETS	(_ULCAST_(15) << MIPS_CONF4_FTLBSETS_SHIFT)
 #define MIPS_CONF4_FTLBWAYS_SHIFT	(4)
 #define MIPS_CONF4_FTLBWAYS	(_ULCAST_(15) << MIPS_CONF4_FTLBWAYS_SHIFT)
