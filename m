From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 03 Dec 2020 08:43:37 +0000
Subject: [PATCH net] rtw88: debug: Fix uninitialized memory in debugfs code
Message-Id: <X8ilOfVz3pf0T5ec@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yan-Hsuan Chuang <tony0620emma@gmail.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, Stanislaw Gruszka <sgruszka@redhat.com>, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

This code does not ensure that the whole buffer is initialized and none
of the callers check for errors so potentially none of the buffer is
initialized.  Add a memset to eliminate this bug.

Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/realtek/rtw88/debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/debug.c b/drivers/net/wireless/realtek/rtw88/debug.c
index 5974a8ef8b34..12efc23bbfcb 100644
--- a/drivers/net/wireless/realtek/rtw88/debug.c
+++ b/drivers/net/wireless/realtek/rtw88/debug.c
@@ -147,6 +147,8 @@ static int rtw_debugfs_copy_from_user(char tmp[], int size,
 {
 	int tmp_len;
 
+	memset(tmp, 0, size);
+
 	if (count < num)
 		return -EFAULT;
 
-- 
2.29.2
