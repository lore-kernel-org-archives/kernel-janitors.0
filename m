From: Julia Lawall <julia@diku.dk>
Date: Fri, 12 Aug 2011 11:40:08 +0000
Subject: [PATCH] drivers/media/video/zr364xx.c: add missing cleanup code
Message-Id: <1313149208-7368-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antoine Jacquet <royale@zerezo.com>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-usb@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

It seems just as necessary to free cam->vdev and cam in this error case as
in the next one.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
There is yet another block of error handling code below the call to
zr364xx_board_init, but perhaps no cleanup code is needed in that case,
because that code is currently initializing a lock in cam?

 drivers/media/video/zr364xx.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/video/zr364xx.c b/drivers/media/video/zr364xx.c
index c492846..e78cf94 100644
--- a/drivers/media/video/zr364xx.c
+++ b/drivers/media/video/zr364xx.c
@@ -1638,6 +1638,9 @@ static int zr364xx_probe(struct usb_interface *intf,
 
 	if (!cam->read_endpoint) {
 		dev_err(&intf->dev, "Could not find bulk-in endpoint\n");
+		video_device_release(cam->vdev);
+		kfree(cam);
+		cam = NULL;
 		return -ENOMEM;
 	}
 

