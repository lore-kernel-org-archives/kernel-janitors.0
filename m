From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 07 Jan 2018 21:30:12 +0000
Subject: [PATCH 2/2] misc/fsa9480: Improve a size determination in fsa9480_probe()
Message-Id: <4f62f094-3b5c-7c13-8b9f-1d2da9b1baf4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <afa46cf0-1a3a-e311-7fbd-d63a23785b16@users.sourceforge.net>
In-Reply-To: <afa46cf0-1a3a-e311-7fbd-d63a23785b16@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 7 Jan 2018 22:20:19 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/fsa9480.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fsa9480.c b/drivers/misc/fsa9480.c
index 4d7f763195bc..bf199cd5fce9 100644
--- a/drivers/misc/fsa9480.c
+++ b/drivers/misc/fsa9480.c
@@ -417,7 +417,7 @@ static int fsa9480_probe(struct i2c_client *client,
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
 		return -EIO;
 
-	usbsw = kzalloc(sizeof(struct fsa9480_usbsw), GFP_KERNEL);
+	usbsw = kzalloc(sizeof(*usbsw), GFP_KERNEL);
 	if (!usbsw)
 		return -ENOMEM;
 
-- 
2.15.1

