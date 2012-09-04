From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Tue, 04 Sep 2012 16:14:26 +0000
Subject: [PATCH 4/5] drivers/media/platform/vino.c: fix error return code
Message-Id: <1346775269-12191-2-git-send-email-peter.senna@gmail.com>
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
 drivers/media/platform/vino.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/vino.c b/drivers/media/platform/vino.c
index cc9110c..6654a28 100644
--- a/drivers/media/platform/vino.c
+++ b/drivers/media/platform/vino.c
@@ -2061,6 +2061,7 @@ static int vino_capture_next(struct vino_channel_settings *vcs, int start)
 	}
 	if (incoming = 0) {
 		dprintk("vino_capture_next(): no buffers available\n");
+		err = -ENOMEM;
 		goto out;
 	}
 

