From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 13 Aug 2017 14:48:10 +0000
Subject: [PATCH 3/4] selinux: Delete an unnecessary return statement in ebitmap_destroy()
Message-Id: <230e56f6-3dd9-5e6e-fa06-df22d61e0831@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e9f47cc9-fda7-dc54-bca9-cae6488914e0@users.sourceforge.net>
In-Reply-To: <e9f47cc9-fda7-dc54-bca9-cae6488914e0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 13 Aug 2017 15:50:26 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: void function return statements are not generally useful

Thus remove such a statement in the affected function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 security/selinux/ss/ebitmap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/security/selinux/ss/ebitmap.c b/security/selinux/ss/ebitmap.c
index 03581d7ef817..697bd748760a 100644
--- a/security/selinux/ss/ebitmap.c
+++ b/security/selinux/ss/ebitmap.c
@@ -339,7 +339,6 @@ void ebitmap_destroy(struct ebitmap *e)
 
 	e->highbit = 0;
 	e->node = NULL;
-	return;
 }
 
 int ebitmap_read(struct ebitmap *e, void *fp)
-- 
2.14.0

