From: Colin King <colin.king@canonical.com>
Date: Sat, 23 Jun 2018 22:42:08 +0000
Subject: [PATCH] afs: make afs_volume_record_life static and remove afs_volume_gc_delay
Message-Id: <20180623224208.7141-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, linux-afs@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable afs_volume_record_life is local to the source and does not need
to be in global scope, so make it static.  Variable afs_volume_gc_delay
is not referenced at all in the source, it is unused and can be removed.

Cleans up sparse warnings:
symbol 'afs_volume_gc_delay' was not declared. Should it be static?
symbol 'afs_volume_record_life' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/afs/volume.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/afs/volume.c b/fs/afs/volume.c
index 7adcddf02e66..f924ead1c7a1 100644
--- a/fs/afs/volume.c
+++ b/fs/afs/volume.c
@@ -13,8 +13,7 @@
 #include <linux/slab.h>
 #include "internal.h"
 
-unsigned __read_mostly afs_volume_gc_delay = 10;
-unsigned __read_mostly afs_volume_record_life = 60 * 60;
+static unsigned __read_mostly afs_volume_record_life = 60 * 60;
 
 static const char *const afs_voltypes[] = { "R/W", "R/O", "BAK" };
 
-- 
2.17.0

