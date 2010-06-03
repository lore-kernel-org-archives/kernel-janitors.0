From: Dan Carpenter <error27@gmail.com>
Date: Thu, 03 Jun 2010 19:09:11 +0000
Subject: [patch] KEYS: Propagate error code instead of returning -EINVAL
Message-Id: <20100603190911.GX5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is from a Smatch check I'm writing.

strncpy_from_user() returns -EFAULT on error so the first change just
silences a warning but doesn't change how the code works.

The other change is a bug fix because install_thread_keyring_to_cred()
can return a variety of errors such as -EINVAL, -EEXIST, -ENOMEM or 
-EKEYREVOKED.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index 13074b4..6261745 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -33,7 +33,7 @@ static int key_get_type_from_user(char *type,
 	ret = strncpy_from_user(type, _type, len);
 
 	if (ret < 0)
-		return -EFAULT;
+		return ret;
 
 	if (ret = 0 || ret >= len)
 		return -EINVAL;
@@ -1080,7 +1080,7 @@ set:
 	return old_setting;
 error:
 	abort_creds(new);
-	return -EINVAL;
+	return ret;
 
 } /* end keyctl_set_reqkey_keyring() */
 
