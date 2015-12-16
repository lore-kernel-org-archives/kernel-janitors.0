From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Dec 2015 11:10:00 +0000
Subject: [patch] wil6210: fix a warning message condition
Message-Id: <20151216111000.GC21018@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maya Erez <qca_merez@qca.qualcomm.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, wil6210@qca.qualcomm.com, kernel-janitors@vger.kernel.org

"iter" is -1 at the end of the loop and not zero.  It means we don't
print a warning message.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/ath/wil6210/main.c b/drivers/net/wireless/ath/wil6210/main.c
index 48687f1..4544e8c 100644
--- a/drivers/net/wireless/ath/wil6210/main.c
+++ b/drivers/net/wireless/ath/wil6210/main.c
@@ -985,7 +985,7 @@ int __wil_down(struct wil6210_priv *wil)
 	}
 	mutex_lock(&wil->mutex);
 
-	if (!iter)
+	if (iter < 0)
 		wil_err(wil, "timeout waiting for idle FW/HW\n");
 
 	wil_reset(wil, false);
