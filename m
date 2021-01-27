From: Colin King <colin.king@canonical.com>
Date: Wed, 27 Jan 2021 23:31:36 +0000
Subject: [PATCH][next] hv_utils: Fix spelling mistake "Hearbeat" -> "Heartbeat"
Message-Id: <20210127233136.623465-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in an error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hv/hv_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hv/hv_util.c b/drivers/hv/hv_util.c
index 34f3e789cc9a..e4aefeb330da 100644
--- a/drivers/hv/hv_util.c
+++ b/drivers/hv/hv_util.c
@@ -507,7 +507,7 @@ static void heartbeat_onchannelcallback(void *context)
 
 		/* Ensure recvlen is big enough to read header data */
 		if (recvlen < ICMSG_HDR) {
-			pr_err_ratelimited("Hearbeat request received. Packet length too small: %d\n",
+			pr_err_ratelimited("Heartbeat request received. Packet length too small: %d\n",
 					   recvlen);
 			break;
 		}
-- 
2.29.2
