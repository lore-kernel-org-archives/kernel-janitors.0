From: Jiri Olsa <olsajiri@gmail.com>
Date: Mon, 05 Nov 2007 20:14:07 +0000
Subject: [PATCH] mm: Removing duplicit #includes
Message-Id: <472F798F.1030004@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removing duplicit #includes for mm/
Signed-off-by: Jiri Olsa <olsajiri@gmail.com>
---
mm/filemap.c  |    1 -
mm/swapfile.c |    1 -
2 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 188cf5f..0b360de 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -28,7 +28,6 @@
#include <linux/backing-dev.h>
#include <linux/pagevec.h>
#include <linux/blkdev.h>
-#include <linux/backing-dev.h>
#include <linux/security.h>
#include <linux/syscalls.h>
#include <linux/cpuset.h>
diff --git a/mm/swapfile.c b/mm/swapfile.c
index f071648..83da158 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1153,7 +1153,6 @@ out:
}

#if 0  /* We don't need this yet */
-#include <linux/backing-dev.h>
int page_queue_congested(struct page *page)
{
        struct backing_dev_info *bdi;

