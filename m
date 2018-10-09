From: Colin King <colin.king@canonical.com>
Date: Tue, 09 Oct 2018 12:11:57 +0000
Subject: [PATCH] hwmon: (tmp421) make const array 'names' static
Message-Id: <20181009121157.21656-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The const array 'names' can be made static, saves populating it on
the stack and will make it read-only.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hwmon/tmp421.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index e36399213324..8844c9565d2a 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -226,8 +226,10 @@ static int tmp421_detect(struct i2c_client *client,
 {
 	enum chips kind;
 	struct i2c_adapter *adapter = client->adapter;
-	const char * const names[] = { "TMP421", "TMP422", "TMP423",
-				       "TMP441", "TMP442" };
+	static const char * const names[] = {
+		"TMP421", "TMP422", "TMP423",
+		"TMP441", "TMP442"
+	};
 	int addr = client->addr;
 	u8 reg;
 
-- 
2.17.1
