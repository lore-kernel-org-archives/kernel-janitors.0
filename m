From: Colin King <colin.king@canonical.com>
Date: Thu, 28 May 2020 15:54:43 +0000
Subject: [PATCH][next] modpost: close file when fstat fails
Message-Id: <20200528155443.421933-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently a failed fstat error return path fails to close an open file.
Fix this by setting buf to NULL and returning via the error exit path.

Addresses-Coverity: ("Resource leak");
Fixes: commit 076ad831dfe8 ("modpost: add read_text_file() and get_line() helpers")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 scripts/mod/modpost.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index e4691127f051..3012e5f8ec7e 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -109,8 +109,10 @@ char *read_text_file(const char *filename)
 	if (fd < 0)
 		return NULL;
 
-	if (fstat(fd, &st) < 0)
-		return NULL;
+	if (fstat(fd, &st) < 0) {
+		buf = NULL;
+		goto close;
+	}
 
 	buf = NOFAIL(malloc(st.st_size + 1));
 
-- 
2.25.1
