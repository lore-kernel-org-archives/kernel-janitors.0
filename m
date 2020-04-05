From: Colin King <colin.king@canonical.com>
Date: Sun, 05 Apr 2020 12:06:02 +0000
Subject: [PATCH] wimax: remove some redundant assignments to variable result
Message-Id: <20200405120603.369405-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>, linux-wimax@intel.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In function i2400m_bm_buf_alloc there is no need to use a variable
'result' to return -ENOMEM, just return the literal value. In the
function i2400m_setup the variable 'result' is initialized with a
value that is never read, it is a redundant assignment that can
be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wimax/i2400m/driver.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wimax/i2400m/driver.c b/drivers/net/wimax/i2400m/driver.c
index f66c0f8f6f4a..ecb3fccca603 100644
--- a/drivers/net/wimax/i2400m/driver.c
+++ b/drivers/net/wimax/i2400m/driver.c
@@ -740,9 +740,6 @@ EXPORT_SYMBOL_GPL(i2400m_error_recovery);
 static
 int i2400m_bm_buf_alloc(struct i2400m *i2400m)
 {
-	int result;
-
-	result = -ENOMEM;
 	i2400m->bm_cmd_buf = kzalloc(I2400M_BM_CMD_BUF_SIZE, GFP_KERNEL);
 	if (i2400m->bm_cmd_buf = NULL)
 		goto error_bm_cmd_kzalloc;
@@ -754,7 +751,7 @@ int i2400m_bm_buf_alloc(struct i2400m *i2400m)
 error_bm_ack_buf_kzalloc:
 	kfree(i2400m->bm_cmd_buf);
 error_bm_cmd_kzalloc:
-	return result;
+	return -ENOMEM;
 }
 
 
@@ -843,7 +840,7 @@ EXPORT_SYMBOL_GPL(i2400m_reset);
  */
 int i2400m_setup(struct i2400m *i2400m, enum i2400m_bri bm_flags)
 {
-	int result = -ENODEV;
+	int result;
 	struct device *dev = i2400m_dev(i2400m);
 	struct wimax_dev *wimax_dev = &i2400m->wimax_dev;
 	struct net_device *net_dev = i2400m->wimax_dev.net_dev;
-- 
2.25.1
