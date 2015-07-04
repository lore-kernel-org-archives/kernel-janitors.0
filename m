From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 04 Jul 2015 09:26:54 +0000
Subject: [PATCH] fs-namespace: Delete unnecessary checks before the function call "mntput"
Message-Id: <5597A6DE.8040803@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.so
 urceforge.net> <546B2B8A.4090809@users.sourceforge.net>
In-Reply-To: <546B2B8A.4090809@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 4 Jul 2015 11:21:17 +0200

The mntput() function tests whether its argument is NULL and then
returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/namespace.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index e0b2f36..bc689bd 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -2809,12 +2809,8 @@ struct mnt_namespace *copy_mnt_ns(unsigned long flags, struct mnt_namespace *ns,
 			p = next_mnt(p, old);
 	}
 	namespace_unlock();
-
-	if (rootmnt)
-		mntput(rootmnt);
-	if (pwdmnt)
-		mntput(pwdmnt);
-
+	mntput(rootmnt);
+	mntput(pwdmnt);
 	return new_ns;
 }
 
-- 
2.4.5

