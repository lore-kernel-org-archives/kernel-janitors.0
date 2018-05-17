From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 May 2018 09:05:51 +0000
Subject: [PATCH] media: v4l2-ioctl: prevent underflow in v4l_enumoutput()
Message-Id: <20180517090550.GB4250@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Manjunath Hadli <manjunath.hadli@ti.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tim Harvey <tharvey@gateworks.com>, Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, Smitha T Murthy <smitha.t@samsung.com>, Sami Tolvanen <samitolvanen@google.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

My Smatch allmodconfig build only detects one function implementing
vpbe_device_ops->enum_outputs and that's vpbe_enum_outputs().  The
problem really happens in that function when we do:

	int temp_index = output->index;

	if (temp_index >= cfg->num_outputs)
		return -EINVAL;

Unfortunately, both temp_index and cfg->num_outputs are type int so we
have a potential read before the start of the array if "temp_index" is
negative.

I could have fixed the bug in that function but it's more secure and
future proof to block that bug earlier in a central place.  There is no
one who need p->index to be more than INT_MAX.

Fixes: 66715cdc3224 ("[media] davinci vpbe: VPBE display driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a40dbec271f1..115757ab8bc0 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1099,6 +1099,9 @@ static int v4l_enumoutput(const struct v4l2_ioctl_ops *ops,
 	if (is_valid_ioctl(vfd, VIDIOC_S_STD))
 		p->capabilities |= V4L2_OUT_CAP_STD;
 
+	if (p->index > INT_MAX)
+		return -EINVAL;
+
 	return ops->vidioc_enum_output(file, fh, p);
 }
 
