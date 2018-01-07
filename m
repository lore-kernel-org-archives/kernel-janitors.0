From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 07 Jan 2018 21:29:24 +0000
Subject: [PATCH 1/2] misc/fsa9480: Delete an error message for a failed memory allocation in fsa9480_probe()
Message-Id: <ee60caf2-efb2-fffb-3864-84971c834ec5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <afa46cf0-1a3a-e311-7fbd-d63a23785b16@users.sourceforge.net>
In-Reply-To: <afa46cf0-1a3a-e311-7fbd-d63a23785b16@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 7 Jan 2018 22:17:53 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/fsa9480.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/misc/fsa9480.c b/drivers/misc/fsa9480.c
index 71d2793b372c..4d7f763195bc 100644
--- a/drivers/misc/fsa9480.c
+++ b/drivers/misc/fsa9480.c
@@ -418,10 +418,8 @@ static int fsa9480_probe(struct i2c_client *client,
 		return -EIO;
 
 	usbsw = kzalloc(sizeof(struct fsa9480_usbsw), GFP_KERNEL);
-	if (!usbsw) {
-		dev_err(&client->dev, "failed to allocate driver data\n");
+	if (!usbsw)
 		return -ENOMEM;
-	}
 
 	usbsw->client = client;
 	usbsw->pdata = client->dev.platform_data;
-- 
2.15.1

