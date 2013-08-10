From: Cyril Roelandt <tipecaml@gmail.com>
Date: Sat, 10 Aug 2013 00:32:45 +0000
Subject: [PATCH 2/3] staging: ced1401: fix non-ANSI function prototype.
Message-Id: <1376094766-9175-3-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Add "void" to the parameterless function SafeTickCount().

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/staging/ced1401/userspace/use1401.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/ced1401/userspace/use1401.c b/drivers/staging/ced1401/userspace/use1401.c
index c9bc2eb..7f39eb4 100644
--- a/drivers/staging/ced1401/userspace/use1401.c
+++ b/drivers/staging/ced1401/userspace/use1401.c
@@ -376,7 +376,7 @@ static short U14Control1401(short sHand, LONG lCode, TCSBLOCK* pBlk)
 ** SafeTickCount
 ** Gets time in approximately units of a millisecond.
 *****************************************************************************/
-static long SafeTickCount()
+static long SafeTickCount(void)
 {
 #ifdef _IS_WINDOWS_
     return GetTickCount();
-- 
1.8.3.1

