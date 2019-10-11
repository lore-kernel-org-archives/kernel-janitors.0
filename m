From: Colin King <colin.king@canonical.com>
Date: Fri, 11 Oct 2019 17:02:15 +0000
Subject: [PATCH] hwmon: w83793d: remove redundant assignment to variable res
Message-Id: <20191011170215.11539-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rudolf Marek <r.marek@assembler.cz>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable res is being initialized with a value that
is never read and is being re-assigned a little later on. The
assignment is redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hwmon/w83793.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
index 9df48b70c70c..a0307e6761b8 100644
--- a/drivers/hwmon/w83793.c
+++ b/drivers/hwmon/w83793.c
@@ -2096,7 +2096,7 @@ static struct w83793_data *w83793_update_device(struct device *dev)
 static u8 w83793_read_value(struct i2c_client *client, u16 reg)
 {
 	struct w83793_data *data = i2c_get_clientdata(client);
-	u8 res = 0xff;
+	u8 res;
 	u8 new_bank = reg >> 8;
 
 	new_bank |= data->bank & 0xfc;
-- 
2.20.1
