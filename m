From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 01 Feb 2015 20:50:47 +0000
Subject: [patch] CacheFiles: delete unused code in cachefiles_cook_key()
Message-Id: <20150201205047.GA29298@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This code was presumably left over from previuos unpublished versions.

We set "len" twice to 0 and then to 5 a couple lines below.  We set
"seg" to 250 or 252, then check if it is less than zero (it isn't) so
I have deleted all the "seg" related code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/cachefiles/key.c b/fs/cachefiles/key.c
index 33b58c6..a163723 100644
--- a/fs/cachefiles/key.c
+++ b/fs/cachefiles/key.c
@@ -39,7 +39,7 @@ char *cachefiles_cook_key(const u8 *raw, int keylen, uint8_t type)
 	unsigned char csum, ch;
 	unsigned int acc;
 	char *key;
-	int loop, len, max, seg, mark, print;
+	int loop, len, max, mark, print;
 
 	_enter(",%d", keylen);
 
@@ -82,8 +82,6 @@ char *cachefiles_cook_key(const u8 *raw, int keylen, uint8_t type)
 	if (!key)
 		return NULL;
 
-	len = 0;
-
 	/* build the cooked key */
 	sprintf(key, "@%02x%c+", (unsigned) csum, 0);
 	len = 5;
@@ -98,15 +96,7 @@ char *cachefiles_cook_key(const u8 *raw, int keylen, uint8_t type)
 		key[len] = cachefiles_charmap[acc & 63];
 		len += 2;
 
-		seg = 250;
 		for (loop = keylen; loop > 0; loop--) {
-			if (seg <= 0) {
-				key[len++] = '\0';
-				mark = len;
-				key[len++] = '+';
-				seg = 252;
-			}
-
 			key[len++] = *raw++;
 			ASSERT(len < max);
 		}
@@ -117,15 +107,7 @@ char *cachefiles_cook_key(const u8 *raw, int keylen, uint8_t type)
 		default:				type = 'S';	break;
 		}
 	} else {
-		seg = 252;
 		for (loop = keylen; loop > 0; loop--) {
-			if (seg <= 0) {
-				key[len++] = '\0';
-				mark = len;
-				key[len++] = '+';
-				seg = 252;
-			}
-
 			acc = *raw++;
 			acc |= *raw++ << 8;
 			acc |= *raw++ << 16;
