From: Saurabh Badhwar <sbsaurabhbadhwar9@gmail.com>
Date: Sun, 19 Feb 2017 05:50:16 +0000
Subject: [PATCH] tools/vm: Fix possible resource leak in page_owner_sort.c
Message-Id: <20170219054949.GA2754@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

Fix possible resource leak in tools/vm/page_owner_sort.c
Signed-off-by: Saurabh Badhwar <sbsaurabhbadhwar9@gmail.com>
---
 tools/vm/page_owner_sort.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/vm/page_owner_sort.c b/tools/vm/page_owner_sort.c
index f1c055f..8346261 100644
--- a/tools/vm/page_owner_sort.c
+++ b/tools/vm/page_owner_sort.c
@@ -110,6 +110,8 @@ int main(int argc, char **argv)
 	buf = malloc(BUF_SIZE);
 	if (!list || !buf) {
 		printf("Out of memory\n");
+		fclose(fin);
+		fclose(fout);
 		exit(1);
 	}
 
@@ -144,6 +146,7 @@ int main(int argc, char **argv)
 
 	for (i = 0; i < count; i++)
 		fprintf(fout, "%d times:\n%s\n", list2[i].num, list2[i].txt);
-
+		
+	fclose(fout);
 	return 0;
 }
-- 
2.9.3

