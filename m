From: Dan Carpenter <error27@gmail.com>
Date: Tue, 15 Mar 2011 06:59:55 +0000
Subject: [patch] crypto: caam - ARRAY_SIZE() vs sizeof()
Message-Id: <20110315065955.GP2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, Steve Cornelius <sec@pobox.com>, Kim Phillips <kim.phillips@freescale.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

ARRAY_SIZE() was intended here instead of sizeof().  sizeof() is four
times larger than ARRAY_SIZE().  outstr is normally 256 chars so 
printing garbage to it could overfill the buffer and corrupt memory.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/crypto/caam/error.c b/drivers/crypto/caam/error.c
index bd57a68..7e2d54b 100644
--- a/drivers/crypto/caam/error.c
+++ b/drivers/crypto/caam/error.c
@@ -73,7 +73,7 @@ static void report_ccb_status(u32 status, char *outstr)
 
 	report_jump_idx(status, outstr);
 
-	if (cha_id < sizeof(cha_id_list)) {
+	if (cha_id < ARRAY_SIZE(cha_id_list)) {
 		SPRINTFCAT(outstr, "%s: ", cha_id_list[cha_id],
 			   strlen(cha_id_list[cha_id]));
 	} else {
@@ -81,7 +81,7 @@ static void report_ccb_status(u32 status, char *outstr)
 			   cha_id, sizeof("ff"));
 	}
 
-	if (err_id < sizeof(err_id_list)) {
+	if (err_id < ARRAY_SIZE(err_id_list)) {
 		SPRINTFCAT(outstr, "%s", err_id_list[err_id],
 			   strlen(err_id_list[err_id]));
 	} else {
@@ -198,11 +198,11 @@ static void report_deco_status(u32 status, char *outstr)
 
 	report_jump_idx(status, outstr);
 
-	for (i = 0; i < sizeof(desc_error_list); i++)
+	for (i = 0; i < ARRAY_SIZE(desc_error_list); i++)
 		if (desc_error_list[i].value = desc_error)
 			break;
 
-	if (i != sizeof(desc_error_list) && desc_error_list[i].error_text) {
+	if (i != ARRAY_SIZE(desc_error_list) && desc_error_list[i].error_text) {
 		SPRINTFCAT(outstr, "%s", desc_error_list[i].error_text,
 			   strlen(desc_error_list[i].error_text));
 	} else {
