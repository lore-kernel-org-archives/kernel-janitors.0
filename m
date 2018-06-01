From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Jun 2018 08:00:05 +0000
Subject: [PATCH] EVM: unlock on error path in evm_read_xattrs()
Message-Id: <20180601075946.wpyly2mgmaynfm4c@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mimi Zohar <zohar@linux.vnet.ibm.com>, Matthew Garrett <mjg59@google.com>
Cc: James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to unlock before returning on this error path.

Fixes: fa516b66a1bf ("EVM: Allow runtime modification of the set of verified xattrs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/security/integrity/evm/evm_secfs.c b/security/integrity/evm/evm_secfs.c
index a7a0a1acae99..6d3b34ae8499 100644
--- a/security/integrity/evm/evm_secfs.c
+++ b/security/integrity/evm/evm_secfs.c
@@ -147,8 +147,10 @@ static ssize_t evm_read_xattrs(struct file *filp, char __user *buf,
 		size += strlen(xattr->name) + 1;
 
 	temp = kmalloc(size + 1, GFP_KERNEL);
-	if (!temp)
+	if (!temp) {
+		mutex_unlock(&xattr_list_mutex);
 		return -ENOMEM;
+	}
 
 	list_for_each_entry(xattr, &evm_config_xattrnames, list) {
 		sprintf(temp + offset, "%s\n", xattr->name);
