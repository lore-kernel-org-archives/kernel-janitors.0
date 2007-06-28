From: "Suresh Jayaraman" <sjayaraman@novell.com>
Date: Thu, 28 Jun 2007 17:16:30 +0000
Subject: [KJ] [PATCH] usb-host: Remove unnecessary cast of return value of
Message-Id: <46843A46020000F40000A9BA@lucius.provo.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove unnecessary cast of return value of kzalloc() in
usb/host/ohci-pnx4008.c

Signed-off-by: Suresh Jayaraman <sjayaraman@novell.com>
---

diff --git a/drivers/usb/host/ohci-pnx4008.c b/drivers/usb/host/ohci-pnx4008.c
index d601bbb..ca2a6ab 100644
--- a/drivers/usb/host/ohci-pnx4008.c
+++ b/drivers/usb/host/ohci-pnx4008.c
@@ -134,7 +134,7 @@ static int isp1301_attach(struct i2c_adapter *adap, int addr, int kind)
 {
 	struct i2c_client *c;
 
-	c = (struct i2c_client *)kzalloc(sizeof(*c), GFP_KERNEL);
+	c = kzalloc(sizeof(*c), GFP_KERNEL);
 
 	if (!c)
 		return -ENOMEM;

-- 
Suresh Jayaraman


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
