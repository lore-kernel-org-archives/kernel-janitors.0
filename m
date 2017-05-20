From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 May 2017 19:16:45 +0000
Subject: [PATCH 5/5] fsl_hypervisor: Delete error messages for failed memory allocations in ioctl_memcpy()
Message-Id: <b2665375-17e1-6c7d-94c6-d1ff8938bfc3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <38a9b933-4cdc-53e7-0a4c-20f96c57648c@users.sourceforge.net>
In-Reply-To: <38a9b933-4cdc-53e7-0a4c-20f96c57648c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Jan Kara <jack@suse.cz>, Jesper Nilsson <jesper.nilsson@axis.com>, Kumar Gala <galak@kernel.crashing.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Michal Hocko <mhocko@suse.com>, Timur Tabi <timur@freescale.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 May 2017 20:27:23 +0200

Omit two extra messages for memory allocation failures in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/virt/fsl_hypervisor.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/virt/fsl_hypervisor.c b/drivers/virt/fsl_hypervisor.c
index 4031632b8c9d..db07c76f1ff7 100644
--- a/drivers/virt/fsl_hypervisor.c
+++ b/drivers/virt/fsl_hypervisor.c
@@ -227,7 +227,5 @@ static long ioctl_memcpy(struct fsl_hv_ioctl_memcpy __user *p)
-	if (!pages) {
-		pr_debug("fsl-hv: could not allocate page list\n");
+	if (!pages)
 		return -ENOMEM;
-	}
 
 	/*
 	 * sg_list is the list of fh_sg_list objects that we pass to the
@@ -238,5 +236,4 @@ static long ioctl_memcpy(struct fsl_hv_ioctl_memcpy __user *p)
 	if (!sg_list_unaligned) {
-		pr_debug("fsl-hv: could not allocate S/G list\n");
 		ret = -ENOMEM;
 		goto exit;
 	}
-- 
2.13.0

