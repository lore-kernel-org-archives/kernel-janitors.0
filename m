From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Jul 2018 10:05:32 +0000
Subject: [PATCH] fjes: use currently unused variable my_epid and max_epid
Message-Id: <20180705100532.22277-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variables my_epid and max_epid are currently assigned and not being
used - however, I suspect they were intended to be used in the for-loops
to reduce the dereferencing of hw.  Replace hw->my_epid and hw->max_epid
with these variables.

Cleans up clang warnings:
warning: variable 'my_epid' set but not used [-Wunused-but-set-variable]
variable 'max_epid' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/fjes/fjes_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/fjes/fjes_main.c b/drivers/net/fjes/fjes_main.c
index 750954be5a74..d3eae1239045 100644
--- a/drivers/net/fjes/fjes_main.c
+++ b/drivers/net/fjes/fjes_main.c
@@ -1395,8 +1395,8 @@ static void fjes_watch_unshare_task(struct work_struct *work)
 
 	while ((unshare_watch_bitmask || hw->txrx_stop_req_bit) &&
 	       (wait_time < 3000)) {
-		for (epidx = 0; epidx < hw->max_epid; epidx++) {
-			if (epidx = hw->my_epid)
+		for (epidx = 0; epidx < max_epid; epidx++) {
+			if (epidx = my_epid)
 				continue;
 
 			is_shared = fjes_hw_epid_is_shared(hw->hw_info.share,
@@ -1453,8 +1453,8 @@ static void fjes_watch_unshare_task(struct work_struct *work)
 	}
 
 	if (hw->hw_info.buffer_unshare_reserve_bit) {
-		for (epidx = 0; epidx < hw->max_epid; epidx++) {
-			if (epidx = hw->my_epid)
+		for (epidx = 0; epidx < max_epid; epidx++) {
+			if (epidx = my_epid)
 				continue;
 
 			if (test_bit(epidx,
-- 
2.17.1

