From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Dec 2016 20:47:17 +0000
Subject: [PATCH 3/8] [media] videobuf-dma-sg: Use kmalloc_array() in videobuf_dma_init_user_locked()
Message-Id: <f02ed3c0-60f5-300c-c767-b3d96816b5ad@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9268b60d-08ba-c64e-1848-f84679d64f80@users.sourceforge.net>
In-Reply-To: <9268b60d-08ba-c64e-1848-f84679d64f80@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Jan Kara <jack@suse.cz>, Javier Martinez Canillas <javier@osg.samsung.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Lorenzo Stoakes <lstoakes@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Hocko <mhocko@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Dec 2016 19:46:56 +0100

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/v4l2-core/videobuf-dma-sg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/videobuf-dma-sg.c b/drivers/media/v4l2-core/videobuf-dma-sg.c
index ba63ca57ed7e..ab3c1f6a2ca1 100644
--- a/drivers/media/v4l2-core/videobuf-dma-sg.c
+++ b/drivers/media/v4l2-core/videobuf-dma-sg.c
@@ -175,7 +175,9 @@ static int videobuf_dma_init_user_locked(struct videobuf_dmabuf *dma,
 	dma->offset = data & ~PAGE_MASK;
 	dma->size = size;
 	dma->nr_pages = last-first+1;
-	dma->pages = kmalloc(dma->nr_pages * sizeof(struct page *), GFP_KERNEL);
+	dma->pages = kmalloc_array(dma->nr_pages,
+				   sizeof(*dma->pages),
+				   GFP_KERNEL);
 	if (NULL = dma->pages)
 		return -ENOMEM;
 
-- 
2.11.0

