From: Colin King <colin.king@canonical.com>
Date: Mon, 15 Apr 2019 10:15:55 +0000
Subject: [PATCH] wimax/i2400m: fix spelling mistake "accesibility" -> "accessibility"
Message-Id: <20190415101555.10584-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>, linux-wimax@intel.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the I2400M_MS_ACCESSIBILITY_ERROR message
string, fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wimax/i2400m/control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wimax/i2400m/control.c b/drivers/net/wimax/i2400m/control.c
index ef298d8525c5..6837fac3987b 100644
--- a/drivers/net/wimax/i2400m/control.c
+++ b/drivers/net/wimax/i2400m/control.c
@@ -254,7 +254,7 @@ static const struct
 	[I2400M_MS_ILLEGAL_VALUE] = { "illegal value", -EINVAL },
 	[I2400M_MS_MISSING_PARAMS] = { "missing parameters", -ENOMSG },
 	[I2400M_MS_VERSION_ERROR] = { "bad version", -EIO },
-	[I2400M_MS_ACCESSIBILITY_ERROR] = { "accesibility error", -EIO },
+	[I2400M_MS_ACCESSIBILITY_ERROR] = { "accessibility error", -EIO },
 	[I2400M_MS_BUSY] = { "busy", -EBUSY },
 	[I2400M_MS_CORRUPTED_TLV] = { "corrupted TLV", -EILSEQ },
 	[I2400M_MS_UNINITIALIZED] = { "uninitialized", -EILSEQ },
-- 
2.20.1
