From: Colin King <colin.king@canonical.com>
Date: Fri, 22 Sep 2017 15:20:18 +0000
Subject: [PATCH] staging: rtl8192e: make const array broadcast_addr static, reduces object code size
Message-Id: <20170922152018.14838-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S . Miller" <davem@davemloft.net>, Malcolm Priestley <tvboxspy@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate const array broadcast_addr on the stack, instead make it
static. Makes the object code smaller by over 40 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  63906	   8248	   1216	  73370	  11e9a	rtllib_softmac.o

After:
   text	   data	    bss	    dec	    hex	filename
  63806	   8304	   1216	  73326	  11e6e	rtllib_softmac.o

(gcc 6.3.0, x86-64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index e4be85af31e7..1e308dfd7f74 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2811,8 +2811,9 @@ static void rtllib_associate_retry_wq(void *data)
 
 static struct sk_buff *rtllib_get_beacon_(struct rtllib_device *ieee)
 {
-	const u8 broadcast_addr[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
-
+	static const u8 broadcast_addr[] = {
+		0xff, 0xff, 0xff, 0xff, 0xff, 0xff
+	};
 	struct sk_buff *skb;
 	struct rtllib_probe_response *b;
 
-- 
2.14.1

