From: Colin King <colin.king@canonical.com>
Date: Tue, 27 Aug 2019 11:47:39 +0000
Subject: [PATCH] wimax/i2400m: remove redundant assignment to variable result
Message-Id: <20190827114739.27305-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>, linux-wimax@intel.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable result is being assigned a value that is never read and result
is being re-assigned a little later on. The assignment is redundant
and hence can be removed.

Addresses-Coverity: ("Ununsed value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wimax/i2400m/rx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wimax/i2400m/rx.c b/drivers/net/wimax/i2400m/rx.c
index d28b96d06919..c9fb619a9e01 100644
--- a/drivers/net/wimax/i2400m/rx.c
+++ b/drivers/net/wimax/i2400m/rx.c
@@ -1253,7 +1253,6 @@ int i2400m_rx(struct i2400m *i2400m, struct sk_buff *skb)
 	skb_len = skb->len;
 	d_fnstart(4, dev, "(i2400m %p skb %p [size %u])\n",
 		  i2400m, skb, skb_len);
-	result = -EIO;
 	msg_hdr = (void *) skb->data;
 	result = i2400m_rx_msg_hdr_check(i2400m, msg_hdr, skb_len);
 	if (result < 0)
-- 
2.20.1
