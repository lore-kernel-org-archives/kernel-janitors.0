From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 12 Dec 2015 14:40:28 +0000
Subject: [PATCH 3/7] iscsi-target: Delete an unnecessary variable initialisation in iscsi_create_default_para
Message-Id: <566C31DC.4090000@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <566C2F7B.6030704@users.sourceforge.net>
In-Reply-To: <566C2F7B.6030704@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 12 Dec 2015 13:20:08 +0100

The variable "param" will eventually be set to an appropriate pointer
from a call of the iscsi_set_default_param() function.
Thus let us omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/target/iscsi/iscsi_target_parameters.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/target/iscsi/iscsi_target_parameters.c b/drivers/target/iscsi/iscsi_target_parameters.c
index 15b2618..e0b173d 100644
--- a/drivers/target/iscsi/iscsi_target_parameters.c
+++ b/drivers/target/iscsi/iscsi_target_parameters.c
@@ -199,7 +199,7 @@ free_param:
 /* #warning Add extension keys */
 int iscsi_create_default_params(struct iscsi_param_list **param_list_ptr)
 {
-	struct iscsi_param *param = NULL;
+	struct iscsi_param *param;
 	struct iscsi_param_list *pl;
 
 	pl = kzalloc(sizeof(struct iscsi_param_list), GFP_KERNEL);
-- 
2.6.3

