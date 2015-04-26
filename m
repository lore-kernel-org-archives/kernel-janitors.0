From: green@linuxhacker.ru
Date: Sun, 26 Apr 2015 05:14:28 +0000
Subject: [PATCH 1/2] drm/qlx: Fix a memory leak on error path
Message-Id: <1430025269-26243-2-git-send-email-green@linuxhacker.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430025269-26243-1-git-send-email-green@linuxhacker.ru>
In-Reply-To: <1430025269-26243-1-git-send-email-green@linuxhacker.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Oleg Drokin <green@linuxhacker.ru>

From: Oleg Drokin <green@linuxhacker.ru>

shadow allocation could be leaked if framebuffer allocation failed,
so need to free it.
Also added handling for shadow allocation failure itself instead
of causing a crash.

Found with smatch.

Signed-off-by: Oleg Drokin <green@linuxhacker.ru>
---
 drivers/gpu/drm/qxl/qxl_fb.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_fb.c b/drivers/gpu/drm/qxl/qxl_fb.c
index f778c0e..2a88eae 100644
--- a/drivers/gpu/drm/qxl/qxl_fb.c
+++ b/drivers/gpu/drm/qxl/qxl_fb.c
@@ -526,8 +526,10 @@ static int qxlfb_create(struct qxl_fbdev *qfbdev,
 		 mode_cmd.height, mode_cmd.pitches[0]);
 
 	shadow = vmalloc(mode_cmd.pitches[0] * mode_cmd.height);
-	/* TODO: what's the usual response to memory allocation errors? */
-	BUG_ON(!shadow);
+	if (!shadow) {
+		ret = -ENOMEM;
+		goto out_unref;
+	}
 	QXL_INFO(qdev,
 	"surface0 at gpu offset %lld, mmap_offset %lld (virt %p, shadow %p)\n",
 		 qxl_bo_gpu_offset(qbo),
@@ -538,6 +540,7 @@ static int qxlfb_create(struct qxl_fbdev *qfbdev,
 
 	info = framebuffer_alloc(0, device);
 	if (info = NULL) {
+		vfree(shadow);
 		ret = -ENOMEM;
 		goto out_unref;
 	}
-- 
2.1.0

