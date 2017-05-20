From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 May 2017 19:12:23 +0000
Subject: [PATCH 2/5] fsl_hypervisor: Delete an error message for a failed memory allocation in fsl_hv_open()
Message-Id: <464d533c-d950-b524-8945-c19647059cba@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <38a9b933-4cdc-53e7-0a4c-20f96c57648c@users.sourceforge.net>
In-Reply-To: <38a9b933-4cdc-53e7-0a4c-20f96c57648c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Jan Kara <jack@suse.cz>, Jesper Nilsson <jesper.nilsson@axis.com>, Kumar Gala <galak@kernel.crashing.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Michal Hocko <mhocko@suse.com>, Timur Tabi <timur@freescale.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 May 2017 19:57:52 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/virt/fsl_hypervisor.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/virt/fsl_hypervisor.c b/drivers/virt/fsl_hypervisor.c
index d1df6c6740f1..40c5eb64f39b 100644
--- a/drivers/virt/fsl_hypervisor.c
+++ b/drivers/virt/fsl_hypervisor.c
@@ -663,7 +663,5 @@ static int fsl_hv_open(struct inode *inode, struct file *filp)
-	if (!dbq) {
-		pr_err("fsl-hv: out of memory\n");
+	if (!dbq)
 		return -ENOMEM;
-	}
 
 	spin_lock_init(&dbq->lock);
 	init_waitqueue_head(&dbq->wait);
-- 
2.13.0

