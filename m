From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 28 Oct 2016 08:40:30 +0000
Subject: [PATCH 09/10] scripts/basic/fixdep: Complete error handling in print_cmdline()
Message-Id: <d4bd9a09-d413-a073-c2d5-67933d425b87@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
In-Reply-To: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 28 Oct 2016 09:29:59 +0200

A return value was not checked from a call of the function "printf".

This issue was detected also by using the Coccinelle software.


Add a bit of exception handling there.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/basic/fixdep.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index f5ff6eea..911347a 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -132,7 +132,12 @@ static void usage(void)
  */
 static void print_cmdline(void)
 {
-	printf("cmd_%s := %s\n\n", target, cmdline);
+	if (printf("cmd_%s := %s\n\n", target, cmdline) < 10) {
+		int code = errno;
+
+		perror("fixdep: print_cmdline");
+		exit(code);
+	}
 }
 
 /*
-- 
2.10.1

