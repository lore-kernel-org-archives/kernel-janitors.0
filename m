From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 16 Apr 2013 07:51:28 +0000
Subject: [patch] ath9k: use GFP_ATOMIC under spinlock
Message-Id: <20130416075128.GB1571@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Luis R. Rodriguez" <mcgrof@qca.qualcomm.com>
Cc: Jouni Malinen <jouni@qca.qualcomm.com>, Vasanthakumar Thiagarajan <vthiagar@qca.qualcomm.com>, Senthil Balasubramanian <senthilb@qca.qualcomm.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, ath9k-devel@venema.h4ckr.net, kernel-janitors@vger.kernel.org

This is called with spinlocks held so we have to use GFP_ATOMIC.  It's
the sc_pcu_lock in ath9k_stop() that's the issue.  The call tree looks
like this:

ath9k_stop()
ath_prepare_reset()
ath_stoprecv()
ath_flushrecv()
ath_rx_tasklet()
ath9k_dfs_process_phyerr()
pd->add_pulse() => dpd_add_pulse()
channel_detector_get()
channel_detector_create()
pri_detector_init()

channel_detector_create() uses GFP_ATOMIC as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis stuff.  I haven't tested this but it looks like a real
bug to me.

diff --git a/drivers/net/wireless/ath/ath9k/dfs_pri_detector.c b/drivers/net/wireless/ath/ath9k/dfs_pri_detector.c
index 5e48c55..e056c73 100644
--- a/drivers/net/wireless/ath/ath9k/dfs_pri_detector.c
+++ b/drivers/net/wireless/ath/ath9k/dfs_pri_detector.c
@@ -434,7 +434,8 @@ struct pri_detector *
 pri_detector_init(const struct radar_detector_specs *rs)
 {
 	struct pri_detector *de;
-	de = kzalloc(sizeof(*de), GFP_KERNEL);
+
+	de = kzalloc(sizeof(*de), GFP_ATOMIC);
 	if (de = NULL)
 		return NULL;
 	de->exit = pri_detector_exit;
