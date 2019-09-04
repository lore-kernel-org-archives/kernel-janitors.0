From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 04 Sep 2019 13:58:53 +0000
Subject: [PATCH] rtw88: fix seq_file memory leak
Message-Id: <20190904141601.186107-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yan-Hsuan Chuang <yhchuang@realtek.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

When using single_open(), single_release() should be used instead
of seq_release(), otherwise there is a memory leak.

This is detected by Coccinelle semantic patch.

Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/wireless/realtek/rtw88/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/debug.c b/drivers/net/wireless/realtek/rtw88/debug.c
index f0ae26018f97..a7d45f4d34c4 100644
--- a/drivers/net/wireless/realtek/rtw88/debug.c
+++ b/drivers/net/wireless/realtek/rtw88/debug.c
@@ -76,7 +76,7 @@ static const struct file_operations file_ops_single_r = {
 	.open = rtw_debugfs_single_open_rw,
 	.read = seq_read,
 	.llseek = seq_lseek,
-	.release = seq_release,
+	.release = single_release,
 };
 
 static const struct file_operations file_ops_single_rw = {
