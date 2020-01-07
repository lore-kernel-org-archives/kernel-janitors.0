From: Colin King <colin.king@canonical.com>
Date: Tue, 07 Jan 2020 14:02:06 +0000
Subject: [PATCH][next] media: v4l2-core: fix uninitialized structure fields being returned to userspace
Message-Id: <20200107140206.103711-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where v4l2_event_dequeue fails the structure ev is not
being filled and this garbage data from the stack is being copied
to the ev32 structure and being copied back to userspace on the
VIDIOC_DQEVENT_TIME32 ioctl.  Fix this by ensuring the ev structure
is zero'd to ensure uninitialized data is not leaked back.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: 1a6c0b36dd19 ("media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index de926e311348..a376b351135f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -394,7 +394,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 	case VIDIOC_DQEVENT_TIME32: {
 		struct v4l2_event_time32 *ev32 = arg;
-		struct v4l2_event ev;
+		struct v4l2_event ev = { };
 
 		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
 			return -ENOIOCTLCMD;
-- 
2.24.0
