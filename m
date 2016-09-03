From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 03 Sep 2016 05:34:38 +0000
Subject: [PATCH] fs/pnode.c: Simplify code
Message-Id: <1472880878-29273-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: viro@zeniv.linux.org.uk
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Calling 'list_splice' followed by 'INIT_LIST_HEAD' is equivalent to
'list_splice_init'.

This has been spotted with the following coccinelle script:
/////
@@
expression y,z;
@@

-   list_splice(y,z);
-   INIT_LIST_HEAD(y);
+   list_splice_init(y,z);

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/pnode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/pnode.c b/fs/pnode.c
index 99899705b105..3d3513ee4380 100644
--- a/fs/pnode.c
+++ b/fs/pnode.c
@@ -97,8 +97,8 @@ static int do_make_slave(struct mount *mnt)
 		list_for_each_entry(slave_mnt, &mnt->mnt_slave_list, mnt_slave)
 			slave_mnt->mnt_master = master;
 		list_move(&mnt->mnt_slave, &master->mnt_slave_list);
-		list_splice(&mnt->mnt_slave_list, master->mnt_slave_list.prev);
-		INIT_LIST_HEAD(&mnt->mnt_slave_list);
+		list_splice_init(&mnt->mnt_slave_list,
+				 master->mnt_slave_list.prev);
 	} else {
 		struct list_head *p = &mnt->mnt_slave_list;
 		while (!list_empty(p)) {
-- 
2.7.4

