From: Julia Lawall <julia@diku.dk>
Date: Sat, 19 Dec 2009 07:16:13 +0000
Subject: [PATCH 1/7] drivers/block/aoe: Use kzalloc for allocating only one
Message-Id: <Pine.LNX.4.64.0912190815550.30546@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ecashin@coraid.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use kzalloc rather than kcalloc(1,...)

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
@@

- kcalloc(1,
+ kzalloc(
          ...)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/block/aoe/aoecmd.c |    2 +-
 drivers/block/aoe/aoedev.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/block/aoe/aoecmd.c b/drivers/block/aoe/aoecmd.c
--- a/drivers/block/aoe/aoecmd.c 2009-12-08 20:58:27.000000000 +0100
+++ b/drivers/block/aoe/aoecmd.c 2009-12-19 07:52:28.000000000 +0100
@@ -954,7 +954,7 @@ addtgt(struct aoedev *d, char *addr, ulo
 			"aoe: device addtgt failure; too many targets\n");
 		return NULL;
 	}
-	t = kcalloc(1, sizeof *t, GFP_ATOMIC);
+	t = kzalloc(sizeof *t, GFP_ATOMIC);
 	f = kcalloc(nframes, sizeof *f, GFP_ATOMIC);
 	if (!t || !f) {
 		kfree(f);
diff -u -p a/drivers/block/aoe/aoedev.c b/drivers/block/aoe/aoedev.c
--- a/drivers/block/aoe/aoedev.c 2009-09-14 14:55:49.000000000 +0200
+++ b/drivers/block/aoe/aoedev.c 2009-12-19 07:52:28.000000000 +0100
@@ -211,7 +211,7 @@ aoedev_by_sysminor_m(ulong sysminor)
 			break;
 	if (d)
 		goto out;
-	d = kcalloc(1, sizeof *d, GFP_ATOMIC);
+	d = kzalloc(sizeof *d, GFP_ATOMIC);
 	if (!d)
 		goto out;
 	INIT_WORK(&d->work, aoecmd_sleepwork);
