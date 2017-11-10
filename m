From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 10 Nov 2017 12:50:31 +0000
Subject: [PATCH 4/4] ASN.1: Use common error handling code in main()
Message-Id: <2dc2d07b-b816-c8fa-9e18-a9b2f0c33d61@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <960a8501-03b0-95d9-c2bf-4633e48e73a6@users.sourceforge.net>
In-Reply-To: <960a8501-03b0-95d9-c2bf-4633e48e73a6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 10 Nov 2017 13:31:22 +0100

* Add jump targets so that a bit of exception handling can be better reused
  in this function implementation.

* Replace ten calls of the function "exit" by goto statements.

* Replace two function calls by return statements.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/asn1_compiler.c | 66 ++++++++++++++++++++++++-------------------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/scripts/asn1_compiler.c b/scripts/asn1_compiler.c
index 06dc5397d8c8..4df8d0b85d3c 100644
--- a/scripts/asn1_compiler.c
+++ b/scripts/asn1_compiler.c
@@ -568,6 +568,7 @@ int main(int argc, char **argv)
 	FILE *out, *hdr;
 	char *buffer, *p;
 	char *kbuild_verbose;
+	char const *hint;
 	int fd;
 
 	kbuild_verbose = getenv("KBUILD_VERBOSE");
@@ -588,7 +589,7 @@ int main(int argc, char **argv)
 	if (argc != 4) {
 		fprintf(stderr, "Format: %s [-v] [-d] <grammar-file> <c-file> <hdr-file>\n",
 			argv[0]);
-		exit(2);
+		return 2;
 	}
 
 	filename = argv[1];
@@ -596,44 +597,39 @@ int main(int argc, char **argv)
 	headername = argv[3];
 
 	fd = open(filename, O_RDONLY);
-	if (fd < 0) {
-		perror(filename);
-		exit(1);
-	}
+	if (fd < 0)
+		goto report_file_failure;
 
-	if (fstat(fd, &st) < 0) {
-		perror(filename);
-		exit(1);
-	}
+	if (fstat(fd, &st) < 0)
+		goto report_file_failure;
 
 	buffer = malloc(st.st_size + 1);
 	if (!buffer) {
-		perror(NULL);
-		exit(1);
+		hint = NULL;
+		goto report_failure;
 	}
 
 	readlen = read(fd, buffer, st.st_size);
-	if (readlen < 0) {
-		perror(filename);
-		exit(1);
-	}
+	if (readlen < 0)
+		goto report_file_failure;
 
 	if (close(fd) < 0) {
-		perror(filename);
-		exit(1);
+report_file_failure:
+		hint = filename;
+		goto report_failure;
 	}
 
 	if (readlen != st.st_size) {
 		fprintf(stderr, "%s: Short read\n", filename);
-		exit(1);
+		return 1;
 	}
 
 	p = strrchr(argv[1], '/');
 	p = p ? p + 1 : argv[1];
 	grammar_name = strdup(p);
 	if (!p) {
-		perror(NULL);
-		exit(1);
+		hint = NULL;
+		goto report_failure;
 	}
 	p = strchr(grammar_name, '.');
 	if (p)
@@ -646,30 +642,32 @@ int main(int argc, char **argv)
 	dump_elements();
 
 	out = fopen(outputname, "w");
-	if (!out) {
-		perror(outputname);
-		exit(1);
-	}
+	if (!out)
+		goto report_output_failure;
 
 	hdr = fopen(headername, "w");
-	if (!hdr) {
-		perror(headername);
-		exit(1);
-	}
+	if (!hdr)
+		goto report_header_failure;
 
 	render(out, hdr);
 
-	if (fclose(out) < 0) {
-		perror(outputname);
-		exit(1);
+	if (fclose(hdr) < 0) {
+report_header_failure:
+		hint = headername;
+		goto report_failure;
 	}
 
-	if (fclose(hdr) < 0) {
-		perror(headername);
-		exit(1);
+	if (fclose(out) < 0) {
+report_output_failure:
+		hint = outputname;
+		goto report_failure;
 	}
 
 	return 0;
+
+report_failure:
+	perror(hint);
+	return 1;
 }
 
 enum compound {
-- 
2.15.0

