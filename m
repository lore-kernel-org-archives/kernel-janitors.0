From: Julia Lawall <julia@diku.dk>
Date: Tue, 05 May 2009 13:47:06 +0000
Subject: Re: p80211wext.c: problem with IW_ENCODE_ALG_WEP
Message-Id: <Pine.LNX.4.64.0905051545450.9552@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0905051522010.9552@pc-004.diku.dk>
 <4A004088.7000907@gmail.com>
In-Reply-To: <4A004088.7000907@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jirislaby@gmail.com>
Cc: richard@rsk.demon.co.uk, gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The expression !(ext->alg & IW_ENCODE_ALG_WEP) appears to be incorrect,
because there are several possible values for ext->alg that give 1 when
bit-anded with IW_ENCODE_ALG_WEP.  Therefore Richard Kennedy suggested to
rewrite the code with !
Added \n at the end of the debug string as well.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/wlan-ng/p80211wext.c           |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211wext.c b/drivers/staging/wlan-ng/p80211wext.c
index 96078b0..74eac34 100644
--- a/drivers/staging/wlan-ng/p80211wext.c
+++ b/drivers/staging/wlan-ng/p80211wext.c
@@ -1487,8 +1487,8 @@ static int p80211wext_set_encodeext(struct net_device *dev,
 	}
 
 	if (ext->ext_flags & IW_ENCODE_EXT_SET_TX_KEY) {
-		if (!(ext->alg & IW_ENCODE_ALG_WEP)) {
-			pr_debug("asked to set a non wep key :(");
+		if (ext->alg != IW_ENCODE_ALG_WEP) {
+			pr_debug("asked to set a non wep key :(\n");
 			return -EINVAL;
 		}
 		if (idx) {
