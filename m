From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jan 2020 00:45:55 +0000
Subject: [PATCH] caif_usb: fix spelling mistake "to" -> "too"
Message-Id: <20200123004555.2833355-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a pr_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/caif/caif_usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/caif/caif_usb.c b/net/caif/caif_usb.c
index 76bd67891fb3..a0116b9503d9 100644
--- a/net/caif/caif_usb.c
+++ b/net/caif/caif_usb.c
@@ -62,7 +62,7 @@ static int cfusbl_transmit(struct cflayer *layr, struct cfpkt *pkt)
 	hpad = (info->hdr_len + CFUSB_PAD_DESCR_SZ) & (CFUSB_ALIGNMENT - 1);
 
 	if (skb_headroom(skb) < ETH_HLEN + CFUSB_PAD_DESCR_SZ + hpad) {
-		pr_warn("Headroom to small\n");
+		pr_warn("Headroom too small\n");
 		kfree_skb(skb);
 		return -EIO;
 	}
-- 
2.24.0
