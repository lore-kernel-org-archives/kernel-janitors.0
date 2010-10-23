From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sat, 23 Oct 2010 08:25:11 +0000
Subject: [PATCH 1/2] block: cciss: fix information leak to userland
Message-Id: <1287822311-14783-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Mike Miller <mike.miller@hp.com>, Jens Axboe <jaxboe@fusionio.com>, "Stephen M. Cameron" <scameron@beardog.cce.hp.com>, Andrew Morton <akpm@linux-foundation.org>, iss_storagedev@hp.com, linux-kernel@vger.kernel.org

Structure IOCTL_Command_struct is copied to userland with some
padding fields at the end of the struct unitialized.
It leads to leaking of stack memory.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 drivers/block/cciss.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/block/cciss.c b/drivers/block/cciss.c
index 762a81a..cd08324 100644
--- a/drivers/block/cciss.c
+++ b/drivers/block/cciss.c
@@ -1142,6 +1142,7 @@ static int cciss_ioctl32_passthru(struct block_device *bdev, fmode_t mode,
 	int err;
 	u32 cp;
 
+	memset(&arg64, 0, sizeof(arg64));
 	err = 0;
 	err | 	    copy_from_user(&arg64.LUN_info, &arg32->LUN_info,
-- 
1.7.0.4

