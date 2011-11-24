From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2011 07:17:16 +0000
Subject: [patch] uprobes: add_utask() returns an ERR_PTR() not NULL
Message-Id: <20111124071716.GA14122@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Jim Keniston <jkenisto@us.ibm.com>, Ananth N Mavinakayanahalli <ananth@in.ibm.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to check for IS_ERR() here (add_utask() never returns NULL).

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/uprobes.c b/kernel/uprobes.c
index 2493191..3360057 100644
--- a/kernel/uprobes.c
+++ b/kernel/uprobes.c
@@ -1387,8 +1387,10 @@ void uprobe_notify_resume(struct pt_regs *regs)
 		if (!utask) {
 			utask = add_utask();
 			/* Cannot Allocate; re-execute the instruction. */
-			if (!utask)
+			if (IS_ERR(utask)) {
+				utask = NULL;
 				goto cleanup_ret;
+			}
 		}
 		utask->active_uprobe = u;
 		handler_chain(u, regs);
