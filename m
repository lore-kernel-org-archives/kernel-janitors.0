From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Dec 2016 20:51:17 +0000
Subject: [PATCH 6/8] [media] videobuf-dma-sg: Improve a size determination in __videobuf_mmap_mapper()
Message-Id: <4e7808c8-7619-3a95-a7da-0399f6558dfc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9268b60d-08ba-c64e-1848-f84679d64f80@users.sourceforge.net>
In-Reply-To: <9268b60d-08ba-c64e-1848-f84679d64f80@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Jan Kara <jack@suse.cz>, Javier Martinez Canillas <javier@osg.samsung.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Lorenzo Stoakes <lstoakes@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Hocko <mhocko@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Dec 2016 20:56:41 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/v4l2-core/videobuf-dma-sg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/videobuf-dma-sg.c b/drivers/media/v4l2-core/videobuf-dma-sg.c
index d09ddf2e56fe..070ba10bbdbc 100644
--- a/drivers/media/v4l2-core/videobuf-dma-sg.c
+++ b/drivers/media/v4l2-core/videobuf-dma-sg.c
@@ -618,7 +618,7 @@ static int __videobuf_mmap_mapper(struct videobuf_queue *q,
 	last = first;
 
 	/* create mapping + update buffer list */
-	map = kmalloc(sizeof(struct videobuf_mapping), GFP_KERNEL);
+	map = kmalloc(sizeof(*map), GFP_KERNEL);
 	if (!map) {
 		retval = -ENOMEM;
 		goto done;
-- 
2.11.0

