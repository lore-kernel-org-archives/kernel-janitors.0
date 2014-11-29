From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 29 Nov 2014 16:03:54 +0000
Subject: [PATCH 1/1] fs-namei: Deletion of an unnecessary check before the function call "iput"
Message-Id: <5479EE6A.8080904@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.so
 urceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 29 Nov 2014 17:00:21 +0100

The iput() function tests whether its argument is NULL and then
returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/namei.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index ca81416..ce69074 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -3759,8 +3759,7 @@ exit2:
 		dput(dentry);
 	}
 	mutex_unlock(&nd.path.dentry->d_inode->i_mutex);
-	if (inode)
-		iput(inode);	/* truncate the inode here */
+	iput(inode);	/* truncate the inode here */
 	inode = NULL;
 	if (delegated_inode) {
 		error = break_deleg_wait(&delegated_inode);
-- 
2.1.3

