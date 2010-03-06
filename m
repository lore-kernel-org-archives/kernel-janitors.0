From: Dan Carpenter <error27@gmail.com>
Date: Sat, 06 Mar 2010 11:21:25 +0000
Subject: [patch] security: ima_file_mmap() don't just return zero
Message-Id: <20100306112125.GN4958@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mimi Zohar <zohar@us.ibm.com>
Cc: James Morris <jmorris@namei.org>, Eric Paris <eparis@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, "J.R. Okajima" <hooanon05@yahoo.co.jp>, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

It seems like we should return an error here.  That's what the comment
says we should do.

I also removed an out of date comment.  It wasn't needed and seemed likely
to get out of date again.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This was found with a static checker and I have only compile tested it.
The callers all seem to use the return code, but please review carefully.
The code has been like this since the module was merged.

diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index 294b005..90d5314 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -260,18 +260,17 @@ out:
  * policy decision.
  *
  * Return 0 on success, an error code on failure.
- * (Based on the results of appraise_measurement().)
  */
 int ima_file_mmap(struct file *file, unsigned long prot)
 {
-	int rc;
+	int rc = 0;
 
 	if (!file)
 		return 0;
 	if (prot & PROT_EXEC)
 		rc = process_measurement(file, file->f_dentry->d_name.name,
 					 MAY_EXEC, FILE_MMAP);
-	return 0;
+	return rc;
 }
 
 /**
