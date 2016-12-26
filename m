From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Dec 2016 20:53:37 +0000
Subject: [PATCH 8/8] [media] videobuf-dma-sg: Add some spaces for better code readability in videobuf_dma_ini
Message-Id: <fe5fcc82-94d7-51ff-194f-1a4ff9232372@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9268b60d-08ba-c64e-1848-f84679d64f80@users.sourceforge.net>
In-Reply-To: <9268b60d-08ba-c64e-1848-f84679d64f80@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Jan Kara <jack@suse.cz>, Javier Martinez Canillas <javier@osg.samsung.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Lorenzo Stoakes <lstoakes@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Hocko <mhocko@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Dec 2016 21:16:51 +0100

Use space characters at some source code places according to
the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/v4l2-core/videobuf-dma-sg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/videobuf-dma-sg.c b/drivers/media/v4l2-core/videobuf-dma-sg.c
index c8658530da57..9f560373d49d 100644
--- a/drivers/media/v4l2-core/videobuf-dma-sg.c
+++ b/drivers/media/v4l2-core/videobuf-dma-sg.c
@@ -171,10 +171,10 @@ static int videobuf_dma_init_user_locked(struct videobuf_dmabuf *dma,
 	}
 
 	first = (data          & PAGE_MASK) >> PAGE_SHIFT;
-	last  = ((data+size-1) & PAGE_MASK) >> PAGE_SHIFT;
+	last  = ((data + size - 1) & PAGE_MASK) >> PAGE_SHIFT;
 	dma->offset = data & ~PAGE_MASK;
 	dma->size = size;
-	dma->nr_pages = last-first+1;
+	dma->nr_pages = last - first + 1;
 	dma->pages = kmalloc_array(dma->nr_pages,
 				   sizeof(*dma->pages),
 				   GFP_KERNEL);
-- 
2.11.0

