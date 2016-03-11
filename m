From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Mar 2016 10:17:56 +0000
Subject: [patch] scsi_dh_alua: uninitialized variable in alua_check_vpd()
Message-Id: <20160311101756.GA9384@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <JBottomley@odin.com>, Hannes Reinecke <hare@suse.de>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Bart Van Assche <bart.vanassche@sandisk.com>, Johannes Thumshirn <jthumshirn@suse.de>, Ewan Milne <emilne@redhat.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The pg_updated variable is support to be set to zero at the start but
it is uninitialized.

Fixes: cb0a168cb6b8 ('scsi_dh_alua: update 'access_state' field')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/device_handler/scsi_dh_alua.c b/drivers/scsi/device_handler/scsi_dh_alua.c
index 5bcdf8d..e4f6174 100644
--- a/drivers/scsi/device_handler/scsi_dh_alua.c
+++ b/drivers/scsi/device_handler/scsi_dh_alua.c
@@ -332,7 +332,7 @@ static int alua_check_vpd(struct scsi_device *sdev, struct alua_dh_data *h,
 {
 	int rel_port = -1, group_id;
 	struct alua_port_group *pg, *old_pg = NULL;
-	bool pg_updated;
+	bool pg_updated = 0;
 	unsigned long flags;
 
 	group_id = scsi_vpd_tpg_id(sdev, &rel_port);
