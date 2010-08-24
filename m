From: Julia Lawall <julia@diku.dk>
Date: Tue, 24 Aug 2010 14:38:56 +0000
Subject: [PATCH 2/5] drivers/video/gbefb.c: Eliminate memory leak
Message-Id: <Pine.LNX.4.64.1008241638330.15172@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

This code is preceded by a call to framebuffer_alloc, which allocates
memory, so this memory should be freed before leaving the function in an
error case.  out_release_framebuffer just frees the frame buffer and returns.

A simplified version of the semantic match that finds this problem is:
(http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
local idexpression x;
expression E;
identifier f1;
iterator I;
@@

x = framebuffer_alloc(...);
<... when != x
     when != true (x = NULL || ...)
     when != if (...) { <+...x...+> }
     when != I (...) { <+...x...+> }
(
 x = NULL
|
 x = E
|
 x->f1
)
...>
* return ...;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/video/gbefb.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/video/gbefb.c b/drivers/video/gbefb.c
index ca3355e..933899d 100644
--- a/drivers/video/gbefb.c
+++ b/drivers/video/gbefb.c
@@ -1143,8 +1143,10 @@ static int __devinit gbefb_probe(struct platform_device *p_dev)
 		return -ENOMEM;
 
 #ifndef MODULE
-	if (fb_get_options("gbefb", &options))
-		return -ENODEV;
+	if (fb_get_options("gbefb", &options)) {
+		ret = -ENODEV;
+		goto out_release_framebuffer;
+	}
 	gbefb_setup(options);
 #endif
 
