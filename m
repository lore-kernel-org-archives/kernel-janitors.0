From: Nicolas Kaiser <nikai@nikai.net>
Date: Mon, 15 Nov 2010 18:40:28 +0000
Subject: [PATCH] mach-davinci: signedness bug
Message-Id: <20101115194028.30f8b7f0@absol.kitzblitz>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin Hilman <khilman@deeprootsystems.com>
Cc: Sekhar Nori <nsekhar@ti.com>, davinci-linux-open-source@linux.davincidsp.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

aemif_calc_rate() can return a negative error value, so all the
variables that get tested for this value need to be signed.

The maximum bit width of WSETUP(WSETUP_MAX) appears to be 30 bits
(0xf << 26). Using a signed instead of an unsigned integer
shouldn't make a difference here.

Signed-off-by: Nicolas Kaiser <nikai@nikai.net>
---
 arch/arm/mach-davinci/aemif.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-davinci/aemif.c b/arch/arm/mach-davinci/aemif.c
index 9c3f500..1ce70a9 100644
--- a/arch/arm/mach-davinci/aemif.c
+++ b/arch/arm/mach-davinci/aemif.c
@@ -90,7 +90,7 @@ int davinci_aemif_setup_timing(struct davinci_aemif_timing *t,
 					void __iomem *base, unsigned cs)
 {
 	unsigned set, val;
-	unsigned ta, rhold, rstrobe, rsetup, whold, wstrobe, wsetup;
+	int ta, rhold, rstrobe, rsetup, whold, wstrobe, wsetup;
 	unsigned offset = A1CR_OFFSET + cs * 4;
 	struct clk *aemif_clk;
 	unsigned long clkrate;
-- 
1.7.2.2
