From: Julia Lawall <julia@diku.dk>
Date: Mon, 16 Aug 2010 16:27:47 +0000
Subject: [PATCH 11/16] drivers/media/video: Use available error codes
Message-Id: <Pine.LNX.4.64.1008161827310.19313@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antoine Jacquet <royale@zerezo.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-usb@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Error codes are stored in rc, but the return value is always 0.  Return rc
instead.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
local idexpression x;
constant C;
@@

if (...) { ...
  x = -C
  ... when != x
(
  return <+...x...+>;
|
  return NULL;
|
  return;
|
* return ...;
)
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
This changes the semantics of the function, but currently its return value
is ignored.  Alternatively, the function could be converted to return
nothing.

 drivers/media/video/zr364xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/video/zr364xx.c b/drivers/media/video/zr364xx.c
index a82b5bd..616c61f 100644
--- a/drivers/media/video/zr364xx.c
+++ b/drivers/media/video/zr364xx.c
@@ -572,7 +572,7 @@ static int zr364xx_got_frame(struct zr364xx_camera *cam, int jpgsize)
 	DBG("wakeup [buf/i] [%p/%d]\n", buf, buf->vb.i);
 unlock:
 	spin_unlock_irqrestore(&cam->slock, flags);
-	return 0;
+	return rc;
 }
 
 /* this function moves the usb stream read pipe data
