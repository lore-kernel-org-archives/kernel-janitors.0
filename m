From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 28 Oct 2016 08:34:28 +0000
Subject: [PATCH 04/10] scripts/basic/fixdep: Fix error log output in print_deps()
Message-Id: <afce4a5b-0bd1-c887-9fcf-046dac0d3927@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
In-Reply-To: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 27 Oct 2016 19:04:01 +0200

The function "perror" was called after a call of the function "fprintf"
in two if branches. So it could happen that an error message was displayed
for a failed print operation instead of the failure according to the call
of the function "fstat" or "open" here.

* Pass the relevant error data in the logging calls directly.

* Express that the corresponding return values are intentionally unused
  by casts to void.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/basic/fixdep.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 0dcec29..9a2ff68 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -403,13 +403,15 @@ static void print_deps(void)
 
 	fd = open(depfile, O_RDONLY);
 	if (fd < 0) {
-		fprintf(stderr, "fixdep: error opening depfile: ");
-		perror(depfile);
+		(void) fprintf(stderr,
+			       "fixdep: error opening depfile: %s: %s\n",
+			       depfile, strerror(errno));
 		exit(2);
 	}
 	if (fstat(fd, &st) < 0) {
-		fprintf(stderr, "fixdep: error fstat'ing depfile: ");
-		perror(depfile);
+		(void) fprintf(stderr,
+			       "fixdep: error fstat'ing depfile: %s: %s\n",
+			       depfile, strerror(errno));
 		exit(2);
 	}
 	if (st.st_size = 0) {
-- 
2.10.1

