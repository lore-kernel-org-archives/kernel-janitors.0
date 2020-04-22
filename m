From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 22 Apr 2020 02:01:54 +0000
Subject: [PATCH net-next] mac80211_hwsim: use GFP_ATOMIC under spin lock
Message-Id: <20200422020154.112088-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>, Erel Geron <erelx.geron@intel.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

A spin lock is taken here so we should use GFP_ATOMIC.

Fixes: 5d44fe7c9808 ("mac80211_hwsim: add frame transmission support over virtio")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/wireless/mac80211_hwsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mac80211_hwsim.c b/drivers/net/wireless/mac80211_hwsim.c
index 7c4b7c31d07a..0528d4cb4d37 100644
--- a/drivers/net/wireless/mac80211_hwsim.c
+++ b/drivers/net/wireless/mac80211_hwsim.c
@@ -4068,7 +4068,7 @@ static void hwsim_virtio_rx_work(struct work_struct *work)
 	}
 	vq = hwsim_vqs[HWSIM_VQ_RX];
 	sg_init_one(sg, skb->head, skb_end_offset(skb));
-	err = virtqueue_add_inbuf(vq, sg, 1, skb, GFP_KERNEL);
+	err = virtqueue_add_inbuf(vq, sg, 1, skb, GFP_ATOMIC);
 	if (WARN(err, "virtqueue_add_inbuf returned %d\n", err))
 		nlmsg_free(skb);
 	else
