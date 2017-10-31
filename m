From: Colin King <colin.king@canonical.com>
Date: Tue, 31 Oct 2017 10:27:47 +0000
Subject: [PATCH] platform/chrome: cros_ec_lpc: remove redundant pointer request
Message-Id: <20171031102747.20154-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benson Leung <bleung@chromium.org>, Olof Johansson <olof@lixom.net>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer request is being assigned but never used, so remove it. Cleans
up the clang warning:

drivers/platform/chrome/cros_ec_lpc.c:68:2: warning: Value stored to
'request' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/platform/chrome/cros_ec_lpc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 1baf720faf69..87e9747d229a 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -54,7 +54,6 @@ static int ec_response_timed_out(void)
 static int cros_ec_pkt_xfer_lpc(struct cros_ec_device *ec,
 				struct cros_ec_command *msg)
 {
-	struct ec_host_request *request;
 	struct ec_host_response response;
 	u8 sum;
 	int ret = 0;
@@ -65,8 +64,6 @@ static int cros_ec_pkt_xfer_lpc(struct cros_ec_device *ec,
 	/* Write buffer */
 	cros_ec_lpc_write_bytes(EC_LPC_ADDR_HOST_PACKET, ret, ec->dout);
 
-	request = (struct ec_host_request *)ec->dout;
-
 	/* Here we go */
 	sum = EC_COMMAND_PROTOCOL_3;
 	cros_ec_lpc_write_bytes(EC_LPC_ADDR_HOST_CMD, 1, &sum);
-- 
2.14.1

