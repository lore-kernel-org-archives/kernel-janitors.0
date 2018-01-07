From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 07 Jan 2018 21:03:56 +0000
Subject: [PATCH 2/2] misc/apds9802als: Improve a size determination in apds9802als_probe()
Message-Id: <a1fd0305-9f42-c172-3869-e2d0e1990011@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cfd7cb73-7437-0d95-ef7a-8c8f6ce49e3d@users.sourceforge.net>
In-Reply-To: <cfd7cb73-7437-0d95-ef7a-8c8f6ce49e3d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 7 Jan 2018 21:48:50 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/apds9802als.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/misc/apds9802als.c b/drivers/misc/apds9802als.c
index fa548796c92e..acf467666737 100644
--- a/drivers/misc/apds9802als.c
+++ b/drivers/misc/apds9802als.c
@@ -228,9 +228,8 @@ static int apds9802als_probe(struct i2c_client *client,
 			     const struct i2c_device_id *id)
 {
 	int res;
-	struct als_data *data;
+	struct als_data *data = kzalloc(sizeof(*data), GFP_KERNEL);
 
-	data = kzalloc(sizeof(struct als_data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-- 
2.15.1

