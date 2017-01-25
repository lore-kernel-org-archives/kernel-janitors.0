From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 25 Jan 2017 09:33:12 +0000
Subject: [PATCH 2/3] ima_fs: Reorder input parameter validation in ima_write_policy()
Message-Id: <4f91be7b-a983-de6c-1f79-5266dcf5157e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e06d5392-5262-2d88-aa6b-79e53a20fc8b@users.sourceforge.net>
In-Reply-To: <e06d5392-5262-2d88-aa6b-79e53a20fc8b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ima-devel@lists.sourceforge.net, linux-ima-user@lists.sourceforge.net, linux-security-module@vger.kernel.org, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, James Morris <james.l.morris@oracle.com>, Mimi Zohar <zohar@linux.vnet.ibm.com>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Jan 2017 22:38:00 +0100

Move validation for the input parameter "ppos" to the beginning in this
function so that a following check for the input parameter "datalen"
can be occasionally avoided earlier.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 security/integrity/ima/ima_fs.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/security/integrity/ima/ima_fs.c b/security/integrity/ima/ima_fs.c
index c1c8d34d111d..98304411915d 100644
--- a/security/integrity/ima/ima_fs.c
+++ b/security/integrity/ima/ima_fs.c
@@ -315,15 +315,14 @@ static ssize_t ima_write_policy(struct file *file, const char __user *buf,
 	char *data;
 	ssize_t result;
 
-	if (datalen >= PAGE_SIZE)
-		datalen = PAGE_SIZE - 1;
-
 	/* No partial writes. */
 	result = -EINVAL;
 	if (*ppos != 0)
 		goto reset_validity;
 
 	result = -ENOMEM;
+	if (datalen >= PAGE_SIZE)
+		datalen = PAGE_SIZE - 1;
 	data = kmalloc(datalen + 1, GFP_KERNEL);
 	if (!data)
 		goto reset_validity;
-- 
2.11.0

