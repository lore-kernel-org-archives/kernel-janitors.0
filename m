From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Oct 2020 07:06:59 +0000
Subject: [PATCH] hwmon: (pmbus/max20730) delete some dead code
Message-Id: <20201022070659.GA2817762@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>, Ugur Usug <Ugur.Usug@maximintegrated.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

The debugfs_create_dir() function never returns NULL.  Normal users are
not supposed to check the return value so the correct fix is just to
delete this check.

In the case where the debugfs_create_dir() fails, the function returns
NULL.  The other debugfs function check for NULL directory and handle
it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hwmon/pmbus/max20730.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
index be83b98411c7..00fea16acab4 100644
--- a/drivers/hwmon/pmbus/max20730.c
+++ b/drivers/hwmon/pmbus/max20730.c
@@ -328,8 +328,6 @@ static int max20730_init_debugfs(struct i2c_client *client,
 		return -ENOENT;
 
 	max20730_dir = debugfs_create_dir(client->name, debugfs);
-	if (!max20730_dir)
-		return -ENOENT;
 
 	for (i = 0; i < MAX20730_DEBUGFS_NUM_ENTRIES; ++i)
 		psu->debugfs_entries[i] = i;
-- 
2.28.0
