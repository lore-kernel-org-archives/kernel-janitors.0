From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Oct 2017 16:20:08 +0000
Subject: [PATCH] [media] radio-raremono: remove redundant initialization of freq
Message-Id: <20171027162008.13749-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable freq is initialized to f->frequency however this value
is never read and freq is later updated; hence the initialization
is redundant and can be removed.

Cleans up clang warning:
drivers/media/radio/radio-raremono.c:257:6: warning: Value stored
to 'freq' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/radio/radio-raremono.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/radio/radio-raremono.c b/drivers/media/radio/radio-raremono.c
index 3c0a22a54113..70a2c86774ce 100644
--- a/drivers/media/radio/radio-raremono.c
+++ b/drivers/media/radio/radio-raremono.c
@@ -254,7 +254,7 @@ static int vidioc_s_frequency(struct file *file, void *priv,
 				const struct v4l2_frequency *f)
 {
 	struct raremono_device *radio = video_drvdata(file);
-	u32 freq = f->frequency;
+	u32 freq;
 	unsigned band;
 
 	if (f->tuner != 0 || f->type != V4L2_TUNER_RADIO)
-- 
2.14.1

