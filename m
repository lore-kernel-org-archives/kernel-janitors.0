From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Tue, 21 Mar 2017 02:12:27 +0000
Subject: [PATCH 2/4 V2] staging: atomisp: simplify if statement in atomisp_get_sensor_fps()
Message-Id: <20170321021227.GA1586@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@kernel.org
Cc: gregkh@linuxfoundation.org, daeseok.youn@gmail.com, alan@linux.intel.com, dan.carpenter@oracle.com, singhalsimran0@gmail.com, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, wharms@bfs.de

If v4l2_subdev_call() gets the global frame interval values,
it returned 0 and it could be checked whether numerator is zero or not.

If the numerator is not zero, the fps could be calculated in this function.
If not, it just returns 0.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
V2: split error handling, the first check is for the result from v4l2_subdev_call(),
    another check is for fi.interval.numerator > 0. it is more understandable and
    simpler than before.

 .../media/atomisp/pci/atomisp2/atomisp_cmd.c       | 24 ++++++++++------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c
index 8bdb224..811331d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c
@@ -153,21 +153,19 @@ struct atomisp_acc_pipe *atomisp_to_acc_pipe(struct video_device *dev)
 
 static unsigned short atomisp_get_sensor_fps(struct atomisp_sub_device *asd)
 {
-	struct v4l2_subdev_frame_interval frame_interval;
+	struct v4l2_subdev_frame_interval fi;
 	struct atomisp_device *isp = asd->isp;
-	unsigned short fps;
 
-	if (v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-	    video, g_frame_interval, &frame_interval)) {
-		fps = 0;
-	} else {
-		if (frame_interval.interval.numerator)
-			fps = frame_interval.interval.denominator /
-			    frame_interval.interval.numerator;
-		else
-			fps = 0;
-	}
-	return fps;
+	int ret;
+
+	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
+			       video, g_frame_interval, &fi);
+
+	if (ret)
+		return 0;
+
+	return (fi.interval.numerator > 0) ?
+	       (fi.interval.denominator / fi.interval.numerator) : 0;
 }
 
 /*
-- 
1.9.1

