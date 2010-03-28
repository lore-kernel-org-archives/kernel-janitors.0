From: Dan Carpenter <error27@gmail.com>
Date: Sun, 28 Mar 2010 11:21:18 +0000
Subject: [patch] video/au0828: off by one bug
Message-Id: <20100328112118.GI5069@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Devin Heitmueller <dheitmueller@kernellabs.com>, Michael Krufky <mkrufky@linuxtv.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "AUVI_INPUT(tmp)" macro uses "tmp" as an index of an array with
AU0828_MAX_INPUT elements.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/video/au0828/au0828-video.c b/drivers/media/video/au0828/au0828-video.c
index dc67bc4..19a5773 100644
--- a/drivers/media/video/au0828/au0828-video.c
+++ b/drivers/media/video/au0828/au0828-video.c
@@ -1104,7 +1104,7 @@ static int vidioc_enum_input(struct file *file, void *priv,
 
 	tmp = input->index;
 
-	if (tmp > AU0828_MAX_INPUT)
+	if (tmp >= AU0828_MAX_INPUT)
 		return -EINVAL;
 	if (AUVI_INPUT(tmp).type = 0)
 		return -EINVAL;
