From: Colin King <colin.king@canonical.com>
Date: Thu, 03 May 2018 10:18:07 +0000
Subject: [PATCH] scsi: mptsas: fix spelling mistake: "matchs" -> "matches"
Message-Id: <20180503101807.30482-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sathya Prakash <sathya.prakash@broadcom.com>, Chaitra P B <chaitra.basappa@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in warning message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/message/fusion/mptsas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/message/fusion/mptsas.c b/drivers/message/fusion/mptsas.c
index 86503f60468f..9a21ce6ee7d0 100644
--- a/drivers/message/fusion/mptsas.c
+++ b/drivers/message/fusion/mptsas.c
@@ -4320,7 +4320,7 @@ mptsas_hotplug_work(MPT_ADAPTER *ioc, struct fw_event_work *fw_event,
 			if (ioc->raid_data.pIocPg2->RaidVolume[i].VolumeID =
 			    hot_plug_info->id) {
 				printk(MYIOC_s_WARN_FMT "firmware bug: unable "
-				    "to add hidden disk - target_id matchs "
+				    "to add hidden disk - target_id matches "
 				    "volume_id\n", ioc->name);
 				mptsas_free_fw_event(ioc, fw_event);
 				return;
-- 
2.17.0

