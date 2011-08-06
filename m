From: Dan Carpenter <error27@gmail.com>
Date: Sat, 06 Aug 2011 14:32:06 +0000
Subject: [patch] iscsi-target: forever loop in iscsit_attach_ooo_cmdsn()
Message-Id: <20110806143206.GF10373@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: Andy Grover <agrover@redhat.com>, Roland Dreier <roland@kernel.org>, Christoph Hellwig <hch@lst.de>, "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>, "open list:TARGET SUBSYSTEM" <target-devel@vger.kernel.org>, kernel-janitors@vger.kernel.org

I was looking through the code for something unrelated and noticed
what looks like a forever loop here.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
I am not familiar with the subsystem and haven't tested this, so
please review carefully.

diff --git a/drivers/target/iscsi/iscsi_target_erl1.c b/drivers/target/iscsi/iscsi_target_erl1.c
index 9806507..c4c68da 100644
--- a/drivers/target/iscsi/iscsi_target_erl1.c
+++ b/drivers/target/iscsi/iscsi_target_erl1.c
@@ -834,7 +834,7 @@ static int iscsit_attach_ooo_cmdsn(
 			 */
 			list_for_each_entry(ooo_tmp, &sess->sess_ooo_cmdsn_list,
 						ooo_list) {
-				while (ooo_tmp->cmdsn < ooo_cmdsn->cmdsn)
+				if (ooo_tmp->cmdsn < ooo_cmdsn->cmdsn)
 					continue;
 
 				list_add(&ooo_cmdsn->ooo_list,
