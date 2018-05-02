From: Colin King <colin.king@canonical.com>
Date: Wed, 02 May 2018 09:12:43 +0000
Subject: [PATCH] scsi: mptfusion: fix spelling mistake: "initators" -> "initiators"
Message-Id: <20180502091243.15175-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sathya Prakash <sathya.prakash@broadcom.com>, Chaitra P B <chaitra.basappa@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in text string

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/message/fusion/mptbase.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/message/fusion/mptbase.c b/drivers/message/fusion/mptbase.c
index 51eb1b027963..72e72f93f0f5 100644
--- a/drivers/message/fusion/mptbase.c
+++ b/drivers/message/fusion/mptbase.c
@@ -7635,7 +7635,7 @@ mpt_display_event_info(MPT_ADAPTER *ioc, EventNotificationReply_t *pEventReply)
 
 		snprintf(evStr, EVENT_DESCR_STR_SZ,
 		    "SAS Initiator Device Table Overflow: max initiators=%02d "
-		    "current initators=%02d",
+		    "current initiators=%02d",
 		    max_init, current_init);
 		break;
 	}
-- 
2.17.0

