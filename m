From: Michael Borisov <niro@tut.by>
Date: Sat, 26 Jul 2008 08:52:14 +0000
Subject: [PATCH] fix warning in drivers/hwmon/w83791d.c
Message-Id: <1217062334.25013.9.camel@inlin>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

This patch fixes the following compile warning:

drivers/hwmon/w83791d.c: In function ‘w83791d_probe’:
drivers/hwmon/w83791d.c:1049: warning: unused variable ‘val1’

Signed-off-by: Michael Borisov <niro@tut.by>
---
diff --git a/drivers/hwmon/w83791d.c b/drivers/hwmon/w83791d.c
index e4e91c9..1e2dff3 100644
--- a/drivers/hwmon/w83791d.c
+++ b/drivers/hwmon/w83791d.c
@@ -1046,9 +1046,10 @@ static int w83791d_probe(struct i2c_client
*client,
 {
        struct w83791d_data *data;
        struct device *dev = &client->dev;
-       int i, val1, err;
+       int i, err;
 
 #ifdef DEBUG
+        int val1;
        val1 = w83791d_read(client, W83791D_REG_DID_VID4);
        dev_dbg(dev, "Device ID version: %d.%d (0x%02x)\n",
                        (val1 >> 5) & 0x07, (val1 >> 1) & 0x0f, val1);


