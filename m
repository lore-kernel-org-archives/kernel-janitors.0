From: Colin King <colin.king@canonical.com>
Date: Tue, 04 Sep 2018 15:47:07 +0000
Subject: [PATCH] staging: most: net: make array 'broadcast' static, shrinks object size
Message-Id: <20180904154707.27452-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Gromm <christian.gromm@microchip.com>, George Edward Bulmer <gebulmer@googlemail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array 'broadcast' on the stack but instead make it
static. Makes the object code smaller by 53 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  10511	   1521	    448	  12480	   30c0	drivers/staging/most/net/net.o

After:
   text	   data	    bss	    dec	    hex	filename
  10394	   1585	    448	  12427	   308b	drivers/staging/most/net/net.o

(gcc version 8.2.0 x86_64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/most/net/net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/net/net.c b/drivers/staging/most/net/net.c
index 30d816b7e165..e20584b1b112 100644
--- a/drivers/staging/most/net/net.c
+++ b/drivers/staging/most/net/net.c
@@ -75,7 +75,7 @@ static struct core_component comp;
 static int skb_to_mamac(const struct sk_buff *skb, struct mbo *mbo)
 {
 	u8 *buff = mbo->virt_address;
-	const u8 broadcast[] = { 0x03, 0xFF };
+	static const u8 broadcast[] = { 0x03, 0xFF };
 	const u8 *dest_addr = skb->data + 4;
 	const u8 *eth_type = skb->data + 12;
 	unsigned int payload_len = skb->len - ETH_HLEN;
-- 
2.17.1
