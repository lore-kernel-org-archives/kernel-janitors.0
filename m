From: Dan Carpenter <error27@gmail.com>
Date: Wed, 27 Jul 2011 11:11:43 +0000
Subject: [patch] target: strlen() doesn't count the terminator
Message-Id: <20110727111143.GN3824@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: Andy Grover <agrover@redhat.com>, Roland Dreier <roland@kernel.org>, Christoph Hellwig <hch@lst.de>, "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>, kernel-janitors@vger.kernel.org

This test is off by one because the NUL terminator isn't taken into
consideration.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/target/iscsi/iscsi_target.c b/drivers/target/iscsi/iscsi_target.c
index 494bfa4..4793875 100644
--- a/drivers/target/iscsi/iscsi_target.c
+++ b/drivers/target/iscsi/iscsi_target.c
@@ -120,7 +120,7 @@ struct iscsi_tiqn *iscsit_add_tiqn(unsigned char *buf)
 	struct iscsi_tiqn *tiqn = NULL;
 	int ret;
 
-	if (strlen(buf) > ISCSI_IQN_LEN) {
+	if (strlen(buf) >= ISCSI_IQN_LEN) {
 		pr_err("Target IQN exceeds %d bytes\n",
 				ISCSI_IQN_LEN);
 		return ERR_PTR(-EINVAL);
