From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 04 Nov 2015 19:48:51 +0000
Subject: [PATCH] sysfs: Delete an unnecessary check before the function call "kernfs_get"
Message-Id: <563A6123.8030506@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 4 Nov 2015 20:44:50 +0100

The kernfs_get() function tests whether its argument is NULL and then
returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/sysfs/group.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index dc1358b..9b34c07 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -388,8 +388,7 @@ int __compat_only_sysfs_link_entry_to_kobj(struct kobject *kobj,
 	 */
 	spin_lock(&sysfs_symlink_target_lock);
 	target = target_kobj->sd;
-	if (target)
-		kernfs_get(target);
+	kernfs_get(target);
 	spin_unlock(&sysfs_symlink_target_lock);
 	if (!target)
 		return -ENOENT;
-- 
2.6.2

