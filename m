From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Apr 2012 08:47:02 +0000
Subject: [patch] Extcon: check for allocation failure
Message-Id: <20120425084702.GB12799@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kyungmin Park <kyungmin.park@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Donggeun Kim <dg77.kim@samsung.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Return -ENOMEM if the kmalloc() fails.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/extcon/extcon_class.c b/drivers/extcon/extcon_class.c
index 3bc4b8a..fe5a038 100644
--- a/drivers/extcon/extcon_class.c
+++ b/drivers/extcon/extcon_class.c
@@ -621,6 +621,8 @@ int extcon_dev_register(struct extcon_dev *edev, struct device *dev)
 	}
 
 	edev->dev = kzalloc(sizeof(struct device), GFP_KERNEL);
+	if (!edev->dev)
+		return -ENOMEM;
 	edev->dev->parent = dev;
 	edev->dev->class = extcon_class;
 	edev->dev->release = extcon_dev_release;
