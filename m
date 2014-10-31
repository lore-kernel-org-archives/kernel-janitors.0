From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 31 Oct 2014 10:40:39 +0000
Subject: [patch 1/2] staging: r8188eu: get a string from the user correctly
Message-Id: <20141031104039.GA27683@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The original code had two bugs:
1) It didn't check if the string was zero length so it could oops when
   it tried to dereference the ZERO_SIZE_PTR.
2) It didn't enforce that the string was NUL terminated.

It was also messy as pants.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I assume that hopefully the users were passing NUL terminated strings
and this patch to put a NUL terminator at the end doesn't change
anything.  This is a static checker fix.

diff --git a/drivers/staging/rtl8188eu/os_dep/rtw_android.c b/drivers/staging/rtl8188eu/os_dep/rtw_android.c
index d9d55d1..b403178 100644
--- a/drivers/staging/rtl8188eu/os_dep/rtw_android.c
+++ b/drivers/staging/rtl8188eu/os_dep/rtw_android.c
@@ -162,22 +162,12 @@ int rtw_android_priv_cmd(struct net_device *net, struct ifreq *ifr, int cmd)
 		ret = -EFAULT;
 		goto exit;
 	}
-	command = kmalloc(priv_cmd.total_len, GFP_KERNEL);
-	if (!command) {
-		DBG_88E("%s: failed to allocate memory\n", __func__);
-		ret = -ENOMEM;
-		goto exit;
-	}
-	if (!access_ok(VERIFY_READ, priv_cmd.buf, priv_cmd.total_len)) {
-		DBG_88E("%s: failed to access memory\n", __func__);
-		ret = -EFAULT;
-		goto exit;
-	}
-	if (copy_from_user(command, (char __user *)priv_cmd.buf,
-			   priv_cmd.total_len)) {
-		ret = -EFAULT;
-		goto exit;
-	}
+	if (priv_cmd.total_len < 1)
+		return -EINVAL;
+	command = memdup_user(priv_cmd.buf, priv_cmd.total_len);
+	if (IS_ERR(command))
+		return PTR_ERR(command);
+	command[priv_cmd.total_len - 1] = 0;
 	DBG_88E("%s: Android private cmd \"%s\" on %s\n",
 		__func__, command, ifr->ifr_name);
 	cmd_num = rtw_android_cmdstr_to_num(command);
