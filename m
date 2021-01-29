From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 29 Jan 2021 04:55:05 +0000
Subject: [PATCH] block: remove typo in kernel-doc of set_disk_ro()
Message-Id: <20210129045505.22743-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org
Cc: Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 52f019d43c22 ("block: add a hard-readonly flag to struct gendisk")
provides some kernel-doc for set_disk_ro(), but introduces a small typo.

Hence, make htmldocs warns on ./block/genhd.c:1441:

  warning: Function parameter or member 'read_only' not described in 'set_disk_ro'
  warning: Excess function parameter 'ready_only' description in 'set_disk_ro'

Remove that typo in the kernel-doc for set_disk_ro().

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Jens, please pick this minor fix on your block-next tree.

 block/genhd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/genhd.c b/block/genhd.c
index d3ef29fbc536..304f8dcc9a9b 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1431,7 +1431,7 @@ static void set_disk_ro_uevent(struct gendisk *gd, int ro)
 /**
  * set_disk_ro - set a gendisk read-only
  * @disk:	gendisk to operate on
- * @ready_only:	%true to set the disk read-only, %false set the disk read/write
+ * @read_only:	%true to set the disk read-only, %false set the disk read/write
  *
  * This function is used to indicate whether a given disk device should have its
  * read-only flag set. set_disk_ro() is typically used by device drivers to
-- 
2.17.1
