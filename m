From: Colin King <colin.king@canonical.com>
Date: Tue, 21 Mar 2017 16:44:39 +0000
Subject: [PATCH] gen_init_cpio: allocate enough space for dname
Message-Id: <20170321164439.30828-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The allocation of dname is short by 1 byte, so increase the allocation
size.

Detected with CoverityScan, CID#711628 ("Out-of-bounds-access (OVERRUN)")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 usr/gen_init_cpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
index 225ad244cf88..981682f4faea 100644
--- a/usr/gen_init_cpio.c
+++ b/usr/gen_init_cpio.c
@@ -418,7 +418,7 @@ static int cpio_mkfile_line(const char *line)
 		int len;
 		int nend;
 
-		dname = malloc(strlen(line));
+		dname = malloc(strlen(line) + 1);
 		if (!dname) {
 			fprintf (stderr, "out of memory (%d)\n", dname_len);
 			goto fail;
-- 
2.11.0

