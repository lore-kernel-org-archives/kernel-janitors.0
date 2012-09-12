From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 12 Sep 2012 15:06:39 +0000
Subject: [PATCH 1/9] drivers/block/aoe/aoecmd.c: Remove useless kfree
Message-Id: <1347462407-13499-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Ed L. Cashin" <ecashin@coraid.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

Remove useless kfree() and clean up code related to the removal.

The semantic patch that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
position p1,p2;
expression x;
@@

if (x@p1 = NULL) { ... kfree@p2(x); ... return ...; }

@unchanged exists@
position r.p1,r.p2;
expression e <= r.x,x,e1;
iterator I;
statement S;
@@

if (x@p1 = NULL) { ... when != I(x,...) S
                        when != e = e1
                        when != e += e1
                        when != e -= e1
                        when != ++e
                        when != --e
                        when != e++
                        when != e--
                        when != &e
   kfree@p2(x); ... return ...; }

@ok depends on unchanged exists@
position any r.p1;
position r.p2;
expression x;
@@

... when != true x@p1 = NULL
kfree@p2(x);

@depends on !ok && unchanged@
position r.p2;
expression x;
@@

*kfree@p2(x);
// </smpl>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/block/aoe/aoecmd.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/aoe/aoecmd.c b/drivers/block/aoe/aoecmd.c
index 5461faa..cbb0521 100644
--- a/drivers/block/aoe/aoecmd.c
+++ b/drivers/block/aoe/aoecmd.c
@@ -1257,7 +1257,6 @@ addtgt(struct aoedev *d, char *addr, ulong nframes)
 	}
 	t = kcalloc(1, sizeof *t, GFP_ATOMIC);
 	if (!t) {
-		kfree(t);
 		printk(KERN_INFO "aoe: cannot allocate memory to add target\n");
 		return NULL;
 	}

