From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 29 Apr 2014 12:41:01 +0000
Subject: [patch] staging: r8188eu: indent for loop body
Message-Id: <20140429124101.GB18437@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The for loop body wasn't indented so it upset my static checker.  Also
I removed an obsolete comment on the same line.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8188eu/core/rtw_security.c b/drivers/staging/rtl8188eu/core/rtw_security.c
index c4b16ea..0533595 100644
--- a/drivers/staging/rtl8188eu/core/rtw_security.c
+++ b/drivers/staging/rtl8188eu/core/rtw_security.c
@@ -1153,7 +1153,7 @@ static int aes_cipher(u8 *key, uint hdrlen, u8 *pframe, uint plen)
 
 	/* Insert MIC into payload */
 	for (j = 0; j < 8; j++)
-	pframe[payload_index+j] = mic[j];	/* message[payload_index+j] = mic[j]; */
+		pframe[payload_index+j] = mic[j];
 
 	payload_index = hdrlen + 8;
 	for (i = 0; i < num_blocks; i++) {
