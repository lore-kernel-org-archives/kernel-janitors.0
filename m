From: Colin King <colin.king@canonical.com>
Date: Thu, 19 Oct 2017 13:46:22 +0000
Subject: [PATCH] iio: adc: make array ch_to_mux static, makes object code smaller
Message-Id: <20171019134622.31712-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate const array ch_to_mux on the stack, instead
make it static. Makes the object code smaller by over 200 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  12663	   1648	    128	  14439	   3867	drivers/iio/adc/ti-adc12138.o

After
   text	   data	    bss	    dec	    hex	filename
  12353	   1744	    128	  14225	   3791	drivers/iio/adc/ti-adc12138.o

(gcc version 7.2.0 x86_64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iio/adc/ti-adc12138.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ti-adc12138.c b/drivers/iio/adc/ti-adc12138.c
index bf890244789a..703d68ae96b7 100644
--- a/drivers/iio/adc/ti-adc12138.c
+++ b/drivers/iio/adc/ti-adc12138.c
@@ -164,7 +164,7 @@ static int __adc12138_start_conv(struct adc12138 *adc,
 				 void *data, int len)
 
 {
-	const u8 ch_to_mux[] = { 0, 4, 1, 5, 2, 6, 3, 7 };
+	static const u8 ch_to_mux[] = { 0, 4, 1, 5, 2, 6, 3, 7 };
 	u8 mode = (ch_to_mux[channel->channel] << 4) |
 		  (channel->differential ? 0 : 0x80);
 
-- 
2.14.1

