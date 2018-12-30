From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 30 Dec 2018 15:53:11 +0000
Subject: [PATCH 4/8] firmware: stratix10-svc: reduce indentation
Message-Id: <1546185195-25676-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1546185195-25676-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1546185195-25676-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

Delete tab aligning a statement with the right hand side of a
preceding assignment rather than the left hand side.

Found with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/firmware/stratix10-svc.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 6e6514825ad0..ec99eed3edea 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -766,12 +766,12 @@ int stratix10_svc_send(struct stratix10_svc_chan *chan, void *msg)
 					      (void *)chan->ctrl,
 					      cpu_to_node(cpu),
 					      "svc_smc_hvc_thread");
-			if (IS_ERR(chan->ctrl->task)) {
-				dev_err(chan->ctrl->dev,
-					"fails to create svc_smc_hvc_thread\n");
-				kfree(p_data);
-				return -EINVAL;
-			}
+		if (IS_ERR(chan->ctrl->task)) {
+			dev_err(chan->ctrl->dev,
+				"fails to create svc_smc_hvc_thread\n");
+			kfree(p_data);
+			return -EINVAL;
+		}
 		kthread_bind(chan->ctrl->task, cpu);
 		wake_up_process(chan->ctrl->task);
 	}
