From: Colin King <colin.king@canonical.com>
Date: Sat, 26 May 2018 15:06:50 +0000
Subject: [PATCH] 9p: fix spelling mistake "Uknown" -> "Unknown"
Message-Id: <20180526150650.10562-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Van Hensbergen <ericvh@gmail.com>, Ron Minnich <rminnich@sandia.gov>, Latchesar Ionkov <lucho@ionkov.net>, v9fs-developer@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in pr_info message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/9p/v9fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/9p/v9fs.c b/fs/9p/v9fs.c
index 0429c8ee58f1..89bac3d2f05b 100644
--- a/fs/9p/v9fs.c
+++ b/fs/9p/v9fs.c
@@ -343,7 +343,7 @@ static int v9fs_parse_options(struct v9fs_session_info *v9ses, char *opts)
 				v9ses->uid = make_kuid(current_user_ns(), uid);
 				if (!uid_valid(v9ses->uid)) {
 					ret = -EINVAL;
-					pr_info("Uknown uid %s\n", s);
+					pr_info("Unknown uid %s\n", s);
 				}
 			}
 
-- 
2.17.0

