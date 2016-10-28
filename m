From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 28 Oct 2016 08:37:50 +0000
Subject: [PATCH 07/10] scripts/basic/fixdep: Fix error log output in do_config_file()
Message-Id: <38828145-ab16-0eda-0f8c-6a9f27cd17bd@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
In-Reply-To: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 27 Oct 2016 22:15:14 +0200

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
index be0fdaa..2c4ec91 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -275,13 +275,15 @@ static void do_config_file(const char *filename)
 
 	fd = open(filename, O_RDONLY);
 	if (fd < 0) {
-		fprintf(stderr, "fixdep: error opening config file: ");
-		perror(filename);
+		(void) fprintf(stderr,
+			       "fixdep: error opening config file: %s: %s\n",
+			       filename, strerror(errno));
 		exit(2);
 	}
 	if (fstat(fd, &st) < 0) {
-		fprintf(stderr, "fixdep: error fstat'ing config file: ");
-		perror(filename);
+		(void) fprintf(stderr,
+			       "fixdep: error fstat'ing config file: %s: %s\n",
+			       filename, strerror(errno));
 		exit(2);
 	}
 	if (st.st_size = 0)
-- 
2.10.1

