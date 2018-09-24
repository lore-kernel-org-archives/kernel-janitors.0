From: Colin King <colin.king@canonical.com>
Date: Mon, 24 Sep 2018 17:14:37 +0000
Subject: [PATCH] i2c: i2c-isch: fix spelling mistake "unitialized" -> "uninitialized"
Message-Id: <20180924171437.3071-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_notice message.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/i2c/busses/i2c-isch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index 0cf1379f4e80..5c754bf659e2 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -164,7 +164,7 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 		 * run ~75 kHz instead which should do no harm.
 		 */
 		dev_notice(&sch_adapter.dev,
-			"Clock divider unitialized. Setting defaults\n");
+			"Clock divider uninitialized. Setting defaults\n");
 		outw(backbone_speed / (4 * 100), SMBHSTCLK);
 	}
 
-- 
2.17.1
