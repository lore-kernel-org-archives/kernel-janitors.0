From: Greg Dietsche <Gregory.Dietsche@cuw.edu>
Date: Thu, 16 Jun 2011 16:42:07 +0000
Subject: [PATCH] m68k: remove unnecessary code
Message-Id: <1308242527-28971-1-git-send-email-Gregory.Dietsche@cuw.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org, kernel-janitors@vger.kernel.org, Greg Dietsche <Gregory.Dietsche@cuw.edu>

remove unnecessary code that matches this coccinelle pattern
	if (...)
		return ret;
	return ret;

Signed-off-by: Greg Dietsche <Gregory.Dietsche@cuw.edu>
---
 arch/m68k/math-emu/fp_log.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/math-emu/fp_log.c b/arch/m68k/math-emu/fp_log.c
index 367ecee..3384a52 100644
--- a/arch/m68k/math-emu/fp_log.c
+++ b/arch/m68k/math-emu/fp_log.c
@@ -105,9 +105,6 @@ fp_fetoxm1(struct fp_ext *dest, struct fp_ext *src)
 
 	fp_monadic_check(dest, src);
 
-	if (IS_ZERO(dest))
-		return dest;
-
 	return dest;
 }
 
-- 
1.7.2.5

