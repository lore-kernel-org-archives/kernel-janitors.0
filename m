From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Jan 2012 09:04:39 +0000
Subject: [patch] [media] cx23885: handle errors from
Message-Id: <20120110090439.GA15570@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Steven Toth <stoth@kernellabs.com>, Mijhail Moreyra <mijhail.moreyra@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The error handling in the original code wasn't complete so static
checkers complained about a potential NULL deference.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Compile tested only.  I don't think there is anything else that needs to
be done before returning, but it would be great if someone could look it
over.

diff --git a/drivers/media/video/cx23885/cx23885-video.c b/drivers/media/video/cx23885/cx23885-video.c
index a01cd11..7ad7b4f 100644
--- a/drivers/media/video/cx23885/cx23885-video.c
+++ b/drivers/media/video/cx23885/cx23885-video.c
@@ -1541,7 +1541,6 @@ static int cx23885_set_freq_via_ops(struct cx23885_dev *dev,
 	struct v4l2_control ctrl;
 	struct videobuf_dvb_frontend *vfe;
 	struct dvb_frontend *fe;
-	int err = 0;
 
 	struct analog_parameters params = {
 		.mode      = V4L2_TUNER_ANALOG_TV,
@@ -1563,8 +1562,10 @@ static int cx23885_set_freq_via_ops(struct cx23885_dev *dev,
 		params.frequency, f->tuner, params.std);
 
 	vfe = videobuf_dvb_get_frontend(&dev->ts2.frontends, 1);
-	if (!vfe)
-		err = -EINVAL;
+	if (!vfe) {
+		mutex_unlock(&dev->lock);
+		return -EINVAL;
+	}
 
 	fe = vfe->dvb.frontend;
 
