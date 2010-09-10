From: Dan Carpenter <error27@gmail.com>
Date: Fri, 10 Sep 2010 11:57:14 +0000
Subject: [patch] airo: remove pointless check
Message-Id: <20100910115714.GE5959@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Matthieu CASTET <castet.matthieu@free.fr>, Stanislaw Gruszka <sgruszka@redhat.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

It doesn't make sense to check "!ai->config.rates" here.
"ai->config.rates" is the address of an eight bytes array and it
can't ever be null here.  Also if it were NULL then trying to set:
	ai->config.rates[i] = basic_rate | 0x80;
would cause an oops.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/wireless/airo.c b/drivers/net/wireless/airo.c
index 1d05445..d806497 100644
--- a/drivers/net/wireless/airo.c
+++ b/drivers/net/wireless/airo.c
@@ -3886,8 +3886,7 @@ static u16 setup_card(struct airo_info *ai, u8 *mac, int lock)
 		}
 		if ( basic_rate > 0 ) {
 			for( i = 0; i < 8; i++ ) {
-				if ( ai->config.rates[i] = basic_rate ||
-				     !ai->config.rates ) {
+				if (ai->config.rates[i] = basic_rate) {
 					ai->config.rates[i] = basic_rate | 0x80;
 					break;
 				}
