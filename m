From: Julia Lawall <julia@diku.dk>
Date: Wed, 26 May 2010 15:55:25 +0000
Subject: [PATCH 5/17] drivers/media/video/pvrusb2: Add missing mutex_unlock
Message-Id: <Pine.LNX.4.64.1005261755110.23743@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Isely <isely@pobox.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Add a mutex_unlock missing on the error path.  In the other functions in
the same file the locks and unlocks of this mutex appear to be balanced,
so it would seem that the same should hold in this case.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression E1;
@@

* mutex_lock(E1,...);
  <+... when != E1
  if (...) {
    ... when != E1
*   return ...;
  }
  ...+>
* mutex_unlock(E1,...);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/media/video/pvrusb2/pvrusb2-ioread.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/video/pvrusb2/pvrusb2-ioread.c b/drivers/media/video/pvrusb2/pvrusb2-ioread.c
index b482478..bba6115 100644
--- a/drivers/media/video/pvrusb2/pvrusb2-ioread.c
+++ b/drivers/media/video/pvrusb2/pvrusb2-ioread.c
@@ -223,7 +223,10 @@ int pvr2_ioread_setup(struct pvr2_ioread *cp,struct pvr2_stream *sp)
 				   " pvr2_ioread_setup (setup) id=%p",cp);
 			pvr2_stream_kill(sp);
 			ret = pvr2_stream_set_buffer_count(sp,BUFFER_COUNT);
-			if (ret < 0) return ret;
+			if (ret < 0) {
+				mutex_unlock(&cp->mutex);
+				return ret;
+			}
 			for (idx = 0; idx < BUFFER_COUNT; idx++) {
 				bp = pvr2_stream_get_buffer(sp,idx);
 				pvr2_buffer_set_buffer(bp,
