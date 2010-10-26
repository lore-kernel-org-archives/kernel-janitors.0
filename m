From: Julia Lawall <julia@diku.dk>
Date: Tue, 26 Oct 2010 10:25:35 +0000
Subject: [PATCH 6/14] arch/mips/pmc-sierra/yosemite/setup.c: delete double assignment
Message-Id: <1288088743-3725-7-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288088743-3725-1-git-send-email-julia@diku.dk>
In-Reply-To: <1288088743-3725-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: kernel-janitors@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Delete successive assignments to the same location.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression i;
@@

*i = ...;
 i = ...;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
This change also makes the variable cpu_clock_freq be not used in the
current file.  If this is the correct change to plat_time_init, then
perhaps the declaration of that variable should be moved elsewhere, or the
variable should be deleted completely.

 arch/mips/pmc-sierra/yosemite/setup.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/pmc-sierra/yosemite/setup.c b/arch/mips/pmc-sierra/yosemite/setup.c
index 3498ac9..b56a924 100644
--- a/arch/mips/pmc-sierra/yosemite/setup.c
+++ b/arch/mips/pmc-sierra/yosemite/setup.c
@@ -140,8 +140,7 @@ int rtc_mips_set_time(unsigned long tim)
 
 void __init plat_time_init(void)
 {
-	mips_hpt_frequency = cpu_clock_freq / 2;
-mips_hpt_frequency = 33000000 * 3 * 5;
+	mips_hpt_frequency = 33000000 * 3 * 5;
 }
 
 unsigned long ocd_base;

