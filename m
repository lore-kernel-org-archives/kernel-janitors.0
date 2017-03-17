From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Mar 2017 20:46:21 +0000
Subject: [PATCH] crypto: zip - Memory corruption in zip_clear_stats()
Message-Id: <20170317204621.GD16505@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, Mahipal Challa <mahipalreddy2006@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jan Glauber <jglauber@cavium.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a typo here.  It should be "stats" instead of "state".  The
impact is that we clear 224 bytes instead of 80 and we zero out memory
that we shouldn't.

Fixes: 09ae5d37e093 ("crypto: zip - Add Compression/Decompression statistics")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/crypto/cavium/zip/zip_main.c b/drivers/crypto/cavium/zip/zip_main.c
index 0951e20b395b..6ff13d80d82e 100644
--- a/drivers/crypto/cavium/zip/zip_main.c
+++ b/drivers/crypto/cavium/zip/zip_main.c
@@ -530,7 +530,7 @@ static int zip_clear_stats(struct seq_file *s, void *unused)
 	for (index = 0; index < MAX_ZIP_DEVICES; index++) {
 		if (zip_dev[index]) {
 			memset(&zip_dev[index]->stats, 0,
-			       sizeof(struct zip_state));
+			       sizeof(struct zip_stats));
 			seq_printf(s, "Cleared stats for zip %d\n", index);
 		}
 	}
