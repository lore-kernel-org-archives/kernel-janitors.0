From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 23 Sep 2017 19:46:43 +0000
Subject: [PATCH 3/3] [media] camss-csid: Adjust a null pointer check in two functions
Message-Id: <c9925c93-f3b3-6def-3fe0-83f1531387ad@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <168ff884-7ace-c548-7f90-d4f2910bb337@users.sourceforge.net>
In-Reply-To: <168ff884-7ace-c548-7f90-d4f2910bb337@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Todor Tomov <todor.tomov@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 23 Sep 2017 21:10:02 +0200

The script "checkpatch.pl" pointed information out like the following.

Comparison to NULL could be written "!format"

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/qcom/camss-8x16/camss-csid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss-8x16/camss-csid.c b/drivers/media/platform/qcom/camss-8x16/camss-csid.c
index ffda0fbfe4d8..e546f97fa68c 100644
--- a/drivers/media/platform/qcom/camss-8x16/camss-csid.c
+++ b/drivers/media/platform/qcom/camss-8x16/camss-csid.c
@@ -653,4 +653,4 @@ static int csid_get_format(struct v4l2_subdev *sd,
-	if (format = NULL)
+	if (!format)
 		return -EINVAL;
 
 	fmt->format = *format;
@@ -677,4 +677,4 @@ static int csid_set_format(struct v4l2_subdev *sd,
-	if (format = NULL)
+	if (!format)
 		return -EINVAL;
 
 	csid_try_format(csid, cfg, fmt->pad, &fmt->format, fmt->which);
-- 
2.14.1

