From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Thu, 06 Sep 2012 15:23:57 +0000
Subject: [PATCH 4/14] drivers/media/v4l2-core/videobuf2-core.c: fix error return code
Message-Id: <1346945041-26676-10-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, Julia.Lawall@lip6.fr, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

Convert a nonnegative error return code to a negative one, as returned
elsewhere in the function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret@p1 = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}

// </smpl>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/media/v4l2-core/videobuf2-core.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/videobuf2-core.c b/drivers/media/v4l2-core/videobuf2-core.c
index 4da3df6..f6bc240 100644
--- a/drivers/media/v4l2-core/videobuf2-core.c
+++ b/drivers/media/v4l2-core/videobuf2-core.c
@@ -1876,8 +1876,10 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 	 */
 	for (i = 0; i < q->num_buffers; i++) {
 		fileio->bufs[i].vaddr = vb2_plane_vaddr(q->bufs[i], 0);
-		if (fileio->bufs[i].vaddr = NULL)
+		if (fileio->bufs[i].vaddr = NULL) {
+			ret = -EFAULT;
 			goto err_reqbufs;
+		}
 		fileio->bufs[i].size = vb2_plane_size(q->bufs[i], 0);
 	}
 

