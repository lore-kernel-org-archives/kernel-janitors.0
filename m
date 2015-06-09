From: Firo Yang <firogm@gmail.com>
Date: Tue, 09 Jun 2015 07:49:56 +0000
Subject: [PATCH v2] perf tools: Add error handling
Message-Id: <1433836196-20647-1-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Add error handling code for snprintf and rename in check_backup.

Signed-off-by: Firo Yang <firogm@gmail.com>
---
Since there is  no suitable error code snprintf, I just return the 
value returned by snprintf.

 tools/perf/util/data.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/data.c b/tools/perf/util/data.c
index 1921942..26ab45a 100644
--- a/tools/perf/util/data.c
+++ b/tools/perf/util/data.c
@@ -32,15 +32,26 @@ static bool check_pipe(struct perf_data_file *file)
 
 static int check_backup(struct perf_data_file *file)
 {
+	int ret;
 	struct stat st;
 
 	if (!stat(file->path, &st) && st.st_size) {
-		/* TODO check errors properly */
 		char oldname[PATH_MAX];
-		snprintf(oldname, sizeof(oldname), "%s.old",
+		ret = snprintf(oldname, sizeof(oldname), "%s.old",
 			 file->path);
+		if (ret < 0) {
+			pr_err("failed to make name %s.old\n", file->path);
+			return ret;
+		}
+
 		unlink(oldname);
-		rename(file->path, oldname);
+
+		ret = rename(file->path, oldname);
+		if (ret < 0) {
+			pr_err("failed to rename %s to %s\n", file->path,
+				oldname);
+			return -errno;
+		}
 	}
 
 	return 0;
-- 
2.4.2

