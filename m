From: Wolfram Sang <w.sang@pengutronix.de>
Date: Sat, 20 Mar 2010 14:13:03 +0000
Subject: [PATCH 22/24] staging/iio/light: fix dangling pointers
Message-Id: <1269094385-16114-23-git-send-email-w.sang@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1269094385-16114-1-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1269094385-16114-1-git-send-email-w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org

Fix I2C-drivers which missed setting clientdata to NULL before freeing the
structure it points to. Also fix drivers which do this _after_ the structure
was freed already.

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@suse.de>
---

Found using coccinelle, then reviewed. Full patchset is available via
kernel-janitors, linux-i2c, and LKML.
---
 drivers/staging/iio/light/tsl2563.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/iio/light/tsl2563.c b/drivers/staging/iio/light/tsl2563.c
index 78b9432..286559d 100644
--- a/drivers/staging/iio/light/tsl2563.c
+++ b/drivers/staging/iio/light/tsl2563.c
@@ -681,6 +681,7 @@ static int __devinit tsl2563_probe(struct i2c_client *client,
 fail2:
 	iio_device_unregister(chip->indio_dev);
 fail1:
+	i2c_set_clientdata(client, NULL);
 	kfree(chip);
 	return err;
 }
@@ -691,6 +692,7 @@ static int tsl2563_remove(struct i2c_client *client)
 
 	iio_device_unregister(chip->indio_dev);
 
+	i2c_set_clientdata(client, NULL);
 	kfree(chip);
 	return 0;
 }
-- 
1.7.0

