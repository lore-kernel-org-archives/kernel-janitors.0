From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 May 2017 19:13:47 +0000
Subject: [PATCH 3/5] fsl_hypervisor: Return the success indication only as a constant in fsl_hv_open()
Message-Id: <36267d50-b81b-be17-5050-221d5a560eca@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <38a9b933-4cdc-53e7-0a4c-20f96c57648c@users.sourceforge.net>
In-Reply-To: <38a9b933-4cdc-53e7-0a4c-20f96c57648c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Jan Kara <jack@suse.cz>, Jesper Nilsson <jesper.nilsson@axis.com>, Kumar Gala <galak@kernel.crashing.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Michal Hocko <mhocko@suse.com>, Timur Tabi <timur@freescale.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 May 2017 20:05:19 +0200

* Return a success code without storing it in an intermediate variable.

* Delete the local variable "ret" which became unnecessary with
  this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/virt/fsl_hypervisor.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/virt/fsl_hypervisor.c b/drivers/virt/fsl_hypervisor.c
index 40c5eb64f39b..9e881dc29c6b 100644
--- a/drivers/virt/fsl_hypervisor.c
+++ b/drivers/virt/fsl_hypervisor.c
@@ -657,7 +657,6 @@ static int fsl_hv_open(struct inode *inode, struct file *filp)
 {
 	struct doorbell_queue *dbq;
 	unsigned long flags;
-	int ret = 0;
 
 	dbq = kzalloc(sizeof(*dbq), GFP_KERNEL);
 	if (!dbq)
@@ -671,8 +670,7 @@ static int fsl_hv_open(struct inode *inode, struct file *filp)
 	spin_unlock_irqrestore(&db_list_lock, flags);
 
 	filp->private_data = dbq;
-
-	return ret;
+	return 0;
 }
 
 /*
-- 
2.13.0

