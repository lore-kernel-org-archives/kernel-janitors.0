From: Saurabh Badhwar <sbsaurabhbadhwar9@gmail.com>
Date: Mon, 20 Feb 2017 10:58:36 +0000
Subject: [PATCH v2] tools/vm: Fix possible resource leak in page_owner_sort.c
Message-Id: <20170220104636.GA4607@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

The patch addresses explicit closing of file pointers on exit
and redirects the errors to the stderr
Signed-off-by: Saurabh Badhwar <sbsaurabhbadhwar9@gmail.com>
---
 tools/vm/page_owner_sort.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/vm/page_owner_sort.c b/tools/vm/page_owner_sort.c
index 8346261..b3c3efa 100644
--- a/tools/vm/page_owner_sort.c
+++ b/tools/vm/page_owner_sort.c
@@ -109,7 +109,7 @@ int main(int argc, char **argv)
 	list = malloc(max_size * sizeof(*list));
 	buf = malloc(BUF_SIZE);
 	if (!list || !buf) {
-		printf("Out of memory\n");
+		perror("Unable to allocate memory: ");
 		fclose(fin);
 		fclose(fout);
 		exit(1);
@@ -145,8 +145,8 @@ int main(int argc, char **argv)
 	qsort(list2, count, sizeof(list[0]), compare_num);
 
 	for (i = 0; i < count; i++)
-		fprintf(fout, "%d times:\n%s\n", list2[i].num, list2[i].txt);
-		
+		fprintf(fout, "%d times:\n%s\n", list2[i].num, list2[i].txt);	
+	
 	fclose(fout);
 	return 0;
 }
-- 
2.9.3

