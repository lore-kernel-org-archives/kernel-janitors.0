From: Robin Holt <holt@sgi.com>
Date: Wed, 27 Jun 2012 13:51:55 +0000
Subject: [patch] sgi-xp: nested calls to spin_lock_irqsave()
Message-Id: <20120627135155.GA3464@sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111215064805.GA2776@elgon.mountain>
In-Reply-To: <20111215064805.GA2776@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Robin Holt <holt@sgi.com>, Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Jack Steiner <steiner@sgi.com>


The code here has a nested spin_lock_irqsave().  It's not needed since
IRQs are already disabled and it causes a problem because it means that
IRQs won't be enabled again at the end.  The second call to
spin_lock_irqsave() will overwrite the value of irq_flags and we can't
restore the proper settings.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Robin Holt <holt@sgi.com>

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
