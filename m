From: Shaun Laing <shaun@XResource.ca>
Date: Wed, 24 Jul 2013 20:15:38 +0000
Subject: [PATCH 1/1] staging/comedi/drivers/dt9812.c: Resolves sparse warnings regarding byte ordering.
Message-Id: <201307242015.r6OKFcTp1000140@rivendell.pollux.laing>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Shaun Laing <shaun-lk@xresource.ca>
Signed-off-by: Shaun Laing <shaun-lk@xresource.ca>

* Resolves sparse warnings of the form "warning: cast to restricted __le??"
* Renames temp variables to include "le", to remind that the values are little endian

---
diff --git a/drivers/staging/comedi/drivers/dt9812.c b/drivers/staging/comedi/drivers/dt9812.c
index 6c60949..fb8caa7 100644
--- a/drivers/staging/comedi/drivers/dt9812.c
+++ b/drivers/staging/comedi/drivers/dt9812.c
@@ -707,8 +707,9 @@ static int dt9812_reset_device(struct comedi_device *dev)
 	u32 serial;
 	u16 vendor;
 	u16 product;
-	u16 tmp16;
 	u8 tmp8;
+	__le16 tmple16;
+	__le32 tmple32;
 	int ret;
 	int i;
 
@@ -731,33 +732,33 @@ static int dt9812_reset_device(struct comedi_device *dev)
 		}
 	}
 
-	ret = dt9812_read_info(dev, 1, &vendor, sizeof(vendor));
+	ret = dt9812_read_info(dev, 1, &tmple16, sizeof(tmple16));
 	if (ret) {
 		dev_err(dev->class_dev, "failed to read vendor id\n");
 		return ret;
 	}
-	vendor = le16_to_cpu(vendor);
+	vendor = le16_to_cpu(tmple16);
 
-	ret = dt9812_read_info(dev, 3, &product, sizeof(product));
+	ret = dt9812_read_info(dev, 3, &tmple16, sizeof(tmple16));
 	if (ret) {
 		dev_err(dev->class_dev, "failed to read product id\n");
 		return ret;
 	}
-	product = le16_to_cpu(product);
+	product = le16_to_cpu(tmple16);
 
-	ret = dt9812_read_info(dev, 5, &tmp16, sizeof(tmp16));
+	ret = dt9812_read_info(dev, 5, &tmple16, sizeof(tmple16));
 	if (ret) {
 		dev_err(dev->class_dev, "failed to read device id\n");
 		return ret;
 	}
-	devpriv->device = le16_to_cpu(tmp16);
+	devpriv->device = le16_to_cpu(tmple16);
 
-	ret = dt9812_read_info(dev, 7, &serial, sizeof(serial));
+	ret = dt9812_read_info(dev, 7, &tmple32, sizeof(tmple32));
 	if (ret) {
 		dev_err(dev->class_dev, "failed to read serial number\n");
 		return ret;
 	}
-	serial = le32_to_cpu(serial);
+	serial = le32_to_cpu(tmple32);
 
 	/* let the user know what node this device is now attached to */
 	dev_info(dev->class_dev, "USB DT9812 (%4.4x.%4.4x.%4.4x) #0x%8.8x\n",
