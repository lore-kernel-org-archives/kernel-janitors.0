From: "Andrew F. Davis" <afd@ti.com>
Date: Wed, 16 Oct 2019 18:19:41 +0000
Subject: [PATCH 07/10] [SCSI] Buslogic: Remove unneeded conversions to bool
Message-Id: <20191016181944.25106-4-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191016181944.25106-1-afd@ti.com>
In-Reply-To: <20191016181944.25106-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <trivial@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>

Found with scripts/coccinelle/misc/boolconv.cocci.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/scsi/BusLogic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
index c25e8a54e869..6a0a74e9edc9 100644
--- a/drivers/scsi/BusLogic.c
+++ b/drivers/scsi/BusLogic.c
@@ -2236,7 +2236,7 @@ static bool __init blogic_inquiry(struct blogic_adapter *adapter)
 					"INQUIRE INSTALLED DEVICES ID 0 TO 7");
 		for (tgt_id = 0; tgt_id < 8; tgt_id++)
 			adapter->tgt_flags[tgt_id].tgt_exists -				(installed_devs0to7[tgt_id] != 0 ? true : false);
+				(installed_devs0to7[tgt_id] != 0);
 	}
 	/*
 	   Issue the Inquire Setup Information command.
-- 
2.17.1
