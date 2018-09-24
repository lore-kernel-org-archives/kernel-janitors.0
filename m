From: Colin King <colin.king@canonical.com>
Date: Mon, 24 Sep 2018 17:39:51 +0000
Subject: [PATCH][V2] wimax/i2400m: fix spelling mistake "not unitialized" -> "uninitialized"
Message-Id: <20180924173951.3931-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>, linux-wimax@intel.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in ms_to_errno array of error messages
and remove confusing "not" from the error text since the error code
refers to an uninitialized error code.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: remove "not" from text too. Thanks to Sergei Shtylyov for spotting that.

---
 drivers/net/wimax/i2400m/control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wimax/i2400m/control.c b/drivers/net/wimax/i2400m/control.c
index 094cea775d0c..0475ad553707 100644
--- a/drivers/net/wimax/i2400m/control.c
+++ b/drivers/net/wimax/i2400m/control.c
@@ -257,7 +257,7 @@ static const struct
 	[I2400M_MS_ACCESSIBILITY_ERROR] = { "accesibility error", -EIO },
 	[I2400M_MS_BUSY] = { "busy", -EBUSY },
 	[I2400M_MS_CORRUPTED_TLV] = { "corrupted TLV", -EILSEQ },
-	[I2400M_MS_UNINITIALIZED] = { "not unitialized", -EILSEQ },
+	[I2400M_MS_UNINITIALIZED] = { "uninitialized", -EILSEQ },
 	[I2400M_MS_UNKNOWN_ERROR] = { "unknown error", -EIO },
 	[I2400M_MS_PRODUCTION_ERROR] = { "production error", -EIO },
 	[I2400M_MS_NO_RF] = { "no RF", -EIO },
-- 
2.17.1
