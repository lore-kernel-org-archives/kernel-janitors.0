From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 04 Sep 2019 13:58:53 +0000
Subject: [PATCH] rtlwifi: Fix file release memory leak
Message-Id: <20190904141611.4780-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

When using single_open() for opening, single_release() should be
used instead of seq_release(), otherwise there is a memory leak.

This is detected by Coccinelle semantic patch.

Fixes: 610247f46feb ("rtlwifi: Improve debugging by using debugfs")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/wireless/realtek/rtlwifi/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/debug.c b/drivers/net/wireless/realtek/rtlwifi/debug.c
index a051de16284d..55db71c766fe 100644
--- a/drivers/net/wireless/realtek/rtlwifi/debug.c
+++ b/drivers/net/wireless/realtek/rtlwifi/debug.c
@@ -88,7 +88,7 @@ static const struct file_operations file_ops_common = {
 	.open = dl_debug_open_common,
 	.read = seq_read,
 	.llseek = seq_lseek,
-	.release = seq_release,
+	.release = single_release,
 };
 
 static int rtl_debug_get_mac_page(struct seq_file *m, void *v)
