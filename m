From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Jun 2014 15:18:52 +0000
Subject: [patch] powerpc/cpm: remove duplicate FCC_GFMR_TTX define
Message-Id: <20140609151852.GL9600@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

The FCC_GFMR_TTX define is cut and pasted twice so we can remove the
second instance.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/powerpc/include/asm/cpm2.h b/arch/powerpc/include/asm/cpm2.h
index f42e9ba..7c8608b 100644
--- a/arch/powerpc/include/asm/cpm2.h
+++ b/arch/powerpc/include/asm/cpm2.h
@@ -489,7 +489,6 @@ typedef struct scc_trans {
 #define FCC_GFMR_TCI		((uint)0x20000000)
 #define FCC_GFMR_TRX		((uint)0x10000000)
 #define FCC_GFMR_TTX		((uint)0x08000000)
-#define FCC_GFMR_TTX		((uint)0x08000000)
 #define FCC_GFMR_CDP		((uint)0x04000000)
 #define FCC_GFMR_CTSP		((uint)0x02000000)
 #define FCC_GFMR_CDS		((uint)0x01000000)
