From: Dan Carpenter <error27@gmail.com>
Date: Wed, 25 Aug 2010 07:11:35 +0000
Subject: [patch] ceph: ceph_get_inode() returns an ERR_PTR
Message-Id: <20100825071135.GO29330@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sage Weil <sage@newdream.net>
Cc: Yehuda Sadeh <yehuda@hq.newdream.net>, ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

ceph_get_inode() returns an ERR_PTR and it doesn't return a NULL.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
index 5d893d3..1e623ec 100644
--- a/fs/ceph/inode.c
+++ b/fs/ceph/inode.c
@@ -1229,11 +1229,11 @@ retry_lookup:
 			in = dn->d_inode;
 		} else {
 			in = ceph_get_inode(parent->d_sb, vino);
-			if (in = NULL) {
+			if (IS_ERR(in)) {
 				dout("new_inode badness\n");
 				d_delete(dn);
 				dput(dn);
-				err = -ENOMEM;
+				err = PTR_ERR(in);
 				goto out;
 			}
 			dn = splice_dentry(dn, in, NULL);
