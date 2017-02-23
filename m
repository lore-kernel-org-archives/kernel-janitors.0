From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 23 Feb 2017 10:39:59 +0000
Subject: [patch] ceph: tidy some white space in get_nonsnap_parent()
Message-Id: <20170223103852.GA27418@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Yan, Zheng" <zyan@redhat.com>
Cc: Sage Weil <sage@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

The white space here seems slightly messed up.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ceph/mds_client.c b/fs/ceph/mds_client.c
index fdbc3544e41c..c681762d76e6 100644
--- a/fs/ceph/mds_client.c
+++ b/fs/ceph/mds_client.c
@@ -679,8 +679,9 @@ static void __unregister_request(struct ceph_mds_client *mdsc,
  * working with them. Once we hit a candidate dentry, we attempt to take a
  * reference to it, and return that as the result.
  */
-static struct inode *get_nonsnap_parent(struct dentry *dentry) { struct inode
-	*inode = NULL;
+static struct inode *get_nonsnap_parent(struct dentry *dentry)
+{
+	struct inode *inode = NULL;
 
 	while (dentry && !IS_ROOT(dentry)) {
 		inode = d_inode_rcu(dentry);
