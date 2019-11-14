From: Colin King <colin.king@canonical.com>
Date: Thu, 14 Nov 2019 09:57:47 +0000
Subject: [PATCH] staging: rtl8723bs: fix indentation issue
Message-Id: <20191114095747.132407-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Javier F . Arias" <jarias.linux@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a block of statements that are indented
too deeply, remove the extraneous tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 5aa5910687d1..9c4607114cea 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1621,12 +1621,12 @@ static sint aes_decipher(u8 *key, uint	hdrlen,
 				      pn_vector, i + 1,
 				      frtype); /*  add for CONFIG_IEEE80211W, none 11w also can use */
 
-			aes128k128d(key, ctr_preload, aes_out);
-			bitwise_xor(aes_out, &pframe[payload_index], chain_buffer);
+		aes128k128d(key, ctr_preload, aes_out);
+		bitwise_xor(aes_out, &pframe[payload_index], chain_buffer);
 
-			for (j = 0; j < 16; j++)
-				pframe[payload_index++] = chain_buffer[j];
-		}
+		for (j = 0; j < 16; j++)
+			pframe[payload_index++] = chain_buffer[j];
+	}
 
 	if (payload_remainder > 0) {
 		/* If there is a short final block, then pad it,*/
-- 
2.20.1
