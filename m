From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 10 Nov 2017 12:46:53 +0000
Subject: [PATCH 1/4] ASN.1: Adjust two function calls together with a variable assignment
Message-Id: <c0d17452-f622-a4b0-d5c2-0c5fa85d8b1a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <960a8501-03b0-95d9-c2bf-4633e48e73a6@users.sourceforge.net>
In-Reply-To: <960a8501-03b0-95d9-c2bf-4633e48e73a6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 10 Nov 2017 10:40:17 +0100

The script "checkpatch.pl" pointed information out like the following.

ERROR: do not use assignment in if condition

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/asn1_compiler.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/asn1_compiler.c b/scripts/asn1_compiler.c
index c1b7ef3e24c1..e37e5ef3fabb 100644
--- a/scripts/asn1_compiler.c
+++ b/scripts/asn1_compiler.c
@@ -606,12 +606,14 @@ int main(int argc, char **argv)
 		exit(1);
 	}
 
-	if (!(buffer = malloc(st.st_size + 1))) {
+	buffer = malloc(st.st_size + 1);
+	if (!buffer) {
 		perror(NULL);
 		exit(1);
 	}
 
-	if ((readlen = read(fd, buffer, st.st_size)) < 0) {
+	readlen = read(fd, buffer, st.st_size);
+	if (readlen < 0) {
 		perror(filename);
 		exit(1);
 	}
-- 
2.15.0

