From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 May 2017 19:14:45 +0000
Subject: [PATCH 4/5] fsl_hypervisor: Use kcalloc() in ioctl_memcpy()
Message-Id: <20c641bb-33af-39ec-9208-cbc560441223@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <38a9b933-4cdc-53e7-0a4c-20f96c57648c@users.sourceforge.net>
In-Reply-To: <38a9b933-4cdc-53e7-0a4c-20f96c57648c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Jan Kara <jack@suse.cz>, Jesper Nilsson <jesper.nilsson@axis.com>, Kumar Gala <galak@kernel.crashing.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Michal Hocko <mhocko@suse.com>, Timur Tabi <timur@freescale.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 May 2017 20:15:57 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/virt/fsl_hypervisor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/fsl_hypervisor.c b/drivers/virt/fsl_hypervisor.c
index 9e881dc29c6b..4031632b8c9d 100644
--- a/drivers/virt/fsl_hypervisor.c
+++ b/drivers/virt/fsl_hypervisor.c
@@ -223,5 +223,5 @@ static long ioctl_memcpy(struct fsl_hv_ioctl_memcpy __user *p)
 	 * 'pages' is an array of struct page pointers that's initialized by
 	 * get_user_pages().
 	 */
-	pages = kzalloc(num_pages * sizeof(struct page *), GFP_KERNEL);
+	pages = kcalloc(num_pages, sizeof(*pages), GFP_KERNEL);
 	if (!pages) {
-- 
2.13.0

