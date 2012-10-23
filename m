From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Tue, 23 Oct 2012 19:57:18 +0000
Subject: [PATCH 15/23] ivtv: Replace memcpy with struct assignment
Message-Id: <1351022246-8201-15-git-send-email-elezegarcia@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351022246-8201-1-git-send-email-elezegarcia@gmail.com>
In-Reply-To: <1351022246-8201-1-git-send-email-elezegarcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Julia.Lawall@lip6.fr, kernel-janitors@vger.kernel.org, Ezequiel Garcia <elezegarcia@gmail.com>, Andy Walls <awalls@md.metrocast.net>, Peter Senna Tschudin <peter.senna@gmail.com>

This kind of memcpy() is error-prone. Its replacement with a struct
assignment is prefered because it's type-safe and much easier to read.

Found by coccinelle. Hand patched and reviewed.
Tested by compilation only.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier struct_name;
struct struct_name to;
struct struct_name from;
expression E;
@@
-memcpy(&(to), &(from), E);
+to = from;
// </smpl>

Cc: Andy Walls <awalls@md.metrocast.net>
Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
---
 drivers/media/pci/ivtv/ivtv-i2c.c |   12 ++++--------
 1 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-i2c.c b/drivers/media/pci/ivtv/ivtv-i2c.c
index d47f41a..27a8466 100644
--- a/drivers/media/pci/ivtv/ivtv-i2c.c
+++ b/drivers/media/pci/ivtv/ivtv-i2c.c
@@ -719,13 +719,10 @@ int init_ivtv_i2c(struct ivtv *itv)
 		return -ENODEV;
 	}
 	if (itv->options.newi2c > 0) {
-		memcpy(&itv->i2c_adap, &ivtv_i2c_adap_hw_template,
-		       sizeof(struct i2c_adapter));
+		itv->i2c_adap = ivtv_i2c_adap_hw_template;
 	} else {
-		memcpy(&itv->i2c_adap, &ivtv_i2c_adap_template,
-		       sizeof(struct i2c_adapter));
-		memcpy(&itv->i2c_algo, &ivtv_i2c_algo_template,
-		       sizeof(struct i2c_algo_bit_data));
+		itv->i2c_adap = ivtv_i2c_adap_template;
+		itv->i2c_algo = ivtv_i2c_algo_template;
 	}
 	itv->i2c_algo.udelay = itv->options.i2c_clock_period / 2;
 	itv->i2c_algo.data = itv;
@@ -735,8 +732,7 @@ int init_ivtv_i2c(struct ivtv *itv)
 		itv->instance);
 	i2c_set_adapdata(&itv->i2c_adap, &itv->v4l2_dev);
 
-	memcpy(&itv->i2c_client, &ivtv_i2c_client_template,
-	       sizeof(struct i2c_client));
+	itv->i2c_client = ivtv_i2c_client_template;
 	itv->i2c_client.adapter = &itv->i2c_adap;
 	itv->i2c_adap.dev.parent = &itv->pdev->dev;
 
-- 
1.7.4.4

