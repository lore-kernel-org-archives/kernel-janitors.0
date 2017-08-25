From: Colin King <colin.king@canonical.com>
Date: Fri, 25 Aug 2017 16:32:06 +0000
Subject: [PATCH] x86/platform/intel-mid: make several arrays static, makes code smaller
Message-Id: <20170825163206.23250-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>
Cc: kernel-janitors@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate arrays on the stack, instead make them static .
Makes the object code smaller by 76 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
   4217	   1540	    128	   5885	   16fd	arch/x86/platform/intel-mid/pwr.o

After:
   text	   data	    bss	    dec	    hex	filename
   3981	   1700	    128	   5809	   16b1	arch/x86/platform/intel-mid/pwr.o

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/platform/intel-mid/pwr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/platform/intel-mid/pwr.c b/arch/x86/platform/intel-mid/pwr.c
index ef03852ea6e8..49ec5b94c71f 100644
--- a/arch/x86/platform/intel-mid/pwr.c
+++ b/arch/x86/platform/intel-mid/pwr.c
@@ -444,7 +444,7 @@ static int mid_set_initial_state(struct mid_pwr *pwr, const u32 *states)
 static int pnw_set_initial_state(struct mid_pwr *pwr)
 {
 	/* On Penwell SRAM must stay powered on */
-	const u32 states[] = {
+	static const u32 states[] = {
 		0xf00fffff,		/* PM_SSC(0) */
 		0xffffffff,		/* PM_SSC(1) */
 		0xffffffff,		/* PM_SSC(2) */
@@ -455,7 +455,7 @@ static int pnw_set_initial_state(struct mid_pwr *pwr)
 
 static int tng_set_initial_state(struct mid_pwr *pwr)
 {
-	const u32 states[] = {
+	static const u32 states[] = {
 		0xffffffff,		/* PM_SSC(0) */
 		0xffffffff,		/* PM_SSC(1) */
 		0xffffffff,		/* PM_SSC(2) */
-- 
2.14.1

