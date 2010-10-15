From: Julia Lawall <julia@diku.dk>
Date: Fri, 15 Oct 2010 12:54:48 +0000
Subject: [PATCH 5/7] drivers/scsi/libsas/sas_ata.c: Return -ENOMEM on memory allocation failure
Message-Id: <1287147610-8041-5-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <James.Bottomley@suse.de>
Cc: kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In this code, 0 is returned on memory allocation failure, even though other
failures return -ENOMEM or other similar values.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression ret;
expression x,e1,e2,e3;
@@

ret = 0
... when != ret = e1
*x = \(kmalloc\|kcalloc\|kzalloc\)(...)
... when != ret = e2
if (x = NULL) { ... when != ret = e3
  return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/scsi/libsas/sas_ata.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff -u -p a/drivers/scsi/libsas/sas_ata.c b/drivers/scsi/libsas/sas_ata.c
--- a/drivers/scsi/libsas/sas_ata.c
+++ b/drivers/scsi/libsas/sas_ata.c
@@ -464,8 +464,10 @@ static int sas_execute_task(struct sas_t
 
 	if (dma_dir != DMA_NONE) {
 		scatter = kzalloc(sizeof(*scatter), GFP_KERNEL);
-		if (!scatter)
+		if (!scatter) {
+			res = -ENOMEM;
 			goto out;
+		}
 
 		sg_init_one(scatter, buffer, size);
 		num_scatter = 1;

