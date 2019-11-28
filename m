From: Colin King <colin.king@canonical.com>
Date: Thu, 28 Nov 2019 13:07:53 +0000
Subject: [PATCH] kdb: remove redundant assignment to pointer bp
Message-Id: <20191128130753.181246-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Wessel <jason.wessel@windriver.com>, Daniel Thompson <daniel.thompson@linaro.org>, Douglas Anderson <dianders@chromium.org>, kgdb-bugreport@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The point bp is assigned a value that is never read, it is being
re-assigned later to bp = &kdb_breakpoints[lowbp] in a for-loop.
Remove the redundant assignment.

Addresses-Coverity ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/debug/kdb/kdb_bp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_bp.c b/kernel/debug/kdb/kdb_bp.c
index 62c301ad0773..d7ebb2c79cb8 100644
--- a/kernel/debug/kdb/kdb_bp.c
+++ b/kernel/debug/kdb/kdb_bp.c
@@ -412,7 +412,6 @@ static int kdb_bc(int argc, const char **argv)
 		 * assume that the breakpoint number is desired.
 		 */
 		if (addr < KDB_MAXBPT) {
-			bp = &kdb_breakpoints[addr];
 			lowbp = highbp = addr;
 			highbp++;
 		} else {
-- 
2.24.0
