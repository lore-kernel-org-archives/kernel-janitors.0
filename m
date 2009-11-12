From: Julia Lawall <julia@diku.dk>
Date: Thu, 12 Nov 2009 10:14:02 +0000
Subject: Re: [PATCH 4/4] fs/qnx4: decrement sizeof size in strncmp
Message-Id: <Pine.LNX.4.64.0911121113190.19166@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911120849260.16627@ask.diku.dk>
 <1258017918l.26867l.0l@i-dmzi_al.realan.de>
In-Reply-To: <1258017918l.26867l.0l@i-dmzi_al.realan.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Larsen <al@alarsen.net>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

As an identical match is wanted in this case, strcmp can be used instead.

The semantic match that lead to detecting this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression foo;
constant char *abc;
@@

*strncmp(foo, abc, sizeof(abc))
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 fs/qnx4/inode.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/fs/qnx4/inode.c b/fs/qnx4/inode.c
index 449f5a6..150f4af 100644
--- a/fs/qnx4/inode.c
+++ b/fs/qnx4/inode.c
@@ -221,7 +221,8 @@ static const char *qnx4_checkroot(struct super_block *sb)
 				rootdir = (struct qnx4_inode_entry *) (bh->b_data + i * QNX4_DIR_ENTRY_SIZE);
 				if (rootdir->di_fname != NULL) {
 					QNX4DEBUG((KERN_INFO "rootdir entry found : [%s]\n", rootdir->di_fname));
-					if (!strncmp(rootdir->di_fname, QNX4_BMNAME, sizeof QNX4_BMNAME)) {
+					if (!strcmp(rootdir->di_fname,
+						    QNX4_BMNAME)) {
 						found = 1;
 						qnx4_sb(sb)->BitMap = kmalloc( sizeof( struct qnx4_inode_entry ), GFP_KERNEL );
 						if (!qnx4_sb(sb)->BitMap) {
