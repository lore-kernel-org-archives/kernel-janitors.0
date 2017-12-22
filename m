From: Colin King <colin.king@canonical.com>
Date: Fri, 22 Dec 2017 01:07:24 +0000
Subject: [PATCH] slimbus: make functions slim_ack_txn and slim_alloc_txbuf static
Message-Id: <20171222010724.12465-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The functions slim_ack_txn and slim_alloc_txbuf are local to the
source and do not need to be in global scope, so make them static.

Cleans up sparse warnings:
symbol 'slim_ack_txn' was not declared. Should it be static?
symbol 'slim_alloc_txbuf' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/slimbus/qcom-ctrl.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
index 9b7846f1f8c3..f24293a8aea8 100644
--- a/drivers/slimbus/qcom-ctrl.c
+++ b/drivers/slimbus/qcom-ctrl.c
@@ -148,7 +148,7 @@ static void *slim_alloc_rxbuf(struct qcom_slim_ctrl *ctrl)
 	return ctrl->rx.base + (idx * ctrl->rx.sl_sz);
 }
 
-void slim_ack_txn(struct qcom_slim_ctrl *ctrl, int err)
+static void slim_ack_txn(struct qcom_slim_ctrl *ctrl, int err)
 {
 	struct completion *comp;
 	unsigned long flags;
@@ -301,8 +301,9 @@ static int qcom_clk_pause_wakeup(struct slim_controller *sctrl)
 	return 0;
 }
 
-void *slim_alloc_txbuf(struct qcom_slim_ctrl *ctrl, struct slim_msg_txn *txn,
-		       struct completion *done)
+static void *slim_alloc_txbuf(struct qcom_slim_ctrl *ctrl,
+			      struct slim_msg_txn *txn,
+			      struct completion *done)
 {
 	unsigned long flags;
 	int idx;
-- 
2.14.1

