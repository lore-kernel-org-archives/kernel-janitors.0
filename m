From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 May 2017 19:10:39 +0000
Subject: [PATCH 1/5] fsl_hypervisor: Improve a size determination in fsl_hv_open()
Message-Id: <b871da4b-e86d-93b2-859a-4fb6c938075a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <38a9b933-4cdc-53e7-0a4c-20f96c57648c@users.sourceforge.net>
In-Reply-To: <38a9b933-4cdc-53e7-0a4c-20f96c57648c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Jan Kara <jack@suse.cz>, Jesper Nilsson <jesper.nilsson@axis.com>, Kumar Gala <galak@kernel.crashing.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Michal Hocko <mhocko@suse.com>, Timur Tabi <timur@freescale.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 May 2017 19:52:38 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/virt/fsl_hypervisor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/fsl_hypervisor.c b/drivers/virt/fsl_hypervisor.c
index d3eca879a0a8..d1df6c6740f1 100644
--- a/drivers/virt/fsl_hypervisor.c
+++ b/drivers/virt/fsl_hypervisor.c
@@ -659,5 +659,5 @@ static int fsl_hv_open(struct inode *inode, struct file *filp)
 	unsigned long flags;
 	int ret = 0;
 
-	dbq = kzalloc(sizeof(struct doorbell_queue), GFP_KERNEL);
+	dbq = kzalloc(sizeof(*dbq), GFP_KERNEL);
 	if (!dbq) {
-- 
2.13.0

