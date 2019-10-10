From: Colin King <colin.king@canonical.com>
Date: Thu, 10 Oct 2019 09:57:48 +0000
Subject: [PATCH][next] staging: wfx: fix spelling mistake "non existant" -> "non-existent"
Message-Id: <20191010095748.17047-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191008082205.19740-1-colin.king@canonical.com>
In-Reply-To: <20191008082205.19740-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/wfx/hif_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wfx/hif_rx.c b/drivers/staging/wfx/hif_rx.c
index 52db02d3aa41..36e171b27ae2 100644
--- a/drivers/staging/wfx/hif_rx.c
+++ b/drivers/staging/wfx/hif_rx.c
@@ -137,7 +137,7 @@ static int hif_receive_indication(struct wfx_dev *wdev, struct hif_msg *hif, voi
 	struct hif_ind_rx *body = buf;
 
 	if (!wvif) {
-		dev_warn(wdev->dev, "ignore rx data for non existant vif %d\n", hif->interface);
+		dev_warn(wdev->dev, "ignore rx data for non-existent vif %d\n", hif->interface);
 		return 0;
 	}
 	skb_pull(skb, sizeof(struct hif_msg) + sizeof(struct hif_ind_rx));
-- 
2.20.1
