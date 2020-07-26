From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 26 Jul 2020 10:58:32 +0000
Subject: [PATCH 7/7] ath: drop unnecessary list_empty
Message-Id: <1595761112-11003-8-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

list_for_each_entry{_safe} is able to handle an empty list.
The only effect of avoiding the loop is not initializing the
index variable.
Drop list_empty tests in cases where these variables are not
used.

Note that list_for_each_entry{_safe} is defined in terms of
list_first_entry, which indicates that it should not be used on an
empty list.  But in list_for_each_entry{_safe}, the element obtained
by list_first_entry is not really accessed, only the address of its
list_head field is compared to the address of the list head, so the
list_first_entry is safe.

The semantic patch that makes this change for the list_for_each_entry
case is as follows: (http://coccinelle.lip6.fr/)

<smpl>
@@
expression x,e;
statement S;
identifier i;
@@

-if (!(list_empty(x)))
   list_for_each_entry(i,x,...) S
 ... when != i
? i = e
</smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/net/wireless/ath/dfs_pattern_detector.c |   15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/dfs_pattern_detector.c b/drivers/net/wireless/ath/dfs_pattern_detector.c
index a274eb0..0813473 100644
--- a/drivers/net/wireless/ath/dfs_pattern_detector.c
+++ b/drivers/net/wireless/ath/dfs_pattern_detector.c
@@ -253,17 +253,15 @@ static void channel_detector_exit(struct dfs_pattern_detector *dpd,
 static void dpd_reset(struct dfs_pattern_detector *dpd)
 {
 	struct channel_detector *cd;
-	if (!list_empty(&dpd->channel_detectors))
-		list_for_each_entry(cd, &dpd->channel_detectors, head)
-			channel_detector_reset(dpd, cd);
+	list_for_each_entry(cd, &dpd->channel_detectors, head)
+		channel_detector_reset(dpd, cd);
 
 }
 static void dpd_exit(struct dfs_pattern_detector *dpd)
 {
 	struct channel_detector *cd, *cd0;
-	if (!list_empty(&dpd->channel_detectors))
-		list_for_each_entry_safe(cd, cd0, &dpd->channel_detectors, head)
-			channel_detector_exit(dpd, cd);
+	list_for_each_entry_safe(cd, cd0, &dpd->channel_detectors, head)
+		channel_detector_exit(dpd, cd);
 	kfree(dpd);
 }
 
@@ -331,9 +329,8 @@ static bool dpd_set_domain(struct dfs_pattern_detector *dpd,
 		return false;
 
 	/* delete all channel detectors for previous DFS domain */
-	if (!list_empty(&dpd->channel_detectors))
-		list_for_each_entry_safe(cd, cd0, &dpd->channel_detectors, head)
-			channel_detector_exit(dpd, cd);
+	list_for_each_entry_safe(cd, cd0, &dpd->channel_detectors, head)
+		channel_detector_exit(dpd, cd);
 	dpd->radar_spec = rt->radar_types;
 	dpd->num_radar_types = rt->num_radar_types;
 
