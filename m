From: Colin King <colin.king@canonical.com>
Date: Wed, 11 Sep 2019 10:38:48 +0000
Subject: [PATCH] NFC: st95hf: fix spelling mistake "receieve" -> "receive"
Message-Id: <20190911103848.17966-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/nfc/st95hf/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index 6034c5bf49d9..ce38782ebf80 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -316,7 +316,7 @@ static int st95hf_echo_command(struct st95hf_context *st95context)
 					  &echo_response);
 	if (result) {
 		dev_err(&st95context->spicontext.spidev->dev,
-			"err: echo response receieve error = 0x%x\n", result);
+			"err: echo response receive error = 0x%x\n", result);
 		return result;
 	}
 
-- 
2.20.1
