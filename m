From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jul 2020 15:54:15 +0000
Subject: [PATCH] staging: unisys: visorhba: remove redundant initialization of variables scsicmd_id and rc
Message-Id: <20200723155415.994036-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Kershner <david.kershner@unisys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sparmaintainer@unisys.com, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variables scsicmd_id and rc is being initialized with a value
that is never read and are being updated later with a new value.
The initializations are redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/unisys/visorhba/visorhba_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/unisys/visorhba/visorhba_main.c b/drivers/staging/unisys/visorhba/visorhba_main.c
index 99c57ceeb357..7ae5306b92fe 100644
--- a/drivers/staging/unisys/visorhba/visorhba_main.c
+++ b/drivers/staging/unisys/visorhba/visorhba_main.c
@@ -305,7 +305,7 @@ static int forward_taskmgmt_command(enum task_mgmt_types tasktype,
 		(struct visorhba_devdata *)scsidev->host->hostdata;
 	int notifyresult = 0xffff;
 	wait_queue_head_t notifyevent;
-	int scsicmd_id = 0;
+	int scsicmd_id;
 
 	if (devdata->serverdown || devdata->serverchangingstate)
 		return FAILED;
@@ -1186,7 +1186,7 @@ static struct visor_driver visorhba_driver = {
  */
 static int visorhba_init(void)
 {
-	int rc = -ENOMEM;
+	int rc;
 
 	visorhba_debugfs_dir = debugfs_create_dir("visorhba", NULL);
 	if (!visorhba_debugfs_dir)
-- 
2.27.0
