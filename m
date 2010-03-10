From: Dan Carpenter <error27@gmail.com>
Date: Wed, 10 Mar 2010 09:54:30 +0000
Subject: [patch] rt2860: clean up & => &&
Message-Id: <20100310095430.GB6321@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

a4_exists is an integer used as a boolean type so the original code 
works.  But all the other conditions use && and this makes it 
consistent.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/rt2860/common/cmm_aes.c b/drivers/staging/rt2860/common/cmm_aes.c
index 250357c..1d159ff 100644
--- a/drivers/staging/rt2860/common/cmm_aes.c
+++ b/drivers/staging/rt2860/common/cmm_aes.c
@@ -281,7 +281,7 @@ void construct_mic_header2(unsigned char *mic_header2,
 	mic_header2[6] = mpdu[22] & 0x0f;	/* SC */
 	mic_header2[7] = 0x00;	/* mpdu[23]; */
 
-	if ((!qc_exists) & a4_exists) {
+	if ((!qc_exists) && a4_exists) {
 		for (i = 0; i < 6; i++)
 			mic_header2[8 + i] = mpdu[24 + i];	/* A4 */
 
