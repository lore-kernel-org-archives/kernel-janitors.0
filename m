From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 24 Dec 2015 12:38:01 +0000
Subject: [PATCH 3/3] Documentation-getdelays: Less function calls in usage()
Message-Id: <567BE729.7030800@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <567BE5AA.6070607@users.sourceforge.net>
In-Reply-To: <567BE5AA.6070607@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 24 Dec 2015 13:10:19 +0100

A single call of the fprintf() function is sufficient for the desired
display of the usage information.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 Documentation/accounting/getdelays.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/accounting/getdelays.c b/Documentation/accounting/getdelays.c
index 9ca318d..1ad3de8 100644
--- a/Documentation/accounting/getdelays.c
+++ b/Documentation/accounting/getdelays.c
@@ -74,12 +74,12 @@ char cpumask[100+6*MAX_CPUS];
 static void usage(void)
 {
 	fprintf(stderr, "getdelays [-dilv] [-w logfile] [-r bufsize] "
-			"[-m cpumask] [-t tgid] [-p pid]\n");
-	fprintf(stderr, "  -d: print delayacct stats\n");
-	fprintf(stderr, "  -i: print IO accounting (works only with -p)\n");
-	fprintf(stderr, "  -l: listen forever\n");
-	fprintf(stderr, "  -v: debug on\n");
-	fprintf(stderr, "  -C: container path\n");
+			"[-m cpumask] [-t tgid] [-p pid]\n"
+			"  -d: print delayacct stats\n"
+			"  -i: print IO accounting (works only with -p)\n"
+			"  -l: listen forever\n"
+			"  -v: debug on\n"
+			"  -C: container path\n");
 }
 
 /*
-- 
2.6.3

