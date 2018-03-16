From: Colin King <colin.king@canonical.com>
Date: Fri, 16 Mar 2018 14:23:40 +0000
Subject: [PATCH][next] selftests: fix spelling mistake: "desciptor" -> "descriptor"
Message-Id: <20180316142340.11346-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in error message text and re-adjust
break in literal string to fit into 80 char wide format.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/testing/selftests/filesystems/devpts_pts.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/filesystems/devpts_pts.c b/tools/testing/selftests/filesystems/devpts_pts.c
index b9055e974289..32addb696150 100644
--- a/tools/testing/selftests/filesystems/devpts_pts.c
+++ b/tools/testing/selftests/filesystems/devpts_pts.c
@@ -279,8 +279,8 @@ int main(int argc, char *argv[])
 	int ret;
 
 	if (!isatty(STDIN_FILENO)) {
-		fprintf(stderr, "Standard input file desciptor is not attached "
-				"to a terminal. Skipping test\n");
+		fprintf(stderr, "Standard input file descriptor is not "
+				"attached to a terminal. Skipping test\n");
 		exit(EXIT_FAILURE);
 	}
 
-- 
2.15.1

