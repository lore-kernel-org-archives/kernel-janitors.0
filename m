From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 20 Dec 2018 02:20:53 +0000
Subject: [PATCH -next] scsi: qedi: Remove set but not used variables 'cdev, udev'
Message-Id: <1545272453-6665-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/qedi/qedi_iscsi.c: In function 'qedi_ep_connect':
drivers/scsi/qedi/qedi_iscsi.c:813:23: warning:
 variable 'udev' set but not used [-Wunused-but-set-variable]

drivers/scsi/qedi/qedi_iscsi.c:812:18: warning:
 variable 'cdev' set but not used [-Wunused-but-set-variable]
 
 It never used since intruction.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/qedi/qedi_iscsi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/scsi/qedi/qedi_iscsi.c b/drivers/scsi/qedi/qedi_iscsi.c
index 4da660c..704ed0e 100644
--- a/drivers/scsi/qedi/qedi_iscsi.c
+++ b/drivers/scsi/qedi/qedi_iscsi.c
@@ -809,8 +809,6 @@ static int qedi_task_xmit(struct iscsi_task *task)
 	struct qedi_endpoint *qedi_ep;
 	struct sockaddr_in *addr;
 	struct sockaddr_in6 *addr6;
-	struct qed_dev *cdev  =  NULL;
-	struct qedi_uio_dev *udev = NULL;
 	struct iscsi_path path_req;
 	u32 msg_type = ISCSI_KEVENT_IF_DOWN;
 	u32 iscsi_cid = QEDI_CID_RESERVED;
@@ -830,8 +828,6 @@ static int qedi_task_xmit(struct iscsi_task *task)
 	}
 
 	qedi = iscsi_host_priv(shost);
-	cdev = qedi->cdev;
-	udev = qedi->udev;
 
 	if (test_bit(QEDI_IN_OFFLINE, &qedi->flags) ||
 	    test_bit(QEDI_IN_RECOVERY, &qedi->flags)) {
