From: Vasiliy Kulikov <segooon@gmail.com>
Date: Wed, 27 Oct 2010 15:40:48 +0000
Subject: [PATCH] block: cciss: fix information leak to userland
Message-Id: <1288194048-9233-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Mike Miller <mike.miller@hp.com>, Jens Axboe <jaxboe@fusionio.com>, "Stephen M. Cameron" <scameron@beardog.cce.hp.com>, Andrew Morton <akpm@linux-foundation.org>, iss_storagedev@hp.com, linux-kernel@vger.kernel.org

Structure IOCTL_Command_struct is copied to userland with
some padding fields at the end of the struct unitialized.
It leads to leaking of contents of kernel stack memory.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/block/cciss.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/block/cciss.c b/drivers/block/cciss.c
index f09e6df..13d87a0 100644
--- a/drivers/block/cciss.c
+++ b/drivers/block/cciss.c
@@ -1184,6 +1184,7 @@ static int cciss_ioctl32_big_passthru(struct block_device *bdev, fmode_t mode,
 	int err;
 	u32 cp;
 
+	memset(&arg64, 0, sizeof(arg64));
 	err = 0;
 	err | 	    copy_from_user(&arg64.LUN_info, &arg32->LUN_info,
-- 
1.7.0.4

