From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Jun 2012 09:03:23 +0000
Subject: [patch -resend] sgi-xp: nested calls to spin_lock_irqsave()
Message-Id: <20120627090322.GI31212@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20120627085800.GA3007@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robin Holt <holt@sgi.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Jack Steiner <steiner@sgi.com>

The code here has a nested spin_lock_irqsave().  It's not needed since
IRQs are already disabled and it causes a problem because it means that
IRQs won't be enabled again at the end.  The second call to
spin_lock_irqsave() will overwrite the value of irq_flags and we can't
restore the proper settings.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I have added Jack Steiner to the CC list.  This was originally sent on
Thu, 15 Dec 2011.

diff --git a/drivers/misc/sgi-xp/xpc_uv.c b/drivers/misc/sgi-xp/xpc_uv.c
index 17bbacb..87b251a 100644
--- a/drivers/misc/sgi-xp/xpc_uv.c
+++ b/drivers/misc/sgi-xp/xpc_uv.c
@@ -452,9 +452,9 @@ xpc_handle_activate_mq_msg_uv(struct xpc_partition *part,
 
 		if (msg->activate_gru_mq_desc_gpa ! 		    part_uv->activate_gru_mq_desc_gpa) {
-			spin_lock_irqsave(&part_uv->flags_lock, irq_flags);
+			spin_lock(&part_uv->flags_lock);
 			part_uv->flags &= ~XPC_P_CACHED_ACTIVATE_GRU_MQ_DESC_UV;
-			spin_unlock_irqrestore(&part_uv->flags_lock, irq_flags);
+			spin_unlock(&part_uv->flags_lock);
 			part_uv->activate_gru_mq_desc_gpa  			    msg->activate_gru_mq_desc_gpa;
 		}
