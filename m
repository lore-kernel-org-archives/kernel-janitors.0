From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 11 Jul 2018 13:28:40 +0000
Subject: [PATCH -next] EVM: fix return value check in evm_write_xattrs()
Message-Id: <1531315720-4191-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mimi Zohar <zohar@linux.vnet.ibm.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Matthew Garrett <mjg59@google.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org

In case of error, the function audit_log_start() returns NULL pointer
not ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: fa516b66a1bf ("EVM: Allow runtime modification of the set of verified xattrs")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 security/integrity/evm/evm_secfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/integrity/evm/evm_secfs.c b/security/integrity/evm/evm_secfs.c
index 637eb99..77de71b 100644
--- a/security/integrity/evm/evm_secfs.c
+++ b/security/integrity/evm/evm_secfs.c
@@ -193,8 +193,8 @@ static ssize_t evm_write_xattrs(struct file *file, const char __user *buf,
 		return -E2BIG;
 
 	ab = audit_log_start(NULL, GFP_KERNEL, AUDIT_INTEGRITY_EVM_XATTR);
-	if (IS_ERR(ab))
-		return PTR_ERR(ab);
+	if (!ab)
+		return -ENOMEM;
 
 	xattr = kmalloc(sizeof(struct xattr_list), GFP_KERNEL);
 	if (!xattr) {

