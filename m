From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Dec 2016 20:41:19 +0000
Subject: [PATCH 0/8] [media] v4l2-core: Fine-tuning for some function implementations
Message-Id: <9268b60d-08ba-c64e-1848-f84679d64f80@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Jan Kara <jack@suse.cz>, Javier Martinez Canillas <javier@osg.samsung.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Lorenzo Stoakes <lstoakes@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Hocko <mhocko@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Dec 2016 21:30:12 +0100

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (8):
  v4l2-async: Use kmalloc_array() in v4l2_async_notifier_unregister()
  v4l2-async: Delete an error message for a failed memory allocation in v4l2_async_notifier_unregister()
  videobuf-dma-sg: Use kmalloc_array() in videobuf_dma_init_user_locked()
  videobuf-dma-sg: Adjust 24 checks for null values
  videobuf-dma-sg: Move two assignments for error codes in __videobuf_mmap_mapper()
  videobuf-dma-sg: Improve a size determination in __videobuf_mmap_mapper()
  videobuf-dma-sg: Delete an unnecessary return statement in videobuf_vm_close()
  videobuf-dma-sg: Add some spaces for better code readability in videobuf_dma_init_user_locked()

 drivers/media/v4l2-core/v4l2-async.c      |  7 +---
 drivers/media/v4l2-core/videobuf-dma-sg.c | 65 ++++++++++++++++---------------
 2 files changed, 34 insertions(+), 38 deletions(-)

-- 
2.11.0

