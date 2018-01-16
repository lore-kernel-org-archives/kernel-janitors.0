From: Colin King <colin.king@canonical.com>
Date: Tue, 16 Jan 2018 19:08:15 +0000
Subject: [PATCH] scsi: mptsas: remove duplicated assignment to pointer head
Message-Id: <20180116190815.20930-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sathya Prakash <sathya.prakash@broadcom.com>, Chaitra P B <chaitra.basappa@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer head is re-assigned the same value twice, so remove the
second redundant assignment.

Cleans up clang warning:
drivers/message/fusion/mptsas.c:1161:20: warning: Value stored to 'head'
during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/message/fusion/mptsas.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/message/fusion/mptsas.c b/drivers/message/fusion/mptsas.c
index 345f6035599e..439ee9c5f535 100644
--- a/drivers/message/fusion/mptsas.c
+++ b/drivers/message/fusion/mptsas.c
@@ -1165,7 +1165,6 @@ mptsas_schedule_target_reset(void *iocp)
 	 * issue target reset to next device in the queue
 	 */
 
-	head = &hd->target_reset_list;
 	if (list_empty(head))
 		return;
 
-- 
2.15.1

