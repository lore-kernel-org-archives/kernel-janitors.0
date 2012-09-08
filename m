From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 08 Sep 2012 09:59:21 +0000
Subject: [patch] aoe: cleanup an allocation a bit
Message-Id: <20120908095921.GD608@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Ed L. Cashin" <ecashin@coraid.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We changed this recently so we can just use kzalloc() here instead of
kcalloc(1, ...).  Kernel style prefers sizeof(*t) over sizeof *t.  The
kfree(t) is a no-op now as well so that can be removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Only applies to linux-next.

diff --git a/drivers/block/aoe/aoecmd.c b/drivers/block/aoe/aoecmd.c
index 5461faa..c0adbbd 100644
--- a/drivers/block/aoe/aoecmd.c
+++ b/drivers/block/aoe/aoecmd.c
@@ -1255,9 +1255,8 @@ addtgt(struct aoedev *d, char *addr, ulong nframes)
 			"aoe: device addtgt failure; too many targets\n");
 		return NULL;
 	}
-	t = kcalloc(1, sizeof *t, GFP_ATOMIC);
+	t = kzalloc(sizeof(*t), GFP_ATOMIC);
 	if (!t) {
-		kfree(t);
 		printk(KERN_INFO "aoe: cannot allocate memory to add target\n");
 		return NULL;
 	}
