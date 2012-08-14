From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 14 Aug 2012 15:49:44 +0000
Subject: [PATCH 1/5] drivers/block/swim3.c: Remove potential NULL dereference
Message-Id: <1344959388-19719-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344959388-19719-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344959388-19719-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

If the NULL test is necessary, the initialization involving a dereference of
the tested value should be moved after the NULL test.

The sematic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
expression E;
identifier i,fld;
statement S;
@@

- T i = E->fld;
+ T i;
  ... when != E
      when != i
  if (E = NULL) S
+ i = E->fld;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/block/swim3.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/block/swim3.c b/drivers/block/swim3.c
index 89ddab1..ffecfef 100644
--- a/drivers/block/swim3.c
+++ b/drivers/block/swim3.c
@@ -1090,10 +1090,11 @@ static const struct block_device_operations floppy_fops = {
 static void swim3_mb_event(struct macio_dev* mdev, int mb_state)
 {
 	struct floppy_state *fs = macio_get_drvdata(mdev);
-	struct swim3 __iomem *sw = fs->swim3;
+	struct swim3 __iomem *sw;
 
 	if (!fs)
 		return;
+	sw = fs->swim3;
 	if (mb_state != MB_FD)
 		return;
 

