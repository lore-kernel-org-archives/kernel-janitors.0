From: Colin King <colin.king@canonical.com>
Date: Sun, 25 Nov 2018 23:21:08 +0000
Subject: [PATCH] firestream: fix spelling mistake: "Inititing" -> "Initializing"
Message-Id: <20181125232108.14548-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are spelling mistakes in debug messages, fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/atm/firestream.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/atm/firestream.c b/drivers/atm/firestream.c
index 4e46dc9e41ad..11e1663bdc4d 100644
--- a/drivers/atm/firestream.c
+++ b/drivers/atm/firestream.c
@@ -1410,7 +1410,7 @@ static int init_q(struct fs_dev *dev, struct queue *txq, int queue,
 
 	func_enter ();
 
-	fs_dprintk (FS_DEBUG_INIT, "Inititing queue at %x: %d entries:\n", 
+	fs_dprintk (FS_DEBUG_INIT, "Initializing queue at %x: %d entries:\n",
 		    queue, nentries);
 
 	p = aligned_kmalloc (sz, GFP_KERNEL, 0x10);
@@ -1443,7 +1443,7 @@ static int init_fp(struct fs_dev *dev, struct freepool *fp, int queue,
 {
 	func_enter ();
 
-	fs_dprintk (FS_DEBUG_INIT, "Inititing free pool at %x:\n", queue);
+	fs_dprintk (FS_DEBUG_INIT, "Initializing free pool at %x:\n", queue);
 
 	write_fs (dev, FP_CNF(queue), (bufsize * RBFP_RBS) | RBFP_RBSVAL | RBFP_CME);
 	write_fs (dev, FP_SA(queue),  0);
-- 
2.19.1
