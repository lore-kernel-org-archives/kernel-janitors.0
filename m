From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 Jan 2015 14:42:16 +0000
Subject: [patch] [SCSI] mvumi: return a correct error code
Message-Id: <20150119144216.GC19086@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <JBottomley@parallels.com>
Cc: linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

If kthread_create() fails then this should return an error code but the
current code returns zero instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index 3e6b866..586f72b 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -2477,6 +2477,7 @@ static int mvumi_io_attach(struct mvumi_hba *mhba)
 		dev_err(&mhba->pdev->dev,
 			"failed to create device scan thread\n");
 		mutex_unlock(&mhba->sas_discovery_mutex);
+		ret = PTR_ERR(mhba->dm_thread);
 		goto fail_create_thread;
 	}
 	atomic_set(&mhba->pnp_count, 1);
