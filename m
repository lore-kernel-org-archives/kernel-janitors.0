From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Dec 2016 10:45:24 +0000
Subject: [patch] orangefs: cleanup orangefs_debugfs_new_client_string()
Message-Id: <20161216104524.GA2637@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marshall <hubcap@omnibond.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Several small things in this function:
1) If copy to user fails we should return -EFAULT not -EIO
2) Don't print an error message, just fail.  It's annoying to let the
   users fill up dmesg and especially for something small like this.
3) Remove a stray tab.
4) Preserve the error code if orangefs_prepare_debugfs_help_string()
   fails.
5) "return 0;" is more explicit and clear than "return ret;".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugfs.c
index 27e75cf28b3a..409fa6b0d339 100644
--- a/fs/orangefs/orangefs-debugfs.c
+++ b/fs/orangefs/orangefs-debugfs.c
@@ -966,15 +966,9 @@ int orangefs_debugfs_new_client_string(void __user *arg)
 {
 	int ret;
 
-	ret = copy_from_user(&client_debug_array_string,
-                                     (void __user *)arg,
-                                     ORANGEFS_MAX_DEBUG_STRING_LEN);
-
-	if (ret != 0) {
-		pr_info("%s: CLIENT_STRING: copy_from_user failed\n",
-			__func__);
-		return -EIO;
-	}
+	if (copy_from_user(&client_debug_array_string, arg,
+			   ORANGEFS_MAX_DEBUG_STRING_LEN))
+		return -EFAULT;
 
 	/*
 	 * The real client-core makes an effort to ensure
@@ -988,17 +982,18 @@ int orangefs_debugfs_new_client_string(void __user *arg)
 	 */
 	client_debug_array_string[ORANGEFS_MAX_DEBUG_STRING_LEN - 1]  		'\0';
-	
+
 	pr_info("%s: client debug array string has been received.\n",
 		__func__);
 
 	if (!help_string_initialized) {
 
 		/* Build a proper debug help string. */
-		if (orangefs_prepare_debugfs_help_string(0)) {
+		ret = orangefs_prepare_debugfs_help_string(0);
+		if (ret) {
 			gossip_err("%s: no debug help string \n",
 				   __func__);
-			return -EIO;
+			return ret;
 		}
 
 	}
@@ -1011,7 +1006,7 @@ int orangefs_debugfs_new_client_string(void __user *arg)
 
 	help_string_initialized++;
 
-	return ret;
+	return 0;
 }
 
 int orangefs_debugfs_new_debug(void __user *arg) 
