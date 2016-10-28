From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 28 Oct 2016 08:39:11 +0000
Subject: [PATCH 08/10] scripts/basic/fixdep: Complete error handling in print_config()
Message-Id: <11b02385-965b-c9ca-c564-0df7757f8145@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
In-Reply-To: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 27 Oct 2016 22:45:03 +0200

Return values were not checked from calls of the function "printf"
and "putchar".

This issue was detected also by using the Coccinelle software.

* Add a bit of exception handling there.

* Optimise this function implementation a bit by replacing two output calls
  with the functions "fputs" and "puts".

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/basic/fixdep.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 2c4ec91..f5ff6eea 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -142,16 +142,26 @@ static void print_config(const char *m, int slen)
 {
 	int c, i;
 
-	printf("    $(wildcard include/config/");
+	if (fputs("    $(wildcard include/config/", stdout) < 0)
+		goto put_failure;
 	for (i = 0; i < slen; i++) {
 		c = m[i];
 		if (c = '_')
 			c = '/';
 		else
 			c = tolower(c);
-		putchar(c);
+		if (putchar(c) = EOF)
+			goto put_failure;
+	}
+	if (puts(".h) \\") < 0) {
+put_failure:
+		{
+			int code = errno;
+
+			perror("fixdep: print_config");
+			exit(code);
+		}
 	}
-	printf(".h) \\\n");
 }
 
 static void do_extra_deps(void)
-- 
2.10.1

