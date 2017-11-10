From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 10 Nov 2017 12:49:13 +0000
Subject: [PATCH 3/4] ASN.1: Improve exiting from build_type_list()
Message-Id: <3a3b73b2-0164-5de8-5540-9d1d25af7018@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <960a8501-03b0-95d9-c2bf-4633e48e73a6@users.sourceforge.net>
In-Reply-To: <960a8501-03b0-95d9-c2bf-4633e48e73a6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 10 Nov 2017 12:56:33 +0100

* Add jump targets so that a call of the function "perror" and "exit"
  is stored only once in an if branch of this function.

* Replace two calls by goto statements.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/asn1_compiler.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/scripts/asn1_compiler.c b/scripts/asn1_compiler.c
index 0eea270fcaef..06dc5397d8c8 100644
--- a/scripts/asn1_compiler.c
+++ b/scripts/asn1_compiler.c
@@ -762,18 +762,19 @@ static void build_type_list(void)
 
 	if (nr = 0) {
 		fprintf(stderr, "%s: No defined types\n", filename);
-		exit(1);
+		goto exit;
 	}
 
 	nr_types = nr;
 	types = type_list = calloc(nr + 1, sizeof(type_list[0]));
-	if (!type_list) {
-		perror(NULL);
-		exit(1);
-	}
+	if (!type_list)
+		goto report_failure;
+
 	type_index = calloc(nr, sizeof(type_index[0]));
 	if (!type_index) {
+report_failure:
 		perror(NULL);
+exit:
 		exit(1);
 	}
 
-- 
2.15.0

