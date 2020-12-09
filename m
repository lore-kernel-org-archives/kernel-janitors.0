From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Dec 2020 06:51:30 +0000
Subject: [PATCH 2/2] media: camss: missing error code in msm_video_register()
Message-Id: <X9Bz8pRFNhR2x11I@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <X9BzujGgPAM/s+rG@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Foss <robert.foss@linaro.org>, Todor Tomov <todor.too@gmail.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hansverk@cisco.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This error path returns success but it should return -EINVAL.

Fixes: cba3819d1e93 ("media: camss: Format configuration per hardware version")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/platform/qcom/camss/camss-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 2fa3214775d5..97cea7c4d769 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -961,6 +961,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 			video->nformats = ARRAY_SIZE(formats_rdi_8x96);
 		}
 	} else {
+		ret = -EINVAL;
 		goto error_video_register;
 	}
 
-- 
2.29.2
