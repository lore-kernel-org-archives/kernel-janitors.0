From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Jul 2018 10:11:07 +0000
Subject: [PATCH] net/hamradio/6pack: remove redundant variable channel
Message-Id: <20180705101107.22897-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Koensgen <ajk@comnets.uni-bremen.de>, "David S . Miller" <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable channel is being assigned but is never used hence it is
redundant and can be removed.

Cleans up two clang warnings:
warning: variable 'channel' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/hamradio/6pack.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index 32f49c4ce457..d79a69dd2146 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -878,10 +878,8 @@ static void decode_data(struct sixpack *sp, unsigned char inbyte)
 
 static void decode_prio_command(struct sixpack *sp, unsigned char cmd)
 {
-	unsigned char channel;
 	int actual;
 
-	channel = cmd & SIXP_CHN_MASK;
 	if ((cmd & SIXP_PRIO_DATA_MASK) != 0) {     /* idle ? */
 
 	/* RX and DCD flags can only be set in the same prio command,
@@ -933,10 +931,9 @@ static void decode_prio_command(struct sixpack *sp, unsigned char cmd)
 
 static void decode_std_command(struct sixpack *sp, unsigned char cmd)
 {
-	unsigned char checksum = 0, rest = 0, channel;
+	unsigned char checksum = 0, rest = 0;
 	short i;
 
-	channel = cmd & SIXP_CHN_MASK;
 	switch (cmd & SIXP_CMD_MASK) {     /* normal command */
 	case SIXP_SEOF:
 		if ((sp->rx_count = 0) && (sp->rx_count_cooked = 0)) {
-- 
2.17.1

