From: Yunfeng Ye <yeyunfeng@huawei.com>
Date: Fri, 08 May 2020 10:52:53 +0000
Subject: [PATCH v3] tools/bootconfig: fix resource leak in apply_xbc()
Message-Id: <3569aa33-8963-966d-9247-ec79b3b3d56d@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mhiramat@kernel.org, rostedt@goodmis.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Markus.Elfring@web.de, dan.carpenter@oracle.com, Shiyuan Hu <hushiyuan@huawei.com>, Hewenliang <hewenliang4@huawei.com>

Fix the @data and @fd allocations that are leaked in the error path of
apply_xbc().

Fixes: 85c46b78da58 ("bootconfig: Add bootconfig magic word for indicating bootconfig explicitly")
Fixes: 950313ebf79c ("tools: bootconfig: Add bootconfig command")
Acked-by: Masami Hiramatsu <mhiramat@kernel.org>
Signed-off-by: Yunfeng Ye <yeyunfeng@huawei.com>
Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
v2 -> v3:
 - set 'ret' to 0 before returning on success

v1 -> v2:
 - complete the error handling at other error path
 - add "Fixes" tag

 tools/bootconfig/main.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tools/bootconfig/main.c b/tools/bootconfig/main.c
index 16b9a420e6fd..17a9837dcfaa 100644
--- a/tools/bootconfig/main.c
+++ b/tools/bootconfig/main.c
@@ -314,31 +314,35 @@ int apply_xbc(const char *path, const char *xbc_path)
 	ret = delete_xbc(path);
 	if (ret < 0) {
 		pr_err("Failed to delete previous boot config: %d\n", ret);
-		return ret;
+		goto free_data;
 	}

 	/* Apply new one */
 	fd = open(path, O_RDWR | O_APPEND);
 	if (fd < 0) {
 		pr_err("Failed to open %s: %d\n", path, fd);
-		return fd;
+		ret = fd;
+		goto free_data;
 	}
 	/* TODO: Ensure the @path is initramfs/initrd image */
 	ret = write(fd, data, size + 8);
 	if (ret < 0) {
 		pr_err("Failed to apply a boot config: %d\n", ret);
-		return ret;
+		goto close_fd;
 	}
 	/* Write a magic word of the bootconfig */
 	ret = write(fd, BOOTCONFIG_MAGIC, BOOTCONFIG_MAGIC_LEN);
-	if (ret < 0) {
+	if (ret < 0)
 		pr_err("Failed to apply a boot config magic: %d\n", ret);
-		return ret;
-	}
+
+	ret = 0;
+
+close_fd:
 	close(fd);
+free_data:
 	free(data);

-	return 0;
+	return ret;
 }

 int usage(void)
-- 
1.8.3.1
