From: Julia Lawall <julia@diku.dk>
Date: Mon, 24 Mar 2008 18:08:48 +0000
Subject: [PATCH 1/5] fs/gfs2: test for IS_ERR rather than 0
Message-Id: <Pine.LNX.4.64.0803241908210.32740@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: swhiteho@redhat.com, cluster-devel@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The function gfs2_inode_lookup always returns either a valid pointer or a
value made with ERR_PTR, so its result should be tested with IS_ERR, not
with a test for 0.


The problem was found using the following semantic match.
(http://www.emn.fr/x-info/coccinelle/)

//<smpl>
@a@
expression E, E1;
statement S,S1;
position p;
@@

E = gfs2_inode_lookup(...)
... when != E = E1
if@p (E) S else S1

@n@
position a.p;
expression E,E1;
statement S,S1;
@@

E = NULL
... when != E = E1
if@p (E) S else S1

@depends on !n@
expression E;
statement S,S1;
position a.p;
@@

* if@p (E)
  S else S1
//</smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---
 fs/gfs2/ops_export.c |    2 --
 1 file changed, 2 deletions(-)

diff -u -p a/fs/gfs2/ops_export.c b/fs/gfs2/ops_export.c
--- a/fs/gfs2/ops_export.c	2008-03-12 14:13:14.000000000 +0100
+++ b/fs/gfs2/ops_export.c	2008-03-24 16:04:41.000000000 +0100
@@ -204,8 +204,6 @@ static struct dentry *gfs2_get_dentry(st
 	inode = gfs2_inode_lookup(sb, DT_UNKNOWN,
 					inum->no_addr,
 					0, 0);
-	if (!inode)
-		goto fail;
 	if (IS_ERR(inode)) {
 		error = PTR_ERR(inode);
 		goto fail;
