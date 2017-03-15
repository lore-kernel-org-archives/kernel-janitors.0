From: "Andrew F. Davis" <afd@ti.com>
Date: Wed, 15 Mar 2017 16:23:19 +0000
Subject: [PATCH 11/14] [SCSI] Buslogic: Remove unneeded conversions to bool
Message-Id: <20170315162322.12096-11-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Found with scripts/coccinelle/misc/boolconv.cocci.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/scsi/BusLogic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
index c7be7bb37209..fe2b4bfc8be2 100644
--- a/drivers/scsi/BusLogic.c
+++ b/drivers/scsi/BusLogic.c
@@ -2241,7 +2241,7 @@ static bool __init blogic_inquiry(struct blogic_adapter *adapter)
 					"INQUIRE INSTALLED DEVICES ID 0 TO 7");
 		for (tgt_id = 0; tgt_id < 8; tgt_id++)
 			adapter->tgt_flags[tgt_id].tgt_exists -				(installed_devs0to7[tgt_id] != 0 ? true : false);
+				(installed_devs0to7[tgt_id] != 0);
 	}
 	/*
 	   Issue the Inquire Setup Information command.
-- 
2.11.0

