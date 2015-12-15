From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Dec 2015 11:04:14 +0000
Subject: [patch] [media] v4l2-device: fix a missing error code
Message-Id: <20151215110307.GB9594@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tommi Franttila <tommi.franttila@intel.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to set "err = -ENOMEM" here.

Fixes: 38b11f19667a ('[media] v4l2-core: create MC interfaces for devnodes')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
index 85f724b..85b1e98 100644
--- a/drivers/media/v4l2-core/v4l2-device.c
+++ b/drivers/media/v4l2-core/v4l2-device.c
@@ -266,8 +266,10 @@ int v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
 			link = media_create_intf_link(&sd->entity,
 						      &vdev->intf_devnode->intf,
 						      MEDIA_LNK_FL_ENABLED);
-			if (!link)
+			if (!link) {
+				err = -ENOMEM;
 				goto clean_up;
+			}
 		}
 #endif
 		sd->devnode = vdev;
