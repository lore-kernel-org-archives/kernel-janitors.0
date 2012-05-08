From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 08 May 2012 10:28:59 +0000
Subject: [patch] target: lock => unlock typo
Message-Id: <20120508102858.GA21528@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, Christoph Hellwig <hch@infradead.org>
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

target_stop_cmd() returns with the lock held and IRQs disabled.  The
intent was to unlock here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/target/target_core_transport.c b/drivers/target/target_core_transport.c
index 0d838ab..8bd9ffe 100644
--- a/drivers/target/target_core_transport.c
+++ b/drivers/target/target_core_transport.c
@@ -3769,7 +3769,7 @@ static int transport_lun_wait_for_tasks(struct se_cmd *cmd, struct se_lun *lun)
 	    (cmd->transport_state & CMD_T_SENT)) {
 		if (!target_stop_cmd(cmd, &flags))
 			ret++;
-		spin_lock_irqsave(&cmd->t_state_lock, flags);
+		spin_unlock_irqrestore(&cmd->t_state_lock, flags);
 	} else {
 		spin_unlock_irqrestore(&cmd->t_state_lock,
 				flags);
