From: Dan Carpenter <error27@gmail.com>
Date: Mon, 20 Dec 2010 12:53:16 +0000
Subject: [patch -next] [media] timblogiw: too large value for strncpy()
Message-Id: <20101220125316.GW1936@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Richard =?iso-8859-1?Q?R=F6jfors?= <richard.rojfors@pelagicore.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This is a copy and paste error.  It should be using sizeof(cap->driver)
instead of sizeof(cap->card).

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/video/timblogiw.c b/drivers/media/video/timblogiw.c
index cf48aa9..ef1b7a5 100644
--- a/drivers/media/video/timblogiw.c
+++ b/drivers/media/video/timblogiw.c
@@ -241,7 +241,7 @@ static int timblogiw_querycap(struct file *file, void  *priv,
 	dev_dbg(&vdev->dev, "%s: Entry\n",  __func__);
 	memset(cap, 0, sizeof(*cap));
 	strncpy(cap->card, TIMBLOGIWIN_NAME, sizeof(cap->card)-1);
-	strncpy(cap->driver, DRIVER_NAME, sizeof(cap->card)-1);
+	strncpy(cap->driver, DRIVER_NAME, sizeof(cap->driver) - 1);
 	strlcpy(cap->bus_info, vdev->name, sizeof(cap->bus_info));
 	cap->version = TIMBLOGIW_VERSION_CODE;
 	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
