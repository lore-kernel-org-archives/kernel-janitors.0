From: Colin King <colin.king@canonical.com>
Date: Wed, 16 Aug 2017 09:16:59 +0000
Subject: [PATCH][i2c-next] i2c-cht-wc: make cht_wc_i2c_adap_driver static
Message-Id: <20170816091659.10738-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The structure cht_wc_i2c_adap_driver is local to the source
and does not need to be in global scope, so make it static.

Cleans up sparse warning:
symbol 'cht_wc_i2c_adap_driver' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/i2c/busses/i2c-cht-wc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
index fe5caf70c7fe..01c94c918d4c 100644
--- a/drivers/i2c/busses/i2c-cht-wc.c
+++ b/drivers/i2c/busses/i2c-cht-wc.c
@@ -322,7 +322,7 @@ static struct platform_device_id cht_wc_i2c_adap_id_table[] = {
 };
 MODULE_DEVICE_TABLE(platform, cht_wc_i2c_adap_id_table);
 
-struct platform_driver cht_wc_i2c_adap_driver = {
+static struct platform_driver cht_wc_i2c_adap_driver = {
 	.probe = cht_wc_i2c_adap_i2c_probe,
 	.remove = cht_wc_i2c_adap_i2c_remove,
 	.driver = {
-- 
2.11.0

