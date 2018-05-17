From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 May 2018 08:58:25 +0000
Subject: [PATCH] media: vivid: potential integer overflow in vidioc_g_edid()
Message-Id: <20180517085825.GA4250@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

If we pick a very large "edid->blocks" value then the "edid->start_block
+ edid->blocks" addition could wrap around.

Fixes: ef834f7836ec ("[media] vivid: add the video capture and output parts")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/platform/vivid/vivid-vid-common.c b/drivers/media/platform/vivid/vivid-vid-common.c
index e5914be0e12d..be531caa2cdf 100644
--- a/drivers/media/platform/vivid/vivid-vid-common.c
+++ b/drivers/media/platform/vivid/vivid-vid-common.c
@@ -860,7 +860,7 @@ int vidioc_g_edid(struct file *file, void *_fh,
 		return -ENODATA;
 	if (edid->start_block >= dev->edid_blocks)
 		return -EINVAL;
-	if (edid->start_block + edid->blocks > dev->edid_blocks)
+	if (edid->blocks > dev->edid_blocks - edid->start_block)
 		edid->blocks = dev->edid_blocks - edid->start_block;
 	if (adap)
 		cec_set_edid_phys_addr(dev->edid, dev->edid_blocks * 128, adap->phys_addr);
