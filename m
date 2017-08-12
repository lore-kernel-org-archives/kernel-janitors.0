From: Colin King <colin.king@canonical.com>
Date: Sat, 12 Aug 2017 21:34:03 +0000
Subject: [PATCH] w1: ds2438: make several functions static
Message-Id: <20170812213403.5807-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <zbr@ioremap.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, "Andrew F . Davis" <afd@ti.com>, Mariusz Bialonczyk <manio@skyboo.net>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The functions w1_ds2438_get_page, w1_ds2438_get_temperature,
w1_ds2438_change_config_bit and w1_ds2438_get_voltage are local to
the source and do not need to be in global scope, so make it static.

Cleans up sparse warnings:
symbol 'w1_ds2438_get_page' was not declared. Should it be static?
symbol 'w1_ds2438_get_temperature' was not declared. Should it be static?
symbol 'w1_ds2438_change_config_bit' was not declared. Should it be static?
symbol 'w1_ds2438_get_voltage' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/w1/slaves/w1_ds2438.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/w1/slaves/w1_ds2438.c b/drivers/w1/slaves/w1_ds2438.c
index 6487fb772a20..4753c91c579a 100644
--- a/drivers/w1/slaves/w1_ds2438.c
+++ b/drivers/w1/slaves/w1_ds2438.c
@@ -51,7 +51,7 @@
 #define DS2438_CURRENT_MSB		0x06
 #define DS2438_THRESHOLD		0x07
 
-int w1_ds2438_get_page(struct w1_slave *sl, int pageno, u8 *buf)
+static int w1_ds2438_get_page(struct w1_slave *sl, int pageno, u8 *buf)
 {
 	unsigned int retries = W1_DS2438_RETRIES;
 	u8 w1_buf[2];
@@ -85,7 +85,7 @@ int w1_ds2438_get_page(struct w1_slave *sl, int pageno, u8 *buf)
 	return -1;
 }
 
-int w1_ds2438_get_temperature(struct w1_slave *sl, int16_t *temperature)
+static int w1_ds2438_get_temperature(struct w1_slave *sl, int16_t *temperature)
 {
 	unsigned int retries = W1_DS2438_RETRIES;
 	u8 w1_buf[DS2438_PAGE_SIZE + 1 /*for CRC*/];
@@ -127,7 +127,7 @@ int w1_ds2438_get_temperature(struct w1_slave *sl, int16_t *temperature)
 	return ret;
 }
 
-int w1_ds2438_change_config_bit(struct w1_slave *sl, u8 mask, u8 value)
+static int w1_ds2438_change_config_bit(struct w1_slave *sl, u8 mask, u8 value)
 {
 	unsigned int retries = W1_DS2438_RETRIES;
 	u8 w1_buf[3];
@@ -186,7 +186,8 @@ int w1_ds2438_change_config_bit(struct w1_slave *sl, u8 mask, u8 value)
 	return -1;
 }
 
-uint16_t w1_ds2438_get_voltage(struct w1_slave *sl, int adc_input, uint16_t *voltage)
+static uint16_t w1_ds2438_get_voltage(struct w1_slave *sl,
+				      int adc_input, uint16_t *voltage)
 {
 	unsigned int retries = W1_DS2438_RETRIES;
 	u8 w1_buf[DS2438_PAGE_SIZE + 1 /*for CRC*/];
-- 
2.11.0

