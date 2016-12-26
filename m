From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Dec 2016 20:50:05 +0000
Subject: [PATCH 5/8] [media] videobuf-dma-sg: Move two assignments for error codes in __videobuf_mmap_mapper(
Message-Id: <acfaf0af-0104-1b47-322e-452900318c0a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9268b60d-08ba-c64e-1848-f84679d64f80@users.sourceforge.net>
In-Reply-To: <9268b60d-08ba-c64e-1848-f84679d64f80@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Jan Kara <jack@suse.cz>, Javier Martinez Canillas <javier@osg.samsung.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Lorenzo Stoakes <lstoakes@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Hocko <mhocko@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Dec 2016 20:48:50 +0100

Move two assignments for the local variable "retval" so that these statements
will only be executed if a previous action failed in this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/v4l2-core/videobuf-dma-sg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/videobuf-dma-sg.c b/drivers/media/v4l2-core/videobuf-dma-sg.c
index 9ccdc11aa016..d09ddf2e56fe 100644
--- a/drivers/media/v4l2-core/videobuf-dma-sg.c
+++ b/drivers/media/v4l2-core/videobuf-dma-sg.c
@@ -596,8 +596,6 @@ static int __videobuf_mmap_mapper(struct videobuf_queue *q,
 	unsigned int first, last, size = 0, i;
 	int retval;
 
-	retval = -EINVAL;
-
 	BUG_ON(!mem);
 	MAGIC_CHECK(mem->magic, MAGIC_SG_MEM);
 
@@ -613,16 +611,18 @@ static int __videobuf_mmap_mapper(struct videobuf_queue *q,
 	if (!size) {
 		dprintk(1, "mmap app bug: offset invalid [offset=0x%lx]\n",
 				(vma->vm_pgoff << PAGE_SHIFT));
+		retval = -EINVAL;
 		goto done;
 	}
 
 	last = first;
 
 	/* create mapping + update buffer list */
-	retval = -ENOMEM;
 	map = kmalloc(sizeof(struct videobuf_mapping), GFP_KERNEL);
-	if (!map)
+	if (!map) {
+		retval = -ENOMEM;
 		goto done;
+	}
 
 	size = 0;
 	for (i = first; i <= last; i++) {
-- 
2.11.0

