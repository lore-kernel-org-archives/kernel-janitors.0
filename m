From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Dec 2020 06:50:34 +0000
Subject: [PATCH 1/2] media: camss: Fix signedness bug in video_enum_fmt()
Message-Id: <X9BzujGgPAM/s+rG@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Foss <robert.foss@linaro.org>, Andrey Konovalov <andrey.konovalov@linaro.org>
Cc: Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This test has a problem because we want to know if "k" is -1 or a
positive value less than "f->index".  But the "f->index" variable is a
u32 so if "k = -1" then -1 gets type promoted to UINT_MAX which is
larger than "f->index".  I've added an explicit test to check for -1.

Fixes: a3d412d4b9f3 ("media: Revert "media: camss: Make use of V4L2_CAP_IO_MC"")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I could equally well have casted "k < (int)f->index" but I feel like
this is more explicit and readable.

 drivers/media/platform/qcom/camss/camss-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index bd9334af1c73..2fa3214775d5 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -579,7 +579,7 @@ static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 			break;
 	}
 
-	if (k < f->index)
+	if (k = -1 || k < f->index)
 		/*
 		 * All the unique pixel formats matching the arguments
 		 * have been enumerated (k >= 0 and f->index > 0), or
-- 
2.29.2
