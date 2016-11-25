From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Nov 2016 21:28:34 +0000
Subject: [patch] [media] media: ti-vpe: vpdma: fix a timeout loop
Message-Id: <20161125201957.GA30161@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benoit Parrot <bparrot@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The check assumes that we end on zero but actually we end on -1.  Change
the post-op to a pre-op so that we do end on zero.  Techinically now we
only loop 499 times instead of 500 but that's fine.

Fixes: dc12b124353b ("[media] media: ti-vpe: vpdma: Add abort channel desc and cleanup APIs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/platform/ti-vpe/vpdma.c b/drivers/media/platform/ti-vpe/vpdma.c
index 13bfd71..23472e3 100644
--- a/drivers/media/platform/ti-vpe/vpdma.c
+++ b/drivers/media/platform/ti-vpe/vpdma.c
@@ -453,7 +453,7 @@ int vpdma_list_cleanup(struct vpdma_data *vpdma, int list_num,
 	if (ret)
 		return ret;
 
-	while (vpdma_list_busy(vpdma, list_num) && timeout--)
+	while (vpdma_list_busy(vpdma, list_num) && --timeout)
 		;
 
 	if (timeout = 0) {
