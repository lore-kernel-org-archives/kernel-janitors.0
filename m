From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 07 Jan 2018 21:02:26 +0000
Subject: [PATCH 1/2] misc/apds9802als: Delete an error message for a failed memory allocation in apds9802als_
Message-Id: <501c9715-0f40-7365-07e9-23201f8f540b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cfd7cb73-7437-0d95-ef7a-8c8f6ce49e3d@users.sourceforge.net>
In-Reply-To: <cfd7cb73-7437-0d95-ef7a-8c8f6ce49e3d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 7 Jan 2018 21:42:07 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/apds9802als.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/apds9802als.c b/drivers/misc/apds9802als.c
index d8ac036f01ab..fa548796c92e 100644
--- a/drivers/misc/apds9802als.c
+++ b/drivers/misc/apds9802als.c
@@ -231,10 +231,9 @@ static int apds9802als_probe(struct i2c_client *client,
 	struct als_data *data;
 
 	data = kzalloc(sizeof(struct als_data), GFP_KERNEL);
-	if (data = NULL) {
-		dev_err(&client->dev, "Memory allocation failed\n");
+	if (!data)
 		return -ENOMEM;
-	}
+
 	i2c_set_clientdata(client, data);
 	res = sysfs_create_group(&client->dev.kobj, &m_als_gr);
 	if (res) {
-- 
2.15.1

