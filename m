From: Colin King <colin.king@canonical.com>
Date: Thu, 11 Jun 2020 15:27:08 +0000
Subject: [PATCH] char/mwave: remove redundant initialization of variable bRC
Message-Id: <20200611152708.927344-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable bRC is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/mwave/smapi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/char/mwave/smapi.c b/drivers/char/mwave/smapi.c
index 691f5898bb32..f8d79d393b69 100644
--- a/drivers/char/mwave/smapi.c
+++ b/drivers/char/mwave/smapi.c
@@ -126,7 +126,7 @@ static int smapi_request(unsigned short inBX, unsigned short inCX,
 
 int smapi_query_DSP_cfg(SMAPI_DSP_SETTINGS * pSettings)
 {
-	int bRC = -EIO;
+	int bRC;
 	unsigned short usAX, usBX, usCX, usDX, usDI, usSI;
 	static const unsigned short ausDspBases[] = {
 		0x0030, 0x4E30, 0x8E30, 0xCE30,
@@ -497,7 +497,7 @@ int smapi_set_DSP_cfg(void)
 
 int smapi_set_DSP_power_state(bool bOn)
 {
-	int bRC = -EIO;
+	int bRC;
 	unsigned short usAX, usBX, usCX, usDX, usDI, usSI;
 	unsigned short usPowerFunction;
 
-- 
2.27.0.rc0
