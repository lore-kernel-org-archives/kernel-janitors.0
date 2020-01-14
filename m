From: Colin King <colin.king@canonical.com>
Date: Tue, 14 Jan 2020 14:40:31 +0000
Subject: [PATCH][next] drivers: ipmi: fix off-by-one bounds check that leads to a out-of-bounds write
Message-Id: <20200114144031.358003-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Corey Minyard <cminyard@mvista.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, vadimp@mellanox.com, Asmaa Mnebhi <Asmaa@mellanox.com>, openipmi-developer@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The end of buffer check is off-by-one since the check is against
an index that is pre-incremented before a store to buf[]. Fix this
adjusting the bounds check appropriately.

Addresses-Coverity: ("Out-of-bounds write")
Fixes: 51bd6f291583 ("Add support for IPMB driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/ipmi/ipmb_dev_int.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
index 9fdae83e59e0..382b28f1cf2f 100644
--- a/drivers/char/ipmi/ipmb_dev_int.c
+++ b/drivers/char/ipmi/ipmb_dev_int.c
@@ -279,7 +279,7 @@ static int ipmb_slave_cb(struct i2c_client *client,
 		break;
 
 	case I2C_SLAVE_WRITE_RECEIVED:
-		if (ipmb_dev->msg_idx >= sizeof(struct ipmb_msg))
+		if (ipmb_dev->msg_idx >= sizeof(struct ipmb_msg) - 1)
 			break;
 
 		buf[++ipmb_dev->msg_idx] = *val;
-- 
2.24.0
