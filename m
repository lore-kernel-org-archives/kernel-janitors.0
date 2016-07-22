From: Ben Werbowyj <ben.werbowyj@gmail.com>
Date: Fri, 22 Jul 2016 04:33:34 +0000
Subject: [PATCH 2/3] drivers: w1: removed assignment from within if statement
Message-Id: <1469162015-10497-3-git-send-email-ben.werbowyj@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Assignment of variable count removed from within an if statment.
This was done at two locations in the file.

Signed-off-by: Ben Werbowyj <ben.werbowyj@gmail.com>
---
 drivers/w1/slaves/w1_therm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
index efe9d215..83a5036 100644
--- a/drivers/w1/slaves/w1_therm.c
+++ b/drivers/w1/slaves/w1_therm.c
@@ -335,7 +335,8 @@ static inline int w1_DS18B20_precision(struct device *device, int val)
 
 			/* read values to only alter precision bits */
 			w1_write_8(dev, W1_READ_SCRATCHPAD);
-			if ((count = w1_read_block(dev, rom, 9)) != 9)
+			count = w1_read_block(dev, rom, 9);
+			if (count != 9)
 				dev_warn(device, "w1_read_block() returned %u instead of 9.\n",	count);
 
 			crc = w1_calc_crc8(rom, 8);
@@ -493,7 +494,8 @@ static ssize_t w1_slave_show(struct device *device,
 			if (!w1_reset_select_slave(sl)) {
 
 				w1_write_8(dev, W1_READ_SCRATCHPAD);
-				if ((count = w1_read_block(dev, rom, 9)) != 9) {
+				count = w1_read_block(dev, rom, 9);
+				if (count != 9) {
 					dev_warn(device, "w1_read_block() "
 						"returned %u instead of 9.\n",
 						count);
-- 
2.1.4

