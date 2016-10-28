From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 28 Oct 2016 08:35:34 +0000
Subject: [PATCH 05/10] scripts/basic/fixdep: Complete error handling in parse_dep_file()
Message-Id: <199fadd4-8066-995a-7558-66b3938b6f73@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
In-Reply-To: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 27 Oct 2016 19:43:43 +0200

Return values were not checked from five calls of the function "printf".

This issue was detected also by using the Coccinelle software.


* Add a bit of exception handling there.

* Combine these calls into three.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/basic/fixdep.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 9a2ff68..5f6a4f4 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -366,14 +366,25 @@ static void parse_dep_file(void *map, size_t len)
 					 */
 					if (!saw_any_target) {
 						saw_any_target = 1;
-						printf("source_%s := %s\n\n",
-							target, s);
-						printf("deps_%s := \\\n",
-							target);
+						if (printf("source_%s := %s\n\n"
+							   "deps_%s := \\\n",
+							   target, s, target)
+						   < 24) {
+							int code = errno;
+
+							perror("fixdep: printf");
+							exit(code);
+						}
 					}
 					is_first_dep = 0;
-				} else
-					printf("  %s \\\n", s);
+				} else {
+					if (printf("  %s \\\n", s) < 5) {
+						int code = errno;
+
+						perror("fixdep: printf");
+						exit(code);
+					}
+				}
 				do_config_file(s);
 			}
 		}
@@ -391,8 +402,13 @@ static void parse_dep_file(void *map, size_t len)
 
 	do_extra_deps();
 
-	printf("\n%s: $(deps_%s)\n\n", target, target);
-	printf("$(deps_%s):\n", target);
+	if (printf("\n%s: $(deps_%s)\n\n"
+		   "$(deps_%s):\n", target, target, target) < 27) {
+		int code = errno;
+
+		perror("fixdep: printf");
+		exit(code);
+	}
 }
 
 static void print_deps(void)
-- 
2.10.1

