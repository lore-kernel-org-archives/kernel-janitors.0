From: Dan Carpenter <error27@gmail.com>
Date: Mon, 08 Aug 2011 21:45:37 +0000
Subject: [patch] target: precedence error in __transport_stop_task_timer()
Message-Id: <20110808214537.GD7659@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>, "open list:TARGET SUBSYSTEM" <target-devel@vger.kernel.org>, kernel-janitors@vger.kernel.org

'!' has higher precedence than '&' so the original check only returns
if no ->task_flags are set.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/target/target_core_transport.c b/drivers/target/target_core_transport.c
index 8976032..048779c 100644
--- a/drivers/target/target_core_transport.c
+++ b/drivers/target/target_core_transport.c
@@ -2250,7 +2250,7 @@ void __transport_stop_task_timer(struct se_task *task, unsigned long *flags)
 {
 	struct se_cmd *cmd = task->task_se_cmd;
 
-	if (!task->task_flags & TF_RUNNING)
+	if (!(task->task_flags & TF_RUNNING))
 		return;
 
 	task->task_flags |= TF_STOP;
