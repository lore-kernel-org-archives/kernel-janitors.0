From: Julia Lawall <julia@diku.dk>
Date: Fri, 28 Oct 2011 23:58:16 +0000
Subject: [PATCH 4/5] drivers/media/video/atmel-isi.c: eliminate a null pointer dereference
Message-Id: <1319846297-2985-4-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The variable isi might be null or might be freed at the point of the call
to clk_put.  pclk contains the value that isi->pclk is expected to point to.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
expression E, E1;
identifier f;
statement S1,S2,S3;
@@

if (E = NULL)
{
  ... when != if (E = NULL || ...) S1 else S2
      when != E = E1
*E->f
  ... when any
  return ...;
}
else S3
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/media/video/atmel-isi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/video/atmel-isi.c b/drivers/media/video/atmel-isi.c
index 774715d..a3dafd6 100644
--- a/drivers/media/video/atmel-isi.c
+++ b/drivers/media/video/atmel-isi.c
@@ -1026,7 +1026,7 @@ err_alloc_ctx:
 err_alloc_descriptors:
 	kfree(isi);
 err_alloc_isi:
-	clk_put(isi->pclk);
+	clk_put(pclk);
 
 	return ret;
 }

