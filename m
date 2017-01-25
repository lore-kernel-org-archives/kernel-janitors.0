From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 25 Jan 2017 09:31:43 +0000
Subject: [PATCH 1/3] ima_fs: One check less in ima_write_policy() after error detection
Message-Id: <28a6918c-5714-cec8-2df7-85bcc37e4d75@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e06d5392-5262-2d88-aa6b-79e53a20fc8b@users.sourceforge.net>
In-Reply-To: <e06d5392-5262-2d88-aa6b-79e53a20fc8b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ima-devel@lists.sourceforge.net, linux-ima-user@lists.sourceforge.net, linux-security-module@vger.kernel.org, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, James Morris <james.l.morris@oracle.com>, Mimi Zohar <zohar@linux.vnet.ibm.com>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Jan 2017 20:30:55 +0100

Move the jump label directly before the desired assignment for the
variable "valid_policy" at the end so that the variable "result" will not
be checked once more after it was determined that a received input
parameter was not zero or a memory allocation failed.
Use the identifier "reset_validity" instead of the label "out".

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 security/integrity/ima/ima_fs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/security/integrity/ima/ima_fs.c b/security/integrity/ima/ima_fs.c
index ca303e5d2b94..c1c8d34d111d 100644
--- a/security/integrity/ima/ima_fs.c
+++ b/security/integrity/ima/ima_fs.c
@@ -321,12 +321,12 @@ static ssize_t ima_write_policy(struct file *file, const char __user *buf,
 	/* No partial writes. */
 	result = -EINVAL;
 	if (*ppos != 0)
-		goto out;
+		goto reset_validity;
 
 	result = -ENOMEM;
 	data = kmalloc(datalen + 1, GFP_KERNEL);
 	if (!data)
-		goto out;
+		goto reset_validity;
 
 	*(data + datalen) = '\0';
 
@@ -353,8 +353,8 @@ static ssize_t ima_write_policy(struct file *file, const char __user *buf,
 	mutex_unlock(&ima_write_mutex);
 out_free:
 	kfree(data);
-out:
 	if (result < 0)
+reset_validity:
 		valid_policy = 0;
 
 	return result;
-- 
2.11.0

