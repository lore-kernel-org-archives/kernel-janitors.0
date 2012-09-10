From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Mon, 10 Sep 2012 12:45:54 +0000
Subject: [PATCH] drivers/media/pci/cx25821/cx25821-video-upstream-ch2.c: Replace kmemdup for kstrdup
Message-Id: <1347281154-29515-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347025615-11811-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1347025615-11811-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

Replace kmemdup for kstrdup and cleaning up the code.

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
It depends on the patch http://patchwork.linuxtv.org/patch/14231/

 tmp/cx25821-video-upstream-ch2.c |   27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/media/pci/cx25821/cx25821-video-upstream-ch2.c b/drivers/media/pci/cx25821/cx25821-video-upstream-ch2.c
index 273df94..b663dac 100644
--- a/drivers/media/pci/cx25821/cx25821-video-upstream-ch2.c
+++ b/tmp/cx25821-video-upstream-ch2.c
@@ -707,7 +707,6 @@ int cx25821_vidupstream_init_ch2(struct cx25821_dev *dev, int channel_select,
 	int err = 0;
 	int data_frame_size = 0;
 	int risc_buffer_size = 0;
-	int str_length = 0;
 
 	if (dev->_is_running_ch2) {
 		pr_info("Video Channel is still running so return!\n");
@@ -743,24 +742,16 @@ int cx25821_vidupstream_init_ch2(struct cx25821_dev *dev, int channel_select,
 	risc_buffer_size = dev->_isNTSC_ch2 ?
 		NTSC_RISC_BUF_SIZE : PAL_RISC_BUF_SIZE;
 
-	if (dev->input_filename_ch2) {
-		str_length = strlen(dev->input_filename_ch2);
-		dev->_filename_ch2 = kmemdup(dev->input_filename_ch2,
-					     str_length + 1, GFP_KERNEL);
-
-		if (!dev->_filename_ch2) {
-			err = -ENOENT;
-			goto error;
-		}
-	} else {
-		str_length = strlen(dev->_defaultname_ch2);
-		dev->_filename_ch2 = kmemdup(dev->_defaultname_ch2,
-					     str_length + 1, GFP_KERNEL);
+	if (dev->input_filename_ch2)
+		dev->_filename_ch2 = kstrdup(dev->input_filename_ch2,
+								GFP_KERNEL);
+	else
+		dev->_filename_ch2 = kstrdup(dev->_defaultname_ch2,
+								GFP_KERNEL);
 
-		if (!dev->_filename_ch2) {
-			err = -ENOENT;
-			goto error;
-		}
+	if (!dev->_filename_ch2) {
+		err = -ENOENT;
+		goto error;
 	}
 
 	/* Default if filename is empty string */

