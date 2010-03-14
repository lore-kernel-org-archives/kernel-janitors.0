From: Christoph Fritz <chf.fritz@googlemail.com>
Date: Sun, 14 Mar 2010 18:28:28 +0000
Subject: [PATCH] mkpiggy.c fixes compiler warning
Message-Id: <1268591308.6104.6.camel@lovely>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

fixes compiler warning (ignoring return value of 'fread', declared with
attribute warn_unused_result) and fseek error returns now


Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 arch/x86/boot/compressed/mkpiggy.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/arch/x86/boot/compressed/mkpiggy.c b/arch/x86/boot/compressed/mkpiggy.c
index bcbd36c..78d14d2 100644
--- a/arch/x86/boot/compressed/mkpiggy.c
+++ b/arch/x86/boot/compressed/mkpiggy.c
@@ -61,8 +61,12 @@ int main(int argc, char *argv[])
 
 	if (fseek(f, -4L, SEEK_END)) {
 		perror(argv[1]);
+		return 1;
+	}
+	if (fread(&olen, sizeof olen, 1, f) != 1) {
+		perror(argv[1]);
+		return 1;
 	}
-	fread(&olen, sizeof olen, 1, f);
 	ilen = ftell(f);
 	olen = getle32(&olen);
 	fclose(f);
-- 
1.5.6.5



