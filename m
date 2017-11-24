From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Nov 2017 13:37:41 +0000
Subject: [PATCH] nfc: st21nfca: use setup_timer instead of init_timer
Message-Id: <20171124133741.32371-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>, linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Use setup_timer function instead of initializing timer with the
function and data fields.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/nfc/st21nfca/se.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/nfc/st21nfca/se.c b/drivers/nfc/st21nfca/se.c
index 3a98563d4a12..eda1b8b0ba1d 100644
--- a/drivers/nfc/st21nfca/se.c
+++ b/drivers/nfc/st21nfca/se.c
@@ -392,15 +392,13 @@ void st21nfca_se_init(struct nfc_hci_dev *hdev)
 
 	init_completion(&info->se_info.req_completion);
 	/* initialize timers */
-	init_timer(&info->se_info.bwi_timer);
-	info->se_info.bwi_timer.data = (unsigned long)info;
-	info->se_info.bwi_timer.function = st21nfca_se_wt_timeout;
+	setup_timer(&info->se_info.bwi_timer, st21nfca_se_wt_timeout,
+		    (unsigned long)info);
 	info->se_info.bwi_active = false;
 
 	init_timer(&info->se_info.se_active_timer);
-	info->se_info.se_active_timer.data = (unsigned long)info;
-	info->se_info.se_active_timer.function = st21nfca_se_activation_timeout;
-	info->se_info.se_active = false;
+	setup_timer(&info->se_info.se_active_timer,
+		    st21nfca_se_activation_timeout, (unsigned long)info);
 
 	info->se_info.count_pipes = 0;
 	info->se_info.expected_pipes = 0;
-- 
2.14.1

