From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Feb 2016 11:14:12 +0000
Subject: [patch] [media] usb/cpia2_core: clean up a min_t() cast
Message-Id: <20160209111411.GA23998@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

It makes sense to make the min_t() cast unsigned here since we don't
really want negative sizes.  Making it signed causes a static checker
warning in Smatch.  Smatch knows "fw->size - i" is positive but it
doesn't know that fw->size is less than INT_MAX so in theory casting it
to int might lead to a negative.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/usb/cpia2/cpia2_core.c b/drivers/media/usb/cpia2/cpia2_core.c
index 187012c..0310fd6 100644
--- a/drivers/media/usb/cpia2/cpia2_core.c
+++ b/drivers/media/usb/cpia2/cpia2_core.c
@@ -923,7 +923,7 @@ static int apply_vp_patch(struct camera_data *cam)
 	/* ... followed by the data payload */
 	for (i = 2; i < fw->size; i += 64) {
 		cmd.start = 0x0C; /* Data */
-		cmd.reg_count = min_t(int, 64, fw->size - i);
+		cmd.reg_count = min_t(uint, 64, fw->size - i);
 		memcpy(cmd.buffer.block_data, &fw->data[i], cmd.reg_count);
 		cpia2_send_command(cam, &cmd);
 	}
