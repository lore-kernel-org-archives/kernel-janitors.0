From: Colin King <colin.king@canonical.com>
Date: Fri, 06 Sep 2019 13:58:07 +0000
Subject: [PATCH] unicode: make array 'token' static const, makes object smaller
Message-Id: <20190906135807.23152-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gabriel Krisman Bertazi <krisman@collabora.com>, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array 'token' on the stack but instead make it
static const. Makes the object code smaller by 234 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
   5371	    272	      0	   5643	   160b	fs/unicode/utf8-core.o

After:
   text	   data	    bss	    dec	    hex	filename
   5041	    368	      0	   5409	   1521	fs/unicode/utf8-core.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/unicode/utf8-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/unicode/utf8-core.c b/fs/unicode/utf8-core.c
index 71ca4d047d65..2a878b739115 100644
--- a/fs/unicode/utf8-core.c
+++ b/fs/unicode/utf8-core.c
@@ -154,7 +154,7 @@ static int utf8_parse_version(const char *version, unsigned int *maj,
 {
 	substring_t args[3];
 	char version_string[12];
-	const struct match_token token[] = {
+	static const struct match_token token[] = {
 		{1, "%d.%d.%d"},
 		{0, NULL}
 	};
-- 
2.20.1
