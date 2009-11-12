From: Julia Lawall <julia@diku.dk>
Date: Thu, 12 Nov 2009 07:49:44 +0000
Subject: [PATCH 4/4] fs/qnx4: decrement sizeof size in strncmp
Message-Id: <Pine.LNX.4.64.0911120849260.16627@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: al@alarsen.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

As observed by Joe Perches, sizeof of a constant string includes the
trailing 0.  If what is wanted is to check the initial characters of
another string, this trailing 0 should not be taken into account.  If an
exact match is wanted, strcmp should be used instead.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression foo;
constant char *abc;
@@

strncmp(foo, abc, 
- sizeof(abc)
+ sizeof(abc)-1
 )
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 fs/qnx4/inode.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/fs/qnx4/inode.c b/fs/qnx4/inode.c
index 449f5a6..0614b00 100644
--- a/fs/qnx4/inode.c
+++ b/fs/qnx4/inode.c
@@ -221,7 +221,9 @@ static const char *qnx4_checkroot(struct super_block *sb)
 				rootdir = (struct qnx4_inode_entry *) (bh->b_data + i * QNX4_DIR_ENTRY_SIZE);
 				if (rootdir->di_fname != NULL) {
 					QNX4DEBUG((KERN_INFO "rootdir entry found : [%s]\n", rootdir->di_fname));
-					if (!strncmp(rootdir->di_fname, QNX4_BMNAME, sizeof QNX4_BMNAME)) {
+					if (!strncmp(rootdir->di_fname,
+						     QNX4_BMNAME,
+						     sizeof QNX4_BMNAME - 1)) {
 						found = 1;
 						qnx4_sb(sb)->BitMap = kmalloc( sizeof( struct qnx4_inode_entry ), GFP_KERNEL );
 						if (!qnx4_sb(sb)->BitMap) {
