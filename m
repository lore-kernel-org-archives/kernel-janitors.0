From: Dan Carpenter <error27@gmail.com>
Date: Wed, 27 Jul 2011 09:58:17 +0000
Subject: [patch] iscsi-target: NULL dereference on allocation failure
Message-Id: <20110727095817.GM3824@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: Andy Grover <agrover@redhat.com>, Roland Dreier <roland@kernel.org>, Christoph Hellwig <hch@lst.de>, "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>, kernel-janitors@vger.kernel.org

The "goto out" path dereferences "login" which is NULL.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/target/iscsi/iscsi_target_nego.c b/drivers/target/iscsi/iscsi_target_nego.c
index 713a4d2..4d087ac 100644
--- a/drivers/target/iscsi/iscsi_target_nego.c
+++ b/drivers/target/iscsi/iscsi_target_nego.c
@@ -978,7 +978,7 @@ struct iscsi_login *iscsi_target_init_negotiation(
 		pr_err("Unable to allocate memory for struct iscsi_login.\n");
 		iscsit_tx_login_rsp(conn, ISCSI_STATUS_CLS_TARGET_ERR,
 				ISCSI_LOGIN_STATUS_NO_RESOURCES);
-		goto out;
+		return NULL;
 	}
 
 	login->req = kzalloc(ISCSI_HDR_LEN, GFP_KERNEL);
