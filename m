From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 31 Oct 2014 10:41:05 +0000
Subject: [patch 2/2] staging: r8188eu: cleanups in rtw_android_set_block()
Message-Id: <20141031104105.GB27683@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

1) We can tighten up the code a little by returning directly and it
   makes the code more future proof and easier to read.
2) "free" is a better name than "exit".
3) sizeof(priv_cmd) is shorter and more clear than sizeof(struct
   android_wifi_priv_cmd).

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8188eu/os_dep/rtw_android.c b/drivers/staging/rtl8188eu/os_dep/rtw_android.c
index b403178..99ce077 100644
--- a/drivers/staging/rtl8188eu/os_dep/rtw_android.c
+++ b/drivers/staging/rtl8188eu/os_dep/rtw_android.c
@@ -148,20 +148,15 @@ static int rtw_android_set_block(struct net_device *net, char *command,
 int rtw_android_priv_cmd(struct net_device *net, struct ifreq *ifr, int cmd)
 {
 	int ret = 0;
-	char *command = NULL;
+	char *command;
 	int cmd_num;
 	int bytes_written = 0;
 	struct android_wifi_priv_cmd priv_cmd;
 
-	if (!ifr->ifr_data) {
-		ret = -EINVAL;
-		goto exit;
-	}
-	if (copy_from_user(&priv_cmd, ifr->ifr_data,
-			   sizeof(struct android_wifi_priv_cmd))) {
-		ret = -EFAULT;
-		goto exit;
-	}
+	if (!ifr->ifr_data)
+		return -EINVAL;
+	if (copy_from_user(&priv_cmd, ifr->ifr_data, sizeof(priv_cmd)))
+		return -EFAULT;
 	if (priv_cmd.total_len < 1)
 		return -EINVAL;
 	command = memdup_user(priv_cmd.buf, priv_cmd.total_len);
@@ -181,7 +176,7 @@ int rtw_android_priv_cmd(struct net_device *net, struct ifreq *ifr, int cmd)
 		DBG_88E("%s: Ignore private cmd \"%s\" - iface %s is down\n",
 			__func__, command, ifr->ifr_name);
 		ret = 0;
-		goto exit;
+		goto free;
 	}
 	switch (cmd_num) {
 	case ANDROID_WIFI_CMD_STOP:
@@ -269,7 +264,7 @@ response:
 	} else {
 		ret = bytes_written;
 	}
-exit:
+free:
 	kfree(command);
 	return ret;
 }
