From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 28 Oct 2016 08:31:31 +0000
Subject: [PATCH 01/10] scripts/basic/bin2c: Complete error handling in main()
Message-Id: <44402655-ef0d-1e2f-0587-f17295a08aa3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
In-Reply-To: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 27 Oct 2016 16:15:04 +0200

Return values were not checked from five calls of the function "printf".

This issue was detected also by using the Coccinelle software.


* Add a bit of exception handling there.

* Optimise this function implementation a bit.

  - Replace two output calls with the functions "fputs" and "puts".

  - Use the preincrement operator for the variable "total".

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/basic/bin2c.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/scripts/basic/bin2c.c b/scripts/basic/bin2c.c
index c3d7eef..c6c8860 100644
--- a/scripts/basic/bin2c.c
+++ b/scripts/basic/bin2c.c
@@ -8,29 +8,35 @@
  */
 
 #include <stdio.h>
+#include <errno.h>
 
 int main(int argc, char *argv[])
 {
 	int ch, total = 0;
 
 	if (argc > 1)
-		printf("const char %s[] %s=\n",
-			argv[1], argc > 2 ? argv[2] : "");
+		if (printf("const char %s[] %s=\n",
+			   argv[1], argc > 2 ? argv[2] : "") < 16)
+			return errno;
 
 	do {
-		printf("\t\"");
+		if (fputs("\t\"", stdout) < 0)
+			return errno;
+
 		while ((ch = getchar()) != EOF) {
-			total++;
-			printf("\\x%02x", ch);
-			if (total % 16 = 0)
+			if (printf("\\x%02x", ch) < 4)
+				return errno;
+			if (++total % 16 = 0)
 				break;
 		}
-		printf("\"\n");
+
+		if (puts("\"") < 0)
+			return errno;
 	} while (ch != EOF);
 
 	if (argc > 1)
-		printf("\t;\n\n#include <linux/types.h>\n\nconst size_t %s_size = %d;\n",
-		       argv[1], total);
-
+		if (printf("\t;\n\n#include <linux/types.h>\n\nconst size_t %s_size = %d;\n",
+			   argv[1], total) < 54)
+			return errno;
 	return 0;
 }
-- 
2.10.1

