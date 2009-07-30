From: Julia Lawall <julia@diku.dk>
Date: Thu, 30 Jul 2009 14:08:34 +0000
Subject: [PATCH 2/5] fs/hppfs: Add kmalloc NULL tests
Message-Id: <Pine.LNX.4.64.0907301607550.8734@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jdike@addtoit.com, user-mode-linux-devel@lists.sourceforge.net, user-mode-linux-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Test the result of kmalloc using a ! test, as most commonly done elsewhere,
rather than a test on 0.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression *x;
identifier f;
constant char *C;
@@

x = \(kmalloc\|kcalloc\|kzalloc\)(...);
... when != x = NULL
    when != x != NULL
    when != (x || ...)
(
kfree(x)
|
f(...,C,...,x,...)
|
*f(...,x,...)
|
*x->f
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 fs/hppfs/hppfs.c                    |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/hppfs/hppfs.c b/fs/hppfs/hppfs.c
index a5089a6..b705a3c 100644
--- a/fs/hppfs/hppfs.c
+++ b/fs/hppfs/hppfs.c
@@ -385,7 +385,7 @@ static struct hppfs_data *hppfs_get_data(int fd, int filter,
 			break;
 
 		new = kmalloc(sizeof(*data), GFP_KERNEL);
-		if (new = 0) {
+		if (!new) {
 			printk(KERN_ERR "hppfs_get_data : data allocation "
 			       "failed\n");
 			err = -ENOMEM;
