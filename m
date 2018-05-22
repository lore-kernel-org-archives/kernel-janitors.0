From: Colin King <colin.king@canonical.com>
Date: Tue, 22 May 2018 08:29:22 +0000
Subject: [PATCH] staging: mt7621-mmc: fix spelling mistake: "Illgal" -> "Illegal"
Message-Id: <20180522082922.5538-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180518100359.28036-1-colin.king@canonical.com>
In-Reply-To: <20180518100359.28036-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?q?Christian=20L=C3=BCtke-Stetzkamp?= <christian@lkamp.de>, NeilBrown <neil@brown.name>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to another spelling mistake in N_MSG message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/mt7621-mmc/sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-mmc/sd.c b/drivers/staging/mt7621-mmc/sd.c
index 11bf4b4c3403..648a2dd1436e 100644
--- a/drivers/staging/mt7621-mmc/sd.c
+++ b/drivers/staging/mt7621-mmc/sd.c
@@ -388,7 +388,7 @@ static void msdc_dump_io_resp(struct msdc_host *host, u32 resp)
 	if (flags & (1 << 7))
 		N_MSG(RSP, "[IO] COM_CRC_ERR");
 	if (flags & (1 << 6))
-		N_MSG(RSP, "[IO] Illgal command");
+		N_MSG(RSP, "[IO] Illegal command");
 	if (flags & (1 << 3))
 		N_MSG(RSP, "[IO] Error");
 	if (flags & (1 << 2))
-- 
2.17.0

