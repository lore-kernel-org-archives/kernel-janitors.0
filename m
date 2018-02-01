From: Colin King <colin.king@canonical.com>
Date: Thu, 01 Feb 2018 16:58:42 +0000
Subject: [PATCH] net: jme: remove unused initialization of 'rxdesc'
Message-Id: <20180201165842.21906-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guo-Fu Tseng <cooldavid@cooldavid.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer rxdesc is assigned a value that is never read, it is overwritten
by a new assignment inside a while loop hence the initial assignment
is redundant and can be removed.

Cleans up clang warning:
drivers/net/ethernet/jme.c:1074:17: warning: Value stored to 'rxdesc'
during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/jme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/jme.c b/drivers/net/ethernet/jme.c
index 62d848df26ef..8a165842fa85 100644
--- a/drivers/net/ethernet/jme.c
+++ b/drivers/net/ethernet/jme.c
@@ -1071,7 +1071,7 @@ static int
 jme_process_receive(struct jme_adapter *jme, int limit)
 {
 	struct jme_ring *rxring = &(jme->rxring[0]);
-	struct rxdesc *rxdesc = rxring->desc;
+	struct rxdesc *rxdesc;
 	int i, j, ccnt, desccnt, mask = jme->rx_ring_mask;
 
 	if (unlikely(!atomic_dec_and_test(&jme->rx_cleaning)))
-- 
2.15.1

