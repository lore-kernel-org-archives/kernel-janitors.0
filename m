From: Julia Lawall <julia@diku.dk>
Date: Tue, 05 May 2009 13:22:43 +0000
Subject: p80211wext.c: problem with IW_ENCODE_ALG_WEP
Message-Id: <Pine.LNX.4.64.0905051522010.9552@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: richard@rsk.demon.co.uk, gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The expression !(ext->alg & IW_ENCODE_ALG_WEP) appears to be incorrect,
because there are several possible values for ext->alg that give 1 when
bit-anded with IW_ENCODE_ALG_WEP.  Therefore Richard Kennedy suggested to
rewrite the code with !
Signed-off-by: Julia Lawall <julia@diku.dk>

---
 .../drivers/staging/wlan-ng/p80211wext.c           |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211wext.c b/drivers/staging/wlan-ng/p80211wext.c
index 96078b0..e00e305 100644
--- a/drivers/staging/wlan-ng/p80211wext.c
+++ b/drivers/staging/wlan-ng/p80211wext.c
@@ -1487,7 +1487,7 @@ static int p80211wext_set_encodeext(struct net_device *dev,
 	}
 
 	if (ext->ext_flags & IW_ENCODE_EXT_SET_TX_KEY) {
-		if (!(ext->alg & IW_ENCODE_ALG_WEP)) {
+		if (ext->alg != IW_ENCODE_ALG_WEP) {
 			pr_debug("asked to set a non wep key :(");
 			return -EINVAL;
 		}
