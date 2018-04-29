From: Colin King <colin.king@canonical.com>
Date: Sun, 29 Apr 2018 11:54:25 +0000
Subject: [PATCH] selftests: fix spelling mistake: "desciptor" -> "descriptor"
Message-Id: <20180429115425.9378-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/testing/selftests/filesystems/devpts_pts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filesystems/devpts_pts.c b/tools/testing/selftests/filesystems/devpts_pts.c
index b9055e974289..ea5de8271521 100644
--- a/tools/testing/selftests/filesystems/devpts_pts.c
+++ b/tools/testing/selftests/filesystems/devpts_pts.c
@@ -279,7 +279,7 @@ int main(int argc, char *argv[])
 	int ret;
 
 	if (!isatty(STDIN_FILENO)) {
-		fprintf(stderr, "Standard input file desciptor is not attached "
+		fprintf(stderr, "Standard input file descriptor is not attached "
 				"to a terminal. Skipping test\n");
 		exit(EXIT_FAILURE);
 	}
-- 
2.17.0

