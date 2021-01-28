From: Colin King <colin.king@canonical.com>
Date: Thu, 28 Jan 2021 17:37:02 +0000
Subject: [PATCH] staging: net: wimax: i2400m: fw: remove redundant initialization of variable result
Message-Id: <20210128173703.645328-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee.jones@linaro.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable result is being initialized with a value that is never
read and it is being updated later with a new value.  The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/wimax/i2400m/fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wimax/i2400m/fw.c b/drivers/staging/wimax/i2400m/fw.c
index edb5eba0898b..b2fd4bd2c5f9 100644
--- a/drivers/staging/wimax/i2400m/fw.c
+++ b/drivers/staging/wimax/i2400m/fw.c
@@ -583,7 +583,7 @@ ssize_t i2400m_bm_cmd(struct i2400m *i2400m,
 		      struct i2400m_bootrom_header *ack, size_t ack_size,
 		      int flags)
 {
-	ssize_t result = -ENOMEM, rx_bytes;
+	ssize_t result, rx_bytes;
 	struct device *dev = i2400m_dev(i2400m);
 	int opcode = cmd = NULL ? -1 : i2400m_brh_get_opcode(cmd);
 
-- 
2.29.2
