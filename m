From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Jan 2018 14:04:51 +0000
Subject: [PATCH 2/2] nfsd: Adjust four function calls together with a variable assignment
Message-Id: <9f4ab241-a84a-0db5-6915-9e72bdbc24b0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <43df7d8b-f37e-91ca-9c8c-96e318adeb4f@users.sourceforge.net>
In-Reply-To: <43df7d8b-f37e-91ca-9c8c-96e318adeb4f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-nfs@vger.kernel.org, Jeff Layton <jlayton@kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Jan 2018 14:40:44 +0100

The script "checkpatch.pl" pointed information out like the following.

ERROR: do not use assignment in if condition

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/nfsd/export.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/fs/nfsd/export.c b/fs/nfsd/export.c
index 3b035a87e4c4..8ab1383bf3ea 100644
--- a/fs/nfsd/export.c
+++ b/fs/nfsd/export.c
@@ -90,7 +90,8 @@ static int expkey_parse(struct cache_detail *cd, char *mesg, int mlen)
 		goto out;
 
 	err = -EINVAL;
-	if ((len=qword_get(&mesg, buf, PAGE_SIZE)) <= 0)
+	len = qword_get(&mesg, buf, PAGE_SIZE);
+	if (len <= 0)
 		goto out;
 
 	err = -ENOENT;
@@ -100,7 +101,8 @@ static int expkey_parse(struct cache_detail *cd, char *mesg, int mlen)
 	dprintk("found domain %s\n", buf);
 
 	err = -EINVAL;
-	if ((len=qword_get(&mesg, buf, PAGE_SIZE)) <= 0)
+	len = qword_get(&mesg, buf, PAGE_SIZE);
+	if (len <= 0)
 		goto out;
 	fsidtype = simple_strtoul(buf, &ep, 10);
 	if (*ep)
@@ -108,7 +110,9 @@ static int expkey_parse(struct cache_detail *cd, char *mesg, int mlen)
 	dprintk("found fsidtype %d\n", fsidtype);
 	if (key_len(fsidtype)=0) /* invalid type */
 		goto out;
-	if ((len=qword_get(&mesg, buf, PAGE_SIZE)) <= 0)
+
+	len = qword_get(&mesg, buf, PAGE_SIZE);
+	if (len <= 0)
 		goto out;
 	dprintk("found fsid length %d\n", len);
 	if (len != key_len(fsidtype))
@@ -538,7 +542,8 @@ static int svc_export_parse(struct cache_detail *cd, char *mesg, int mlen)
 
 	/* path */
 	err = -EINVAL;
-	if ((len = qword_get(&mesg, buf, PAGE_SIZE)) <= 0)
+	len = qword_get(&mesg, buf, PAGE_SIZE);
+	if (len <= 0)
 		goto out1;
 
 	err = kern_path(buf, 0, &exp.ex_path);
-- 
2.15.1

