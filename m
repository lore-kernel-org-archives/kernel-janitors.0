From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 12 Feb 2019 07:58:31 +0000
Subject: [PATCH -next] LSM: fix return value check in safesetid_init_securityfs()
Message-Id: <20190212075831.114668-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Kees Cook <keescook@chromium.org>, Micah Morton <mortonm@chromium.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org

In case of error, the function securityfs_create_dir() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

Fixes: aeca4e2ca65c ("LSM: add SafeSetID module that gates setid calls")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 security/safesetid/securityfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/safesetid/securityfs.c b/security/safesetid/securityfs.c
index 61be4ee459cc..2c6c829be044 100644
--- a/security/safesetid/securityfs.c
+++ b/security/safesetid/securityfs.c
@@ -167,7 +167,7 @@ static int __init safesetid_init_securityfs(void)
 		return 0;
 
 	safesetid_policy_dir = securityfs_create_dir("safesetid", NULL);
-	if (!safesetid_policy_dir) {
+	if (IS_ERR(safesetid_policy_dir)) {
 		ret = PTR_ERR(safesetid_policy_dir);
 		goto error;
 	}
