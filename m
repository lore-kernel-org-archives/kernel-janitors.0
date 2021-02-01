From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 01 Feb 2021 12:26:31 +0000
Subject: [PATCH] media: atomisp: double free in atomisp_alloc_css_stat_bufs()
Message-Id: <YBfzd3XtDl/r9KUC@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org

The "s3a_buf" has already been added to the "&asd->s3a_stats" list
and it gets cleaned up in the error handling code at the end of
the function.  This kfree() leads to a use after free and a double
free.  Delete it.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 2ae50decfc8b..9da82855552d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -948,10 +948,8 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 		dev_dbg(isp->dev, "allocating %d dis buffers\n", count);
 		while (count--) {
 			dis_buf = kzalloc(sizeof(struct atomisp_dis_buf), GFP_KERNEL);
-			if (!dis_buf) {
-				kfree(s3a_buf);
+			if (!dis_buf)
 				goto error;
-			}
 			if (atomisp_css_allocate_stat_buffers(
 				asd, stream_id, NULL, dis_buf, NULL)) {
 				kfree(dis_buf);
-- 
2.29.2
