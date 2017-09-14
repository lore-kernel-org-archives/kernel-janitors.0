From: Colin King <colin.king@canonical.com>
Date: Thu, 14 Sep 2017 16:01:25 +0000
Subject: [PATCH] tg3: clean up redundant initialization of tnapi
Message-Id: <20170914160125.11007-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Siva Reddy Kallam <siva.kallam@broadcom.com>, Prashant Sreedharan <prashant@broadcom.com>, Michael Chan <mchan@broadcom.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

tnapi is being initialized and then immediately updated and
hence the initialiation is redundant.  Clean up the warning
by moving the declaration and initialization to the inside
of the for-loop.

Cleans up clang scan-build warning:
warning: Value stored to 'tnapi' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/broadcom/tg3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index af33dc15c55f..54588809b867 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -11536,11 +11536,11 @@ static int tg3_start(struct tg3 *tp, bool reset_phy, bool test_irq,
 	tg3_napi_enable(tp);
 
 	for (i = 0; i < tp->irq_cnt; i++) {
-		struct tg3_napi *tnapi = &tp->napi[i];
 		err = tg3_request_irq(tp, i);
 		if (err) {
 			for (i--; i >= 0; i--) {
-				tnapi = &tp->napi[i];
+				struct tg3_napi *tnapi = &tp->napi[i];
+
 				free_irq(tnapi->irq_vec, tnapi);
 			}
 			goto out_napi_fini;
-- 
2.14.1

