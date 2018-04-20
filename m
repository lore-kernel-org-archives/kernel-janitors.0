From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Apr 2018 10:13:52 +0000
Subject: [PATCH] media: vpbe_venc: potential uninitialized variable in ven_sub_dev_init()
Message-Id: <20180420101352.GA30373@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that "venc" could be unintialized.  There a couple
error paths where it looks like maybe that could happen.  I don't know
if it's really a bug, but it's reasonable to set "venc" to NULL and
silence the warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/platform/davinci/vpbe_venc.c b/drivers/media/platform/davinci/vpbe_venc.c
index 5c255de3b3f8..ba157827192c 100644
--- a/drivers/media/platform/davinci/vpbe_venc.c
+++ b/drivers/media/platform/davinci/vpbe_venc.c
@@ -606,7 +606,7 @@ static int venc_device_get(struct device *dev, void *data)
 struct v4l2_subdev *venc_sub_dev_init(struct v4l2_device *v4l2_dev,
 		const char *venc_name)
 {
-	struct venc_state *venc;
+	struct venc_state *venc = NULL;
 
 	bus_for_each_dev(&platform_bus_type, NULL, &venc,
 			venc_device_get);
