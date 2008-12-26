From: Julia Lawall <julia@diku.dk>
Date: Fri, 26 Dec 2008 07:26:52 +0000
Subject: [PATCH 1/7] arch/arm/plat-s3c24xx: Move a dereference below a NULL
Message-Id: <Pine.LNX.4.64.0812260826240.25450@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ben-linux@fluff.org, linux-arm-kernel@lists.arm.linux.org.uk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If the NULL test is necessary, then the dereference should be moved below
the NULL test.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/).

// <smpl>
@disable is_null@
identifier f;
expression E;
identifier fld;
statement S;
@@

+ if (E = NULL) S
  f(...,E->fld,...);
- if (E = NULL) S

@@
identifier f;
expression E;
identifier fld;
statement S;
@@

+ if (!E) S
  f(...,E->fld,...);
- if (!E) S
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/arm/plat-s3c24xx/dma.c         |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/plat-s3c24xx/dma.c b/arch/arm/plat-s3c24xx/dma.c
index aee2aeb..f95cb02 100644
--- a/arch/arm/plat-s3c24xx/dma.c
+++ b/arch/arm/plat-s3c24xx/dma.c
@@ -227,14 +227,14 @@ s3c2410_dma_loadbuffer(struct s3c2410_dma_chan *chan,
 {
 	unsigned long reload;
 
-	pr_debug("s3c2410_chan_loadbuffer: loading buff %p (0x%08lx,0x%06x)\n",
-		 buf, (unsigned long)buf->data, buf->size);
-
 	if (buf = NULL) {
 		dmawarn("buffer is NULL\n");
 		return -EINVAL;
 	}
 
+	pr_debug("s3c2410_chan_loadbuffer: loading buff %p (0x%08lx,0x%06x)\n",
+		 buf, (unsigned long)buf->data, buf->size);
+
 	/* check the state of the channel before we do anything */
 
 	if (chan->load_state = S3C2410_DMALOAD_1LOADED) {
