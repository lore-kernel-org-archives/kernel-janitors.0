From: Colin King <colin.king@canonical.com>
Date: Mon, 06 Mar 2017 19:32:13 +0000
Subject: [PATCH][RESEND] ecryptfs: fix spelling mistake: "cadidate" -> "candidate"
Message-Id: <20170306193213.6826-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tyler Hicks <tyhicks@canonical.com>, ecryptfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

trivial fix to spelling mistake in ecryptfs_printk message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ecryptfs/keystore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 11d39ab..4bd9099 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -1890,7 +1890,7 @@ int ecryptfs_parse_packet_set(struct ecryptfs_crypt_stat *crypt_stat,
 		candidate_auth_tok = &auth_tok_list_item->auth_tok;
 		if (unlikely(ecryptfs_verbosity > 0)) {
 			ecryptfs_printk(KERN_DEBUG,
-					"Considering cadidate auth tok:\n");
+					"Considering candidate auth tok:\n");
 			ecryptfs_dump_auth_tok(candidate_auth_tok);
 		}
 		rc = ecryptfs_get_auth_tok_sig(&candidate_auth_tok_sig,
-- 
2.10.2

